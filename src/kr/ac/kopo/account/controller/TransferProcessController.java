package kr.ac.kopo.account.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.account.vo.TransactionVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class TransferProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AccountDAO dao = new AccountDAO();
		MemberVO member = new MemberVO();
		TransactionVO trans = new TransactionVO();
		HttpSession session = request.getSession();
		member = (MemberVO)session.getAttribute("user");
		
		trans.setToAccountNo(request.getParameter("t_account"));
		trans.setBankName(request.getParameter("t_bank")); 
		trans.setToName(request.getParameter("t_owner"));		
		trans.setAmount(request.getParameter("t_amount"));
		
		AccountVO account = dao.transfer(member.getId());
		// 보내는 사람 정보, 보내는 사람 이름, 받는 계좌, 받는 은행, 받는 사람, 송금양
		Map<String, String> map = dao.transferPro(account, member.getName(), trans);
		String money = map.get("money");
		String account_number = map.get("account_number");
		
		
		session.setAttribute("transferResult", money);
		session.setAttribute("account_number", account_number);
		
		return "redirect:/";
	}
	
}
