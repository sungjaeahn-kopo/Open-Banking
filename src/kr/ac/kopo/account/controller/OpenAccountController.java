package kr.ac.kopo.account.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.CreateRandom;

public class OpenAccountController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AccountDAO dao = new AccountDAO();
		MemberVO member = new MemberVO();
		
		String accountNo = "094" + "-" + CreateRandom.getRanNo(6, 1) + "-" + CreateRandom.getRanNo(5, 1);
		String password = request.getParameter("password");
		String alias = request.getParameter("alias");
		
		HttpSession session = request.getSession();
		member = (MemberVO)session.getAttribute("user");
		
		dao.openAccount(member.getId(), alias, accountNo, password);
		
		return "redirect:/jsp/account/openAccount.jsp";
	}
	
}
