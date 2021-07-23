package kr.ac.kopo.account.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.util.CreateRandom;

public class OpenAccountController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		AccountDAO dao = new AccountDAO();
		
		String accountNo = CreateRandom.getRanNo(14, 1);
		String password = request.getParameter("password");
		String alias = request.getParameter("alias");
		
		/*
		 * HttpSession session = request.getSession(); session =
		 */
		
		dao.openAccount(alias, accountNo, password);
		
		
		return "redirect:/accountList.sj";
	}
	
}
