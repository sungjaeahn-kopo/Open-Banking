package kr.ac.kopo.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 비교할 카카오계정 아이디값 받아옴
		String kakaoId = request.getParameter("kakaoId");
		// 일반 로그인 정보 받아옴
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");

		// 비교 후 이동할 url 저장
		String url = "";

		// kakao 로그인 정보 세션등록
		HttpSession session = request.getSession();

		// 비교할 db의 id값 가져오기
		MemberDAO dao = new MemberDAO();
		MemberVO member = new MemberVO();

		// 일반 로그인일 경우
		if (kakaoId == null || kakaoId == "") {
			member = dao.normLogin(id, pwd);
			
			// 일반 로그인 실패
			if(member == null) {
				url = "redirect:/loginForm.sj";
				
			// 일반 로그인 성공
			} else {
				url = "redirect:/";
				session.setAttribute("user", member);
			}
			
			// 카카오 로그인일 경우
		} else {
			member = dao.confirmKakao(kakaoId);
			// 연동계정 로그인 이력 O
			if(member != null) { // 메인 페이지로 이동
				url = "redirect:/index.sj";
				session.setAttribute("user", member);
				
		/*	// 연동계정 로그인 이력 X	
				
			} else { // 회원가입 페이지로 이동 
				url = "/signup.sj";
			}*/
			}	
		}
		return url;
	}
}
