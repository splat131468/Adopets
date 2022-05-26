package web.admin.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.admin.dao.AdminDAO_interface;
import web.admin.entity.AdminVO;

public class AdminDAO implements AdminDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jndi");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_ADMIN = "INSERT INTO ADMIN ("
			+ "account,password,name,personImg,accStatus) VALUES (?, ?, ?, ?, ?)";

	private static final String GET_ALL_ADMIN = "SELECT adminID,account,password,name,personImg,accStatus,createDate FROM ADMIN order by adminID";

	private static final String GET_ONE_ADMIN = "SELECT adminID,account,password,name,personImg,accStatus,createDate FROM ADMIN where adminID = ?";

	private static final String DELETE = "DELETE FROM ADMIN where adminID = ?";

	private static final String UPDATE_MAM = "UPDATE ADMIN set account=?, password=?, name=?, personImg=?,accStatus=? where adminID = ?";

	private static final String UPDATE_EMP = "UPDATE ADMIN set password=?, name=?, personImg=? where adminID = ?";

	private static final String CHECK_LOGIN = "select * from ADMIN where account=? and password=?";

	private static final String FIND_PASSWORD = "UPDATE ADMIN set password=? where account = ?";

	private static final String SELECT_ACCOUNT = "SELECT adminID,account,password,name,personImg,accStatus,createDate FROM ADMIN where account = ?";

	private static final String SELECT_NAME = "SELECT name from ADMIN where adminID = ?";

	@Override
	public Integer insert(AdminVO adminVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_ADMIN, Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, adminVO.getAccount());
			pstmt.setString(2, adminVO.getPassword());
			pstmt.setString(3, adminVO.getName());
			pstmt.setBytes(4, adminVO.getPersonImg());
			pstmt.setBoolean(5, adminVO.isAccStatus());

			pstmt.executeUpdate();

			ResultSet generatedKeys = pstmt.getGeneratedKeys();
			generatedKeys.next();

			return generatedKeys.getInt(1);
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
	public void update_MAM(AdminVO adminVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_MAM);
			pstmt.setString(1, adminVO.getAccount());
			pstmt.setString(2, adminVO.getPassword());
			pstmt.setString(3, adminVO.getName());
			pstmt.setBytes(4, adminVO.getPersonImg());
			pstmt.setBoolean(5, adminVO.isAccStatus());
			pstmt.setInt(6, adminVO.getAdminID());

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
	public void update_EMP(AdminVO adminVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_EMP);

			pstmt.setString(1, adminVO.getPassword());
			pstmt.setString(2, adminVO.getName());
			pstmt.setBytes(3, adminVO.getPersonImg());
			pstmt.setInt(4, adminVO.getAdminID());

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
	public void delete(Integer adminID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, adminID);

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
	public AdminVO findByPrimaryKey(Integer adminID) {
		AdminVO adminVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_ADMIN);
			pstmt.setInt(1, adminID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminVO = new AdminVO();
				adminVO.setAdminID(rs.getInt("adminID"));
				adminVO.setAccount(rs.getString("account"));
				adminVO.setPassword(rs.getString("password"));
				adminVO.setName(rs.getString("name"));
				adminVO.setPersonImg(rs.getBytes("personImg"));
				adminVO.setAccStatus(rs.getBoolean("accStatus"));
				adminVO.setCreateDate(rs.getDate("createDate"));
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
		return adminVO;
	}

	@Override
	public List<AdminVO> getAll() {
		List<AdminVO> list = new ArrayList<AdminVO>();
		AdminVO adminVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_ADMIN);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// donateVO 也稱為 Domain objects
				adminVO = new AdminVO();
				adminVO.setAdminID(rs.getInt("adminID"));
				adminVO.setAccount(rs.getString("account"));
				adminVO.setPassword(rs.getString("password"));
				adminVO.setName(rs.getString("name"));
				adminVO.setPersonImg(rs.getBytes("personImg"));
				adminVO.setAccStatus(rs.getBoolean("accStatus"));
				adminVO.setCreateDate(rs.getDate("createDate"));
				list.add(adminVO); // Store the row in the list
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
	public AdminVO checkLogin(String account, String password) {
		AdminVO adminVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(CHECK_LOGIN);
			pstmt.setString(1, account);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminVO = new AdminVO();
				adminVO.setAdminID(rs.getInt("adminID"));
				adminVO.setAccount(rs.getString("account"));
				adminVO.setPassword(rs.getString("password"));
				adminVO.setName(rs.getString("name"));
				adminVO.setPersonImg(rs.getBytes("personImg"));
				adminVO.setAccStatus(rs.getBoolean("accStatus"));
				adminVO.setCreateDate(rs.getDate("createDate"));

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
		return adminVO;
	}

	@Override
	public void findPassword(AdminVO adminVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_PASSWORD);
			pstmt.setString(1, adminVO.getPassword());
			pstmt.setString(2, adminVO.getAccount());

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
	public AdminVO selectAccount(String account) {
		AdminVO adminVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ACCOUNT);
			pstmt.setString(1, account);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminVO = new AdminVO();
				adminVO.setAdminID(rs.getInt("adminID"));
				adminVO.setAccount(rs.getString("account"));
				adminVO.setPassword(rs.getString("password"));
				adminVO.setName(rs.getString("name"));
				adminVO.setPersonImg(rs.getBytes("personImg"));
				adminVO.setAccStatus(rs.getBoolean("accStatus"));
				adminVO.setCreateDate(rs.getDate("createDate"));
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
		return adminVO;
	}

	@Override
	public AdminVO selectName(Integer adminID) {
		AdminVO adminVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_NAME);
			pstmt.setInt(1, adminID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminVO = new AdminVO();
				adminVO.setName(rs.getString("name"));

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
		return adminVO;
	}
}
