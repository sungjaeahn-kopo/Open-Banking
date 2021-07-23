package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {

	// 해당 카카오 계정으로 가입된 banking_id가 있는지?
	public boolean confirmKakao(String kakaoId) {
		boolean confirm = false;
		
		// id 값이 존재하는 kakaoId가 있는지?
		StringBuilder sql = new StringBuilder();
		sql.append(" select banking_id from banking_login where kakaoid=? ");
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, null);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				kakaoId = rs.getString("kakaoId");
			}
			
			if (kakaoId.equals("")) {
				// 로그인한 적 없음
				confirm = false;
			} else {
				// 카카오 연동계정 존재
				confirm = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return confirm;
	}
	
	public MemberVO normLogin(String id, String password) {
		MemberVO user = null;
		StringBuilder sql = new StringBuilder();
		sql.append(" select * from banking_login where banking_id=? and password=? ");
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				// 로그인 성공시 저장
				user = new MemberVO();
				user.setId(rs.getString("banking_id")); 
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	
	
	
}
