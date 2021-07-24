package kr.ac.kopo.account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.CreateRandom;

public class AccountDAO {

	public List<AccountVO> selectAll() {
		
		List<AccountVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select (select bank_name from code_table where bank_code = '094') ");
		sql.append(" as bank_name, a.account_no, a.alias, a.banking_id, ");
		sql.append(" a.reg_date from t_account a, code_table c where a.bank_code = c.bank_code ");
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
		
			while(rs.next()) {
				AccountVO account = new AccountVO();
				account.setBankCode(rs.getString("bank_name"));
				account.setAccountNo(rs.getString("account_no"));
				account.setAlias(rs.getString("alias"));
				account.setId(rs.getString("banking_id"));
				account.setDate(rs.getString("reg_date"));
				
				list.add(account);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean openAccount(String id, String alias, String accountNo, String password) {
		boolean result = false;
		StringBuilder sql = new StringBuilder();

		sql.append(" insert into t_account(banking_id, account_no, bank_code, ");
		sql.append(" alias, account_password) values( ? ,? ");
		sql.append(" , '094', ?, ?) ");
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, accountNo);
			pstmt.setString(3, alias);
			pstmt.setString(4, password);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<AccountVO> transfer(String id) {
		AccountVO account = new AccountVO();
		MemberVO member = new MemberVO();
		List<AccountVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(" select a.account_no, a.bank_name, a.balance, b.name from (select t.account_no, ");
		sql.append(" c.bank_name, t.banking_id, t.balance from t_account t, code_table c where t.bank_code ");
		sql.append(" =c.bank_code and t.banking_id=?) a, banking_login b ");
		sql.append(" where a.banking_id = b.banking_id and b.banking_id=? ");
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				account.setAccountNo(rs.getString("account_no"));
				account.setBalance(rs.getInt("balance"));
				account.setBankCode(rs.getString("bank_name"));
				
				list.add(account);
			}
			// 현재 로그인 중인 계정의 계좌정보를 가져오자
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
}
