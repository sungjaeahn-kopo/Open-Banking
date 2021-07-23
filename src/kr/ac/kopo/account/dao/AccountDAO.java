package kr.ac.kopo.account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
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
				String bankCode = rs.getString("bank_name");
				String accountNo = rs.getString("account_no");
				String alias = rs.getString("alias");
				String id = rs.getString("banking_id");
				String date = rs.getString("reg_date");
				
				AccountVO account = new AccountVO();
				account.setBankCode(bankCode);
				account.setAccountNo(accountNo);
				account.setAlias(alias);
				account.setId(id);
				account.setDate(date);
				
				list.add(account);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean openAccount(String alias, String accountNo, String password) {
		boolean result = false;
		StringBuilder sql = new StringBuilder();

		sql.append(" insert into t_account(banking_id, account_no, bank_code, ");
		sql.append(" alias, account_password) values( ? ,? ");
		sql.append(" , '094', ?, ?) ");
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "otter");
			pstmt.setString(2, accountNo);
			pstmt.setString(3, null);
			pstmt.setString(4, password);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
