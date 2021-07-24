package kr.ac.kopo.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

public class SignupProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 카카오 계정 존재시
		MemberVO member = new MemberVO();
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();

		member.setId(request.getParameter("id"));
		member.setName(request.getParameter("name"));
		member.setPassword(request.getParameter("password"));
		member.setPhoneNo(request.getParameter("phone"));
		member.setKakaoId((String)session.getAttribute("kakaoId"));
		
		// text 상자에 입력받은 값 db에 저장시키기
		dao.kakaoSignup(member);
		session.invalidate();
		
		return "/loginForm.sj";
	}
	
}
