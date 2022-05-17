package web.authconfigure.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.authconfigure.dao.impl.AuthConfigureDAO_interface;
import web.authconfigure.entity.AdminAllVO;
import web.authconfigure.entity.AuthConfigureVO;


public class AuthConfigureDAO implements AuthConfigureDAO_interface{

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jndi");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
		

		public static void main(String[] args) {
			AuthConfigureDAO authConfigureDAO=new AuthConfigureDAO();
			authConfigureDAO.insert(null);
		}
	
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
		
		
		
		@Override
		public void insert(AuthConfigureVO authConfigureVO) {
			Connection con = null;
			PreparedStatement pstmt = null;
		
			try {
				
				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_AUTHCONFIGURE);

				
				pstmt.setInt(1, authConfigureVO.getAdminID());
				pstmt.setInt(2, authConfigureVO.getAuthID());
				pstmt.executeUpdate();
				
				

				// Handle any SQL errors
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
		public void update(AuthConfigureVO authConfigureVO) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);

				pstmt.setInt(1, authConfigureVO.getAuthID());
				pstmt.setInt(2, authConfigureVO.getAdminID());
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
		public void delete(Integer adminID) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);

				pstmt.setInt(1, adminID);
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
		public List<Integer> findByAdminID(Integer adminID) {
			List<Integer> list = new ArrayList<Integer>();
			AuthConfigureVO authConfigureVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = ds.getConnection();
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
		public List<AuthConfigureVO> getAll() {
			List<AuthConfigureVO> list = new ArrayList<AuthConfigureVO>();
			AuthConfigureVO authConfigureVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_AUTHCONFIGURE);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					// AuthConfigureVO 也稱為 Domain objects
					authConfigureVO = new AuthConfigureVO();
					authConfigureVO.setAdminID(rs.getInt("adminID"));
					authConfigureVO.setAuthID(rs.getInt("authID"));
					list.add(authConfigureVO); // Store the row in the list
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
		public List<AdminAllVO> findByManager(Integer adminID) {
			List<AdminAllVO> list = new ArrayList<AdminAllVO>();
			AdminAllVO adminAllVO = null;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				con = ds.getConnection();
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
				con = ds.getConnection();
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
			}  catch (SQLException se) {
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
}
