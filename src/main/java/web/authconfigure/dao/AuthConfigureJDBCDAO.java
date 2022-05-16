package web.authconfigure.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import web.authconfigure.dao.impl.AuthConfigureDAO_interface;
import web.authconfigure.entity.AdminAllVO;
import web.authconfigure.entity.AuthConfigureVO;



public class AuthConfigureJDBCDAO implements AuthConfigureDAO_interface {
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/ADOPETS?useunicode=true&characterencoding=utf8&useSSL=false&serverTimezone=Asia/Taipei";
	String user = "root";
	String password = "password";

	private static final String INSERT_AUTHCONFIGURE = "INSERT INTO AUTHCONFIGURE (adminID,authID) VALUES (?, ?)";

	private static final String UPDATE = "UPDATE AUTHCONFIGURE set authID=? where adminID = ?";

	private static final String GET_ONE_AUTHCONFIGURE = "SELECT adminID,authID FROM AUTHCONFIGURE where adminID = ?";

	private static final String GET_ALL_AUTHCONFIGURE = "SELECT adminID,authID FROM AUTHCONFIGURE order by adminID";

	private static final String DELETE = "DELETE FROM AUTHCONFIGURE where adminID = ?";
	
	private static final String GET_ONE_MANAGER = "SELECT\r\n"
			+ "  a.adminID,\r\n"
			+ "  a.account,\r\n"
			+ "  a.password,\r\n"
			+ "  a.name,\r\n"
			+ "  a.personImg,\r\n"
			+ "  a.accStatus,\r\n"
			+ "  aq.authID,\r\n"
			+ "  AUTH.authName\r\n"
			+ "FROM ADMIN a \r\n"
			+ "JOIN AUTHCONFIGURE aq\r\n"
			+ "  ON a.adminID = aq.adminID\r\n"
			+ "JOIN AUTH\r\n"
			+ "  ON aq.authID = AUTH.authID where a.adminID = ?";
	
	private static final String GET_ALL_MANAGER = "SELECT\r\n"
			+ "  a.adminID,\r\n"
			+ "  a.account,\r\n"
			+ "  a.password,\r\n"
			+ "  a.name,\r\n"
			+ "  a.personImg,\r\n"
			+ "  a.accStatus,\r\n"
			+ "  aq.authID,\r\n"
			+ "  AUTH.authName\r\n"
			+ "FROM ADMIN a \r\n"
			+ "JOIN AUTHCONFIGURE aq\r\n"
			+ "  ON a.adminID = aq.adminID\r\n"
			+ "JOIN AUTH\r\n"
			+ "  ON aq.authID = AUTH.authID";
	
	
	
	
//	private static final String  UPDATE_ONE_MANAGER ="UPDATE  ADMIN a\r\n"
//			+ "JOIN AUTHCONFIGURE aq\r\n"
//			+ "  ON a.adminID = aq.adminID\r\n"
//			+ "JOIN AUTH\r\n"
//			+ "  ON aq.authID = AUTH.authID\r\n"
//			+ "SET a.account = ?,\r\n"
//			+ "a.password= ?,\r\n"
//			+ "  a.name=?,\r\n"
//			+ "  a.personImg=?,\r\n"
//			+ "  a.accStatus=?,\r\n"
//			+ "  aq.authID=?\r\n"
//			+ "where a.adminID = ? ;";
	
	
	
	

	@Override
	public void insert(AuthConfigureVO authConfigureVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_AUTHCONFIGURE);

			pstmt.setInt(1, authConfigureVO.getAdminID());
			pstmt.setInt(2, authConfigureVO.getAuthID());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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
	public void update(AuthConfigureVO authConfigureVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, authConfigureVO.getAuthID());
			pstmt.setInt(2, authConfigureVO.getAdminID());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any driver errors
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
	public void delete(Integer adminID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, adminID);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any driver errors
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
	public List<Integer> findByAdminID(Integer adminID) {
		List<Integer> list = new ArrayList<Integer>();
		AuthConfigureVO authConfigureVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ONE_AUTHCONFIGURE);

			pstmt.setInt(1, adminID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// authConfigureVO 也稱為 Domain objects
				authConfigureVO = new AuthConfigureVO();
				authConfigureVO.setAdminID(rs.getInt("adminID"));
				authConfigureVO.setAuthID(rs.getInt("authID"));
				list.add(rs.getInt("authID"));
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any driver errors
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
		return list;
	}

