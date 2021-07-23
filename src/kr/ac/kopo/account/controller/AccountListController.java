package kr.ac.kopo.account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;

public class AccountListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		AccountDAO dao=  new AccountDAO();
		
		List<AccountVO> list = dao.selectAll();
		
		request.setAttribute("list", list);
		
		return "/jsp/account/accountList.jsp";
	}
	
}
