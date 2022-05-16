package web.donate.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import web.donate.dao.impl.DonateDAO_interface;
import web.donate.entity.DonateVO;

public class DonateJDBCDAO implements DonateDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/ADOPETS?useunicode=true&characterencoding=utf8&useSSL=false&serverTimezone=Asia/Taipei";
	String user = "root";
	String password = "password";

	private static final String INSERT_DONATE = "INSERT INTO DONATE (memID,catID,shelterName,donateName,donateEmail,phone,"
			+ "donateAddr,donateAmo,donateStatus,donateMes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	private static final String GET_ALL_DONATE = "SELECT donateID,memID,catID,shelterName,donateName,donateEmail,phone,donateAddr,donateAmo,donateStatus,donateMes,donateDate FROM DONATE order by donateID";

	private static final String GET_ONE_DONATE = "SELECT donateID,memID,catID,shelterName,donateName,donateEmail,phone,donateAddr,donateAmo,donateStatus,donateMes,donateDate FROM DONATE where donateID = ?";

	private static final String DELETE = "DELETE FROM DONATE where donateID = ?";

	private static final String UPDATE = "UPDATE DONATE set donateStatus=? where donateID = ?";

	@Override
	public void insert(DonateVO donateVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(INSERT_DONATE);

			pstmt.setInt(1, donateVO.getMemID());
			pstmt.setInt(2, donateVO.getCatID());
			pstmt.setString(3, donateVO.getShelterName());
			pstmt.setString(4, donateVO.getDonateName());
			pstmt.setString(5, donateVO.getDonateEmail());
			pstmt.setString(6, donateVO.getPhone());
			pstmt.setString(7, donateVO.getDonateAddr());
			pstmt.setInt(8, donateVO.getDonateAmo());
			pstmt.setInt(9, donateVO.getDonateStatus());
			pstmt.setString(10, donateVO.getDonateMes());
			

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
	public void update(DonateVO donateVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, donateVO.getDonateStatus());
			pstmt.setInt(2, donateVO.getDonateID());

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
	public void delete(Integer donateID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, donateID);

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
	public DonateVO findByPrimaryKey(Integer donateID) {
		DonateVO donateVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ONE_DONATE);
			pstmt.setInt(1, donateID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				donateVO = new DonateVO();
				donateVO.setDonateID(rs.getInt("donateID"));
				donateVO.setMemID(rs.getInt("memID"));
				donateVO.setCatID(rs.getInt("catID"));
				donateVO.setShelterName(rs.getString("shelterName"));
				donateVO.setDonateName(rs.getString("donateName"));
				donateVO.setDonateEmail(rs.getString("donateEmail"));
				donateVO.setPhone(rs.getString("phone"));
				donateVO.setDonateAddr(rs.getString("donateAddr"));
				donateVO.setDonateAmo(rs.getInt("donateAmo"));
				donateVO.setDonateStatus(rs.getInt("donateStatus"));
				donateVO.setDonateMes(rs.getString("donateMes"));
				donateVO.setDonateDate(rs.getTimestamp("donateDate"));

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
		return donateVO;
	}

	@Override
	public List<DonateVO> getAll() {
		List<DonateVO> list = new ArrayList<DonateVO>();
		DonateVO donateVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(GET_ALL_DONATE);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// donateVO 銋迂� Domain objects
				donateVO = new DonateVO();
				donateVO.setDonateID(rs.getInt("donateID"));
				donateVO.setMemID(rs.getInt("memID"));
				donateVO.setCatID(rs.getInt("catID"));
				donateVO.setShelterName(rs.getString("shelterName"));
				donateVO.setDonateName(rs.getString("donateName"));
				donateVO.setDonateEmail(rs.getString("donateEmail"));
				donateVO.setPhone(rs.getString("phone"));
				donateVO.setDonateAddr(rs.getString("donateAddr"));
				donateVO.setDonateAmo(rs.getInt("donateAmo"));
				donateVO.setDonateStatus(rs.getInt("donateStatus"));
				donateVO.setDonateMes(rs.getString("donateMes"));
				donateVO.setDonateDate(rs.getTimestamp("donateDate"));
				list.add(donateVO); // Store the row in the list
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

	public static void main(String[] args) {

		DonateJDBCDAO dao = new DonateJDBCDAO();

		// 新增
		DonateVO donateVO1 = new DonateVO();
		donateVO1.setMemID(1);
		donateVO1.setCatID(1);
		donateVO1.setShelterName("1");
		donateVO1.setDonateName("POJO");
		donateVO1.setDonateEmail("POJO@gmail.com");
		donateVO1.setPhone("0909897281");
		donateVO1.setDonateAddr("新北勢三重");
		donateVO1.setDonateAmo(5000);
		donateVO1.setDonateStatus(1);
		donateVO1.setDonateMes("好好生活");
		dao.insert(donateVO1);

		// 修改
//		DonateVO donateVO2 = new DonateVO();
//		donateVO2.setDonateID(1);
//		donateVO2.setDonateStatus(0);
//		dao.update(donateVO2);
//
		// 刪除
//		dao.delete(1);
//
//		// 查詢
//		DonateVO donateVO3 = dao.findByPrimaryKey(2);
//		System.out.print(donateVO3.getDonateID() + ",");
//		System.out.print(donateVO3.getMemID() + ",");
//		System.out.print(donateVO3.getCatID() + ",");
//		System.out.print(donateVO3.getShelterName() + ",");
//		System.out.print(donateVO3.getDonateName() + ",");
//		System.out.print(donateVO3.getDonateEmail() + ",");
//		System.out.print(donateVO3.getPhone() + ",");
//		System.out.print(donateVO3.getDonateAddr() + ",");
//		System.out.print(donateVO3.getDonateAmo() + ",");
//		System.out.print(donateVO3.getDonateStatus() + ",");
//		System.out.print(donateVO3.getDonateMes() + ",");
//		System.out.println(donateVO3.getDonateDate());
//		System.out.println("---------------------");
//
//		// 查詢
//		List<DonateVO> list = dao.getAll();
//		for (DonateVO donate1 : list) {
//			System.out.print(donate1.getDonateID() + ",");
//			System.out.print(donate1.getMemID() + ",");
//			System.out.print(donate1.getCatID() + ",");
//			System.out.print(donate1.getShelterName() + ",");
//			System.out.print(donate1.getDonateName() + ",");
//			System.out.print(donate1.getDonateEmail() + ",");
//			System.out.print(donate1.getPhone() + ",");
//			System.out.print(donate1.getDonateAddr() + ",");
//			System.out.print(donate1.getDonateAmo() + ",");
//			System.out.print(donate1.getDonateStatus() + ",");
//			System.out.print(donate1.getDonateMes() + ",");
//			System.out.println(donate1.getDonateDate());
//		}
	}
}
