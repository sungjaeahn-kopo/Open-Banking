package kr.ac.kopo.account.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.account.vo.TransactionVO;
import kr.ac.kopo.util.ConnectionFactory;

public class AccountDAO {

	public List<AccountVO> selectAll(String id) {
		
		List<AccountVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select (select bank_name from code_table where bank_code = '094') ");
		sql.append(" as bank_name, a.accountno, a.alias, a.banking_id, ");
		sql.append(" a.reg_date from t_account a, code_table c ");
		sql.append(" where a.bank_code = c.bank_code and a.banking_id=? ");
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
		
			while(rs.next()) {
				AccountVO account = new AccountVO();
				account.setBankCode(rs.getString("bank_name"));
				account.setAccountNo(rs.getString("accountno"));
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

		sql.append(" insert into t_account(banking_id, accountno, bank_code, ");
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
	
	public AccountVO transfer(String id) {
		AccountVO account = new AccountVO();
		StringBuilder sql = new StringBuilder();
		sql.append(" select a.accountno, a.bank_name, a.balance, b.name from (select t.accountno, ");
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
				account.setAccountNo(rs.getString("accountno"));
				account.setBalance(rs.getInt("balance"));
				account.setBankCode(rs.getString("bank_name"));
			}
			// 현재 로그인 중인 계정의 계좌정보를 가져오자
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return account;
	}
	// list는 돈 빠져나가는 계좌
	public Map<String, String> transferPro(AccountVO account, String name, TransactionVO trans) {
		//출금
		StringBuilder sql = new StringBuilder();
		StringBuilder sql2 = new StringBuilder();
		Map<String, String> map = new HashMap<String, String>();
		sql.append(" {call transfer(?, ?, ?, ?, ?)} ");
		
		// yr bank
		if(trans.getToAccountNo().startsWith("016")) {
			sql2.append(" {call transfer@yrbank_link(?, ?, ?, ?, ?)} ");
			
		// sw bank	
		} else if (trans.getToAccountNo().startsWith("032")) {
			sql2.append(" {call transfer@swbank_link(?, ?, ?, ?, ?)} ");
			
		// sj bank	
		} else if (trans.getToAccountNo().startsWith("094")) {
			sql2.append(" {call transfer(?, ?, ?, ?, ?)} ");
			
		// jh bank	
		} else {
			sql2.append(" {call transfer@bank_link(?, ?, ?, ?, ?)} ");
			
		}
		
		// 돈새는 계좌번호, 돈 얼마나 새는지, 돈샐 은행, 이체 예금주, 돈받는 계좌번호
			try {
				Connection conn = new ConnectionFactory().getConnection();
				/* CallableStatement cstmt = conn.prepareCall(sql.toString()); */
				CallableStatement cstmt1 = conn.prepareCall(sql.toString());
				CallableStatement cstmt = conn.prepareCall(sql2.toString());

				cstmt1.setString(1, trans.getToAccountNo());
				cstmt1.setString(2, "-" + trans.getAmount());
				cstmt1.setString(3, trans.getBankName());
				cstmt1.setString(4, trans.getToName());
				cstmt1.setString(5, account.getAccountNo());
				cstmt1.executeUpdate();
				
				if(!trans.getToAccountNo().equals(account.getAccountNo())) {
					cstmt.setString(1, account.getAccountNo());
					cstmt.setString(2, trans.getAmount());
					cstmt.setString(3, account.getBankCode());
					cstmt.setString(4, name);
					cstmt.setString(5, trans.getToAccountNo());
					cstmt.executeUpdate();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			map.put("money", trans.getAmount());
			map.put("account_number", trans.getToAccountNo());
			return map;
	}
	
	public List<TransactionVO> transferDetails(String accountNo) {
		// 선택 은행 + 세션 계정 + 선택 계좌에 대한 거래내역 조회
		StringBuilder sql = new StringBuilder();
		List<TransactionVO> list = new ArrayList<>();
		
		// yr bank
		if(accountNo.startsWith("016")) {
			sql.append(" select transaction_no, transaction_code, my_acc_no, trans_money,  ");
			sql.append(" balance, others_name, others_bank_name, others_acc_no, transaction_date ");
			sql.append(" from transaction_history@yrbank_link where my_acc_no = ? order by transaction_no desc ");
			
		// sw bank	
		} else if (accountNo.startsWith("032")) {
			sql.append(" select tran_idx , tran_myaccount, tran_account, tran_type, tran_amount, ");
			sql.append(" tran_date, tran_mybalance, tran_bankname, tran_holder ");
			sql.append(" from transaction_history@swbank_link where tran_account = ? order by tran_idx desc ");
			
		// sj bank	
		} else if (accountNo.startsWith("094")) {
			sql.append(" select trans_no, my_account_no, amount, to_account_no, to_name, trans_date, ");
			sql.append(" bank_name, my_balance from transaction_details where my_account_no = ? order by trans_no desc ");
			
		// jh bank	
		} else {
			sql.append(" select no, transdate, accountno, TRANSACCOUNTNO, amount, balance, debit, ");
			sql.append(" transbank, transname from t_statement@bank_link where accountno = ? order by no desc ");
			
		}
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, accountNo);
			
			ResultSet rs = pstmt.executeQuery();
			
				// yr bank
				if(accountNo.startsWith("016")) {
					/*
					 * sql.
					 * append(" select transaction_no, transaction_code, my_acc_no, trans_money, ");
					 * sql.
					 * append(" balance, others_name, others_bank_name, others_acc_no, transaction_date "
					 * ); sql.
					 * append(" from transaction_history@yrbank_link where my_acc_no = ? order by transaction_no desc "
					 * );
					 */
					while(rs.next()) {
						TransactionVO trans = new TransactionVO();
						trans.setTransNo(rs.getString("transaction_no"));
						trans.setTransAccountNo(rs.getString("my_acc_no"));
						// 보낸 금액
						trans.setAmount(rs.getString("trans_money"));
						trans.setBalance(rs.getInt("balance"));
						trans.setToName(rs.getString("others_name"));
						trans.setBankName(rs.getString("others_bank_name"));
						trans.setToAccountNo(rs.getString("transaction_no"));
						trans.setTransDate(rs.getString("transaction_date"));
					
						list.add(trans);
					}
						
					// sw bank	
				} else if (accountNo.startsWith("032")) {
					/*
					 * sql.
					 * append(" select tran_idx , tran_myaccount, tran_account, tran_type, tran_amount, "
					 * ); sql.append(" tran_date, tran_mybalance, tran_bankname, tran_holder ");
					 * sql.
					 * append(" from transaction_history@swbank_link where tran_account = ? order by tran_idx desc "
					 * );
					 */
					while(rs.next()) {
						TransactionVO trans = new TransactionVO();
						trans.setTransNo(rs.getString("tran_idx"));
						trans.setTransAccountNo(rs.getString("tran_myaccount"));
						trans.setToAccountNo(rs.getString("tran_account"));
						// 보낸 금액
						trans.setAmount(rs.getString("tran_amount"));
						trans.setBalance(rs.getInt("tran_mybalance"));
						trans.setToName(rs.getString("tran_holder"));
						trans.setBankName(rs.getString("tran_bankname"));
						trans.setTransDate(rs.getString("tran_date"));
						
						list.add(trans);
					}

					// sj bank	
				} else if (accountNo.startsWith("094")) {
					/*
					 * sql.
					 * append(" select trans_no, my_account_no, amount, to_account_no, to_name, trans_date, "
					 * ); sql.
					 * append(" bank_name, my_balance from transaction_details where my_account_no = ? order by trans_no desc "
					 * );
					 */
					while(rs.next()) {
						TransactionVO trans = new TransactionVO();
						trans.setTransNo(rs.getString("trans_no"));
						trans.setTransAccountNo(rs.getString("my_account_no"));
						// 보낸 금액
						trans.setAmount(rs.getString("amount"));
						trans.setToAccountNo(rs.getString("to_account_no"));
						trans.setBalance(rs.getInt("my_balance"));
						trans.setToName(rs.getString("to_name"));
						trans.setBankName(rs.getString("bank_name"));
						trans.setTransDate(rs.getString("trans_date"));
						
						list.add(trans);
					}
					
					// jh bank	
				} else {
					/*
					 * sql.
					 * append(" select no, transdate, accountno, TRANSACCOUNTNO, amount, balance, debit, "
					 * ); sql.
					 * append(" transbank, transname from t_statement@bank_link where accountno = ? order by no desc "
					 * );
					 */
					while(rs.next()) {
						TransactionVO trans = new TransactionVO();
						trans.setTransNo(rs.getString("no"));
						trans.setTransAccountNo(rs.getString("accountno"));
						// 보낸 금액
						trans.setAmount(rs.getString("amount"));
						trans.setToAccountNo(rs.getString("TRANSACCOUNTNO"));
						trans.setBalance(rs.getInt("balance"));
						trans.setToName(rs.getString("transname"));
						trans.setBankName(rs.getString("transbank"));
						trans.setTransDate(rs.getString("transdate"));
						
						list.add(trans);
					}
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<AccountVO> selectTrans(String id) {
		List<AccountVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(" select accountno, bank_code, balance from t_account where banking_id=? ");
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AccountVO account = new AccountVO();
				account.setAccountNo(rs.getString("accountno"));
				account.setBankCode(rs.getString("bank_code"));
				account.setBalance(rs.getInt("balance"));
				
				list.add(account);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public int selectTransB(String accountno) {
		int balanceR = 0;
		StringBuilder sql = new StringBuilder();
		sql.append(" select balance from t_account where accountno=? ");
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, accountno);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				balanceR = rs.getInt("balance");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return balanceR;
	}
	
	
	
}