	@Override
	public List<AuthConfigureVO> getAll() {
		List<AuthConfigureVO> list = new ArrayList<AuthConfigureVO>();
		AuthConfigureVO authConfigureVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ALL_AUTHCONFIGURE);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// AuthConfigureVO 也稱為 Domain objects
				authConfigureVO = new AuthConfigureVO();
				authConfigureVO.setAdminID(rs.getInt("adminID"));
				authConfigureVO.setAuthID(rs.getInt("authID"));
				list.add(authConfigureVO); // Store the row in the list
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any driver errors
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
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<AdminAllVO> findByManager(Integer adminID) {
		List<AdminAllVO> list = new ArrayList<AdminAllVO>();
		AdminAllVO adminAllVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ONE_MANAGER);

			pstmt.setInt(1, adminID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// authConfigureVO 也稱為 Domain objects
				adminAllVO = new AdminAllVO();				
				adminAllVO.setAdminID(rs.getInt("adminID"));
				adminAllVO.setAccount(rs.getString("account"));
				adminAllVO.setPassword(rs.getString("password"));
				adminAllVO.setName(rs.getString("name"));
				adminAllVO.setPersonImg(rs.getBytes("personImg"));
				adminAllVO.setAccStatus(rs.getBoolean("accStatus"));
				adminAllVO.setAuthID(rs.getInt("authID"));
				adminAllVO.setAuthName(rs.getString("authName"));		
				list.add(adminAllVO);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any driver errors
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
		return list;
	}
	
	
	
	
	
	@Override
	public List<AdminAllVO> findAllManager() {
		List<AdminAllVO> list = new ArrayList<AdminAllVO>();
		AdminAllVO adminAllVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ALL_MANAGER);


			rs = pstmt.executeQuery();

			while (rs.next()) {
				// authConfigureVO 也稱為 Domain objects
				adminAllVO = new AdminAllVO();				
				adminAllVO.setAdminID(rs.getInt("adminID"));
				adminAllVO.setAccount(rs.getString("account"));
				adminAllVO.setPassword(rs.getString("password"));
				adminAllVO.setName(rs.getString("name"));
				adminAllVO.setPersonImg(rs.getBytes("personImg"));
				adminAllVO.setAccStatus(rs.getBoolean("accStatus"));
				adminAllVO.setAuthID(rs.getInt("authID"));
				adminAllVO.setAuthName(rs.getString("authName"));		
				list.add(adminAllVO);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any driver errors
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
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	public static void main(String[] args) {
		AuthConfigureJDBCDAO dao = new AuthConfigureJDBCDAO();

//		// 新增
//		AuthConfigureVO authConfigureVO01 = new AuthConfigureVO();
//		authConfigureVO01.setAdminID(44);
//		authConfigureVO01.setAuthID(1);
//		dao.insert(authConfigureVO01);
//		
//		// 修改
//		AuthConfigureVO authConfigureVO02 = new AuthConfigureVO();
//		authConfigureVO02.setAdminID(35);
//		authConfigureVO02.setAuthID(2);
//		dao.update(authConfigureVO02);
		
		// 刪除
//		dao.delete(2);
		
//		// 查詢
		List<Integer> list = dao.findByAdminID(2);
		for (Integer authConfigure04 : list) {
			System.out.print(authConfigure04 + ",");
			

		}

//		 查詢
//		List<AuthConfigureVO> list = dao.getAll();
//		for (AuthConfigureVO authConfigure04 : list) {
//			System.out.print(authConfigure04.getAdminID() + ",");
//			System.out.println(authConfigure04.getAuthID());
//
//		}
		
		
//		//多表查詢
//		List<AdminAllVO> listAll = dao.findByManager(2);
//		for (AdminAllVO adminAllVO : listAll) {
//			System.out.print(adminAllVO.getAdminID() + ",");
//			System.out.print(adminAllVO.getAccount() + ",");
//			System.out.print(adminAllVO.getPassword() + ",");
//			System.out.print(adminAllVO.getName() + ",");
//			System.out.print(adminAllVO.getPersonImg() + ",");
//			System.out.print(adminAllVO.isAccStatus() + ",");
//			System.out.print(adminAllVO.getAuthID() + ",");
//			System.out.println(adminAllVO.getAuthName());
//		}

//		List<AdminAllVO> listAllMM = dao.findAllManager();
//		for (AdminAllVO adminAllVO : listAllMM) {
//			System.out.print(adminAllVO.getAdminID() + ",");
//			System.out.print(adminAllVO.getAccount() + ",");
//			System.out.print(adminAllVO.getPassword() + ",");
//			System.out.print(adminAllVO.getName() + ",");
//			System.out.print(adminAllVO.getPersonImg() + ",");
//			System.out.print(adminAllVO.isAccStatus() + ",");
//			System.out.print(adminAllVO.getAuthID() + ",");
//			System.out.println(adminAllVO.getAuthName());
//		}
		
			
	}

	
}
