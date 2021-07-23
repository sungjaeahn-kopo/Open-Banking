package kr.ac.kopo.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class LoginFormController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 카카오 로그인
		System.out.println("카카오로그인");
		System.out.println(request.getParameter("kakaoemail"));
		System.out.println(request.getParameter("kakaoname"));
		System.out.println(request.getParameter("kakaobirth"));
		
		// 카카오 이메일을 kakao id에 저장
		String kakaoId = request.getParameter("kakaoemail");
		
		MemberVO member = new MemberVO();
		MemberDAO dao = new MemberDAO();
		
		// kakaoid를 to의 id로 세팅
		member.setId(kakaoId);
		
		//카카오계정으로 로그인한 적이 있는지 확인
		boolean confirm = dao.confirmKakao(kakaoId);
		String url = "";
		
		if(confirm) {
			// 로그인 했음
			url = "redirect:/";
			// 세션 등록 (제일 중요!)
			HttpSession session = request.getSession();
			session.setAttribute("kakaoid", member.getKakaoId());
			session.setAttribute("name", member.getName());
			session.setAttribute("id", member.getId());
			
		} else {
			//로그인 안했음
			
			HttpSession session = request.getSession();
			MemberVO user = new MemberVO();
			
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			
			user = dao.normLogin(id, password);
			if( user != null) {
				System.out.println("로그인 성공!");
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(1*60); // 1분동안 세션을 유지하고 싶다면, 60 * 60으로 설정
				System.out.println(session.getMaxInactiveInterval());
				url = "redirect:/";
			} else {
				System.out.println("로그인 실패");
				url = "redirect:/jsp/login/loginForm.jsp";
			}
		}
		
		return url;
	}
	
}










