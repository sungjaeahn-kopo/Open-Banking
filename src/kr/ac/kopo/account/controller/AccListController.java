package kr.ac.kopo.account.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.member.vo.MemberVO;

public class AccListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		AccountDAO dao = new AccountDAO();
		List<AccountVO> account = new ArrayList<>();
		String bankCode = request.getParameter("bankCode");
		MemberVO member = (MemberVO)session.getAttribute("user");
		
		switch(bankCode) {
			case "SJ Bank":
				account = dao.selectSJBank(member.getId());
				break;
			case "JH Bank":
				account = dao.selectJHBank(member.getName());
				break;
			case "YR Bank":
				account = dao.selectYRBank(member.getName());
				break;
			case "SW Bank":
				account = dao.selectSWBank(member.getName());
				break;
		}
		
		String json = new Gson().toJson(account);
		
		request.setAttribute("json", json);
	
		return "/jsp/account/accList.jsp";
	}
	
}
