package web.member.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.member.dao.MemberDAO_interface;
import web.member.entity.MemberVO;

public class MemberDAO implements MemberDAO_interface {
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jndi");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = 
		"INSERT INTO MEMBER (account,password,name) VALUES (? ,? ,? )";
	private static final String GET_ALL_STMT = 
		"SELECT memID,account,password,name,age,phone,address,personImg,creditCard,createDate FROM MEMBER order by memID";
	private static final String GET_ONE_STMT = 
		"SELECT memID,account,password,name,age,phone,address,personImg,creditCard FROM MEMBER where memID = ?";
	private static final String DELETE = 
		"DELETE FROM MEMBER where memID = ?";
	private static final String FIND_PASSWORD =
		"UPDATE ADMIN set password=? where account = ?";
	// 新增SQL 指令字串
	private static final String GET_ONE_ACCOUNT = 
		"SELECT memID FROM MEMBER where account = ?";
	private static final String UPDATE = 
		"UPDATE MEMBER set password=?, name=?, age=?, phone=?, address=?, personImg=? where account = ?";
	private static final String UPDATE_CREDITCARD =
		"UPDATE MEMBER set creditCard=? where account = ?"; 
	private static final String SELECT_ACCOUNT = 
			"SELECT account,password,name,age,phone,address,personImg,creditCard FROM MEMBER where account = ?";
			
	// 新增查詢方法
	public MemberVO checkAccount(String account) {
			MemberVO memberVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_ACCOUNT);
				pstmt.setString(1, account);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {				
					if(rs.getRow() != 0) {
						throw new Exception();
					}
				}
				

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				
				
				// 自訂錯誤訊息
			} catch (Exception e) {
				throw new RuntimeException("此帳號已有人使用"
						+ e.getMessage());
										
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
		
	@Override
	public void insert(MemberVO memberVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			checkAccount(memberVO.getAccount());
			pstmt.setString(1,memberVO.getAccount());
			pstmt.setString(2,memberVO.getPassword());
			pstmt.setString(3,memberVO.getName());
			pstmt.executeUpdate();
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up resources
		} finally {
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
	}
	
	@Override
	public void update(MemberVO memberVO) {


		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1,memberVO.getPassword());
			pstmt.setString(2,memberVO.getName());
			pstmt.setString(3,memberVO.getAge());
			pstmt.setString(4,memberVO.getPhone());
			pstmt.setString(5,memberVO.getAddress());
			pstmt.setBytes(6,memberVO.getPersonImg());
			pstmt.setString(7,memberVO.getAccount());
			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up resources
		} finally {
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
	}
	@Override
	public void updateCreditCard(MemberVO memberVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_CREDITCARD);
			
			pstmt.setString(1,memberVO.getCreditCard());
			pstmt.setString(2,memberVO.getAccount());
			
			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up resources
		} finally {
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
	}
	
	@Override
	public void delete(Integer memID) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, memID);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
	}
	
	@Override
	public MemberVO findByPrimaryKey(Integer memID) {
		
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, memID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// VO 也稱為 Domain objects
				memberVO = new MemberVO();
				memberVO.setAccount(rs.getString("account"));
				memberVO.setPassword(rs.getString("password"));
				memberVO.setName(rs.getString("name"));
				memberVO.setAge(rs.getString("age"));
				memberVO.setPhone(rs.getString("phone"));
				memberVO.setAddress(rs.getString("address"));
				memberVO.setPersonImg(rs.getBytes("personImg"));
				memberVO.setCreditCard(rs.getString("creditCard"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
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
	
	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO memberVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// VO  Domain objects
				memberVO = new MemberVO();
				memberVO.setMemID(rs.getInt("memID"));
				memberVO.setAccount(rs.getString("account"));
				memberVO.setPassword(rs.getString("password"));
				memberVO.setName(rs.getString("name"));
				memberVO.setAge(rs.getString("age"));
				memberVO.setPhone(rs.getString("phone"));
				memberVO.setAddress(rs.getString("address"));
				memberVO.setPersonImg(rs.getBytes("personImg"));
				memberVO.setCreditCard(rs.getString("creditCard"));
				Timestamp timestamp = rs.getTimestamp("createDate");
				memberVO.setCreateDate(timestamp.toLocalDateTime());
				
				list.add(memberVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
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
		return list;
	}

	@Override
	public List<MemberVO> getAll(Map<String, String[]> map) {
		return null;
	}

	@Override
	public void findPassword(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_PASSWORD);
			pstmt.setString(1, memberVO.getPassword());
			pstmt.setString(2, memberVO.getAccount());
			

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
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
	}

	@Override
	public MemberVO selectAccount(String account) {
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ACCOUNT);
			pstmt.setString(1, account);
			rs = pstmt.executeQuery();

			while (rs.next()) {
			memberVO = new MemberVO();
			memberVO.setAccount(rs.getString("account"));
			memberVO.setPassword(rs.getString("password"));
			memberVO.setName(rs.getString("name"));
			memberVO.setAge(rs.getString("age"));
			memberVO.setPhone(rs.getString("phone"));
			memberVO.setAddress(rs.getString("address"));
			memberVO.setPersonImg(rs.getBytes("personImg"));
			memberVO.setCreditCard(rs.getString("creditCard"));
			}
		
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
