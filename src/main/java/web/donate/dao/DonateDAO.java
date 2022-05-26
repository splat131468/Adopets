package web.donate.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.donate.dao.impl.DonateDAO_interface;
import web.donate.entity.DonateVO;


public class DonateDAO implements DonateDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jndi");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_DONATE = "INSERT INTO DONATE (memID,catID,shelterName,donateName,donateEmail,phone,"
			+ "donateAddr,donateAmo,donateStatus,donateMes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	private static final String GET_ALL_DONATE = "SELECT donateID,memID,catID,shelterName,donateName,donateEmail,phone,donateAddr,donateAmo,donateStatus,donateMes,donateDate FROM DONATE order by donateID";

	private static final String GET_ONE_DONATE = "SELECT donateID,memID,catID,shelterName,donateName,donateEmail,phone,donateAddr,donateAmo,donateStatus,donateMes,donateDate FROM DONATE where donateID = ?";

	private static final String DELETE = "DELETE FROM DONATE where donateID = ?";

	private static final String UPDATE = "UPDATE DONATE set donateStatus=? where donateID = ?";

	private static final String GET_ONE_MEMBER ="SELECT donateID,memID,catID,shelterName,donateName,donateEmail,phone,donateAddr,donateAmo,donateStatus,donateMes,donateDate FROM DONATE where memID = ?";
	
	@Override
	public Integer insert(DonateVO donateVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_DONATE,Statement.RETURN_GENERATED_KEYS);

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
	public void update(DonateVO donateVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, donateVO.getDonateStatus());
			pstmt.setInt(2, donateVO.getDonateID());

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
	public void delete(Integer donateID) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, donateID);

			pstmt.executeUpdate();

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
	public DonateVO findByPrimaryKey(Integer donateID) {
		DonateVO donateVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
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

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_DONATE);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// donateVO 也稱為 Domain objects
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
	public List<DonateVO> findByMember(Integer memID) {
		List<DonateVO> list = new ArrayList<DonateVO>();
		DonateVO donateVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_MEMBER);
			pstmt.setInt(1, memID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// donateVO 也稱為 Domain objects
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

}
