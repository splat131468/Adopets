package web.member.dao.impl;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import web.member.dao.LoginDao;
import web.member.entity.MemberVO;


public class LoginDaoimplJDBC implements LoginDao{
	
	 String driver = "com.mysql.cj.jdbc.Driver";
	 String url = "jdbc:mysql://localhost:3306/ADOPETS?serverTimezone=Asia/Taipei";
	 String userid = "root";
	 String password = "password";
	

	private static final String FIND_MEMBER = 
			"select * from MEMBER where account =?and password=?;";
	@Override
	public MemberVO login(String account, String password) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO memberVO = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(FIND_MEMBER);
			pstmt.setString(1, account);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMemID(rs.getInt("memID"));				
				memberVO.setAccount(rs.getString("account"));
				memberVO.setPassword(rs.getString("password"));
				memberVO.setName(rs.getString("name"));
				memberVO.setAge(rs.getString("age"));
				memberVO.setPhone(rs.getString("phone"));
				memberVO.setAddress(rs.getString("address"));
				memberVO.setPersonImg(rs.getBytes("personImg"));
			}
		} catch (Exception se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memberVO;
	}

}
