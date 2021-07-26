package kr.ac.kopo.account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.controller.Controller;

public class TransBalController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AccountDAO dao = new AccountDAO();
		String accountno = request.getParameter("accountno");
		int accountnoR = dao.selectTransB(accountno);
		
		request.setAttribute("balance", accountnoR);
		return "/jsp/account/accountBal.jsp";
	}

	
	
}
