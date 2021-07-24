package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {

	// 해당 카카오 계정으로 가입된 banking_id가 있는지?
	public MemberVO confirmKakao(String kakaoId) {
		MemberVO member = null;
		// id 값이 존재하는 kakaoId가 있는지?
		StringBuilder sql = new StringBuilder();
		sql.append(" select * from banking_login where kakao_id=? ");
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, kakaoId);
			
			// id값 존재하는 kakaoId들을 resultset에 저장
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {	
				member = new MemberVO();
				member.setId(rs.getString("banking_id")); 
				member.setName(rs.getString("name"));
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
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
	
	public void kakaoSignup(MemberVO member) {
		StringBuilder sql = new StringBuilder();
		
		sql.append(" insert into banking_login(banking_id, name, password, phone_no, kakao_id) ");
		sql.append(" values(?, ?, ?, ?, ?) ");
		
		try {
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getPhoneNo());
			pstmt.setString(5, member.getKakaoId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
