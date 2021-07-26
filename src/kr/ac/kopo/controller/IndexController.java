package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IndexController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String transferResult = (String)session.getAttribute("transferResult");
		String account_number = (String)session.getAttribute("account_number");
		
		session.removeAttribute("transferResult");
		
		request.setAttribute("transferResult", transferResult);
		request.setAttribute("account_number", account_number);
		
		return "/index.jsp";
	}
	
}
