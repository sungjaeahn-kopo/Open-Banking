package kr.ac.kopo.account.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.TransactionVO;
import kr.ac.kopo.controller.Controller;

public class TransactionDetailsController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AccountDAO dao = new AccountDAO();
		String accountNo = request.getParameter("accountno");
		/* String id = ((MemberVO)session.getAttribute("user")).getId(); */
		List<TransactionVO> list = new ArrayList<>();
		
		list = dao.transferDetails(accountNo);
		System.out.println("리스트 잘 나오나? : " + list);
		request.setAttribute("list", list);
		
		return "/jsp/account/transactionDetails.jsp";
	}

	
}
