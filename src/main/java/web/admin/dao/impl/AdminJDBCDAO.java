package web.admin.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import web.admin.dao.AdminDAO_interface;
import web.admin.entity.AdminVO;





public class AdminJDBCDAO implements AdminDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/ADOPETS?useunicode=true&characterencoding=utf8&useSSL=false&serverTimezone=Asia/Taipei";
	String user = "root";
	String pwd = "password";

	private static final String INSERT_ADMIN = "INSERT INTO ADMIN ("
			+ "account,password,name,personImg,accStatus) VALUES (?, ?, ?, ?, ?)";

	private static final String GET_ALL_ADMIN = "SELECT adminID,account,password,name,personImg,accStatus,createDate FROM ADMIN order by adminID";

	private static final String GET_ONE_ADMIN = "SELECT adminID,account,password,name,personImg,accStatus,createDate FROM ADMIN where adminID = ?";

	private static final String DELETE = "DELETE FROM ADMIN where adminID = ?";

	private static final String UPDATE_MAM = "UPDATE ADMIN set account=?, password=?, name=?, personImg=?,accStatus=? where adminID = ?";

	private static final String UPDATE_EMP = "UPDATE ADMIN set password=?, name=?, personImg=? where adminID = ?";
	
	private static final String CHECK_LOGIN = "select adminID,account,password,name,personImg,accStatus,createDate from ADMIN where account=? and password=?";

	private static final String FIND_PASSWORD ="UPDATE ADMIN set password=? where account = ?";
	
	private static final String SELECT_ACCOUNT = "SELECT adminID,account,password,name,personImg,accStatus,createDate FROM ADMIN where account = ?";
	
	private static final String SELECT_NAME = "SELECT name from ADMIN where adminID = ?";
	
	@Override
	public Integer insert(AdminVO adminVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
			pstmt = con.prepareStatement(INSERT_ADMIN,Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, adminVO.getAccount());
			pstmt.setString(2, adminVO.getPassword());
			pstmt.setString(3, adminVO.getName());
			pstmt.setBytes(4, adminVO.getPersonImg());
			pstmt.setBoolean(5, adminVO.isAccStatus());
			pstmt.executeUpdate();
			
			ResultSet generatedKeys = pstmt.getGeneratedKeys();
			generatedKeys.next();
			
			return generatedKeys.getInt(1);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
			pstmt = con.prepareStatement(UPDATE_MAM);
			pstmt.setString(1, adminVO.getAccount());
			pstmt.setString(2, adminVO.getPassword());
			pstmt.setString(3, adminVO.getName());
			pstmt.setBytes(4, adminVO.getPersonImg());
			pstmt.setBoolean(5, adminVO.isAccStatus());
			pstmt.setInt(6, adminVO.getAdminID());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
			pstmt = con.prepareStatement(UPDATE_EMP);

			pstmt.setString(1, adminVO.getPassword());
			pstmt.setString(2, adminVO.getName());
			pstmt.setBytes(3, adminVO.getPersonImg());
			pstmt.setInt(4, adminVO.getAdminID());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
			con = DriverManager.getConnection(url, user, pwd);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, adminID);

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
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
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
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
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
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
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		}catch (SQLException se) {
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
			pstmt = con.prepareStatement(FIND_PASSWORD);

			pstmt.setString(1, adminVO.getPassword());
			pstmt.setString(2, adminVO.getAccount());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
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
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
			pstmt = con.prepareStatement(SELECT_NAME);
			pstmt.setInt(1, adminID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adminVO = new AdminVO();
				adminVO.setName(rs.getString("name"));
				
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	
	
	public static void main(String[] args) {

		AdminJDBCDAO dao = new AdminJDBCDAO();

		// 新增
//		AdminVO adminVO1 = new AdminVO();
//		
//		adminVO1.setAccount("DDDO");
//		adminVO1.setPassword("123ss456");
//		adminVO1.setName("pojo");
//		adminVO1.setPersonImg(null);
//		adminVO1.setAccStatus(true);
//		dao.insert(adminVO1);
		
		// 主管修改
//		AdminVO adminVO2 = new AdminVO();
//		adminVO2.setAdminID(2);
//		adminVO2.setAccount("L123");
//		adminVO2.setPassword("123");
//		adminVO2.setName("pojo");
//		adminVO2.setPersonImg(null);
//		adminVO2.setAccStatus(false);
//		dao.update_MAM(adminVO2);
		
		// 員工修改
//		AdminVO adminVO4 = new AdminVO();
//		adminVO4.setAdminID(2);
//		adminVO4.setPassword("88888");
//		adminVO4.setName("jojo");
//		adminVO4.setPersonImg(null);
//		dao.update_EMP(adminVO4);

		// 刪除
//		dao.delete(88);
		
		//查詢
//		AdminVO adminVO3 = dao.findByPrimaryKey(2);
//		System.out.print(adminVO3.getAdminID() + ",");
//		System.out.print(adminVO3.getAccount() + ",");
//		System.out.print(adminVO3.getPassword() + ",");
//		System.out.print(adminVO3.getName() + ",");
//		System.out.print(adminVO3.getPersonImg() + ",");
//		System.out.print(adminVO3.isAccStatus() + ",");
//		System.out.println(adminVO3.getCreateDate());
//		System.out.println("---------------------");
//
//	
//		//查詢
//		List<AdminVO> list = dao.getAll();
//		for (AdminVO admin : list) {
//		System.out.print(admin.getAdminID() + ",");
//		System.out.print(admin.getAccount() + ",");
//		System.out.print(admin.getPassword() + ",");
//		System.out.print(admin.getName() + ",");
//		System.out.print(admin.getPersonImg() + ",");
//		System.out.print(admin.isAccStatus() + ",");
//		System.out.println(admin.getCreateDate());
//		}
//		
//		AdminVO adminVO4 = dao.checkLogin("g8g8@gmail.com","000000000");
//		System.out.print(adminVO4.getAdminID() + ",");
//		System.out.print(adminVO4.getAccount() + ",");
//		System.out.print(adminVO4.getPassword() + ",");
//		System.out.print(adminVO4.getName() + ",");
//		System.out.print(adminVO4.getPersonImg() + ",");
//		System.out.print(adminVO4.isAccStatus() + ",");
//		System.out.println(adminVO4.getCreateDate());
//		System.out.println("---------------------");
			
//		AdminVO adminVO4 = new AdminVO();
//		adminVO4.setPassword("1234561211");
//		adminVO4.setAccount("sdsad@gmail.com");
//		dao.findPassword(adminVO4);
		
		
		AdminVO adminVO3 = dao.selectAccount("g8g8@gmail.com");
		System.out.print(adminVO3.getAdminID() + ",");
		System.out.print(adminVO3.getAccount() + ",");
		System.out.print(adminVO3.getPassword() + ",");
		System.out.print(adminVO3.getName() + ",");
		System.out.print(adminVO3.getPersonImg() + ",");
		System.out.print(adminVO3.isAccStatus() + ",");
		System.out.println(adminVO3.getCreateDate());
		System.out.println("---------------------");

		
	}





	

	
}
