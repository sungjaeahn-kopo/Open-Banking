package kr.ac.kopo.account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class AccountTransferController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 계좌번호 + 예금주를 가져오자
		MemberVO member = new MemberVO();
		AccountDAO dao = new AccountDAO();
		HttpSession session = request.getSession();
		/* System.out.println("유저 : " + session.getAttribute("user")); */
		member = (MemberVO)session.getAttribute("user");
		// 거래 가능한 계좌 출력
		List<AccountVO> list = dao.selectTrans(member.getId());
		System.out.println("여기 list!! " + list);
		/*
		 * System.out.println("세션에서 받아온 객체 : " + member.getId());
		 * System.out.println("세션에서 받아온 객체 : " + member.getName());
		 */
		AccountVO account = dao.transfer(member.getId());
		request.setAttribute("account", account);
		request.setAttribute("list", list);
		return "/jsp/account/accountTransfer.jsp";
	}
	
}
