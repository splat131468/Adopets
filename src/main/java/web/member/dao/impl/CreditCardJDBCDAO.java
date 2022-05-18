//package web.member.dao.impl;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Map;
//
//import web.member.dao.CreditCardDAO_interface;
//import web.member.entity.CreditCardVO;
//
//public class CreditCardJDBCDAO implements CreditCardDAO_interface{
//	
//	 String driver = "com.mysql.cj.jdbc.Driver";
//	 String url = "jdbc:mysql://localhost:3306/ADOPETS?serverTimezone=Asia/Taipei";
//	 String userid = "root";
//	 String password = "password";
//	 
//	private static final String INSERT_STMT = 
//		"INSERT INTO CREDITCARD (cardNumber) VALUES (?)";
//	private static final String GET_ALL_STMT = 
//		"SELECT memID,cardNumber FROM CREDITCARD order by memID";
//	private static final String GET_ONE_STMT = 
//		"SELECT memID,cardNumber FROM CREDITCARD where memID = ?";
//	private static final String DELETE = 
//		"DELETE FROM CREDITCARD where memID = ?";
//	private static final String UPDATE = 
//		"UPDATE CREDITCARD set cardNumber=?where memID = ?";
//	
//
//	@Override
//	public void insert(CreditCardVO creditCardVO) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, password);
//			
//			
//			pstmt = con.prepareStatement(INSERT_STMT);			
//			pstmt.setString(1,creditCardVO.getCardNumber());
//			pstmt.executeUpdate();
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up resources
//		} catch (ClassNotFoundException e) {
//	
//			e.printStackTrace();
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//	}
//
//	@Override
//	public void update(CreditCardVO creditCardVO) {	
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, password);
//			pstmt = con.prepareStatement(UPDATE);
//			
//			pstmt.setString(1,creditCardVO.getCardNumber());
//			pstmt.executeUpdate();
//
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up resources
//		} catch (ClassNotFoundException e) {
//	
//			e.printStackTrace();
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}	
//	}
//
//	@Override
//	public void delete(Integer creditCardVO) {
//
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, password);
//			pstmt = con.prepareStatement(DELETE);
//
//			pstmt.setInt(1, creditCardVO);
//
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} catch (ClassNotFoundException e) {
//
//			e.printStackTrace();
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		
//	}
//
//	@Override
//	public CreditCardVO findByPrimaryKey(Integer memID) {
//		
//		CreditCardVO creditCardVO = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, password);
//			pstmt = con.prepareStatement(GET_ONE_STMT);
//
//			pstmt.setInt(1, memID);
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				// VO 也稱為 Domain objects
//				creditCardVO = new CreditCardVO();
//				creditCardVO.setCardNumber(rs.getString("cardNumber"));
//				creditCardVO.setMemID(memID);
//				creditCardVO.setDefaultCreditCard(null);
//
//			}
//
//			// Handle any driver errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return creditCardVO;
//	}
//
//	@Override
//	public List<CreditCardVO> getAll(Integer memID) {
//		List<CreditCardVO> list = new ArrayList<CreditCardVO>();
//		CreditCardVO creditCardVO = null;
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, password);
//			pstmt = con.prepareStatement(GET_ALL_STMT);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				// VO  Domain objects
//				creditCardVO = new CreditCardVO();
//				creditCardVO.setCardNumber(rs.getString("cardNumber"));
//				creditCardVO.setMemID(memID);
//				creditCardVO.setDefaultCreditCard(null);
//				
//				list.add(creditCardVO); // Store the row in the list
//			}
//
//			// Handle any driver errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return list;
//	}
//
//	@Override
//	public List<CreditCardVO> getAll(Map<String, String[]> map) {
//		
//		return null;
//	}
//
//
//}
