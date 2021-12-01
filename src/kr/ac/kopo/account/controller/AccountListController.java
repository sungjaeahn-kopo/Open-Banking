package kr.ac.kopo.account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class AccountListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		AccountDAO dao = new AccountDAO();
		MemberVO member = (MemberVO)session.getAttribute("user");
		
		List<AccountVO> list = dao.selectSJBank(member.getId());
		
		request.setAttribute("list", list);
		System.out.println(list);
		
		return "/jsp/account/accountList.jsp";
	}
	
}
