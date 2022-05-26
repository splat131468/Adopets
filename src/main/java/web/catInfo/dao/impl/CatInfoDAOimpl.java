package web.catInfo.dao.impl;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import web.catInfo.dao.CatInfoDAO;
import web.catInfo.entity.CatAndShelVO;
import web.catInfo.entity.CatInfoVO;
import web.catInfo.util.JedisUtil;

public class CatInfoDAOimpl implements CatInfoDAO {
	
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
			"INSERT INTO CATINFO (SHELTERNAME, CATNAME, AGE, BREED, SIZE, SEX, COATCOLOR, EYECOLOR, HEALTH, ADOPTCOST, CREATEDATE, HAVEVACCINE, ADOPT) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	private static final String DELETE =
			"DELETE FROM CATINFO WHERE CATID = ?";
	private static final String UPDATE = 
			"UPDATE CATINFO SET MEMID = ?, SHELTERNAME = ?, CATNAME = ?, HAVEVACCINE = ?, HEALTH = ?, ADOPTCOST = ?, ADOPT = ? WHERE CATID = ? ";
	
	private static final String GET_ONE_STMT = 
			"SELECT * FROM CATINFO WHERE CATID = ? ";
	
	private static final String GET_ALL_STMT = 
			"SELECT * FROM CATINFO ORDER BY CATID DESC";
	
	private static final String GET_LAST_CATID = 
			"SELECT CATID FROM CATINFO ORDER BY CATID DESC limit 1";
	
	private static final String GET_FAV_LIST = "SELECT * FROM CATINFO WHERE CATID IN (";
	
	private static final String GET_ONEANDSHELTER_STMT = 
			"SELECT * FROM CATINFO A, SHELTERINFO B WHERE A.SHELTERNAME = B.SHELTERNAME AND CATID = ?";
	
	@Override
	public boolean insert(CatInfoVO catInfoVO) {
		int rowCount = 0;
		try(Connection connection = ds.getConnection();
				PreparedStatement ps = connection.prepareStatement(INSERT_STMT)){
			ps.setString(1, catInfoVO.getShelterName());
			ps.setString(2, catInfoVO.getCatName());
			ps.setInt(3, catInfoVO.getAge());
			ps.setString(4, catInfoVO.getBreed());
			ps.setString(5, catInfoVO.getSize());
			ps.setString(6, catInfoVO.getSex());
			ps.setString(7, catInfoVO.getCoatColor());
			ps.setString(8, catInfoVO.getEyeColor());
			ps.setString(9, catInfoVO.getHealth());
			ps.setInt(10, catInfoVO.getAdoptCost());
			ps.setDate(11, catInfoVO.getCreateDate());
			ps.setBoolean(12, catInfoVO.getHaveVaccine());
			ps.setBoolean(13, catInfoVO.getAdopt());
			rowCount = ps.executeUpdate();
		} catch (SQLException e) {	
			throw new RuntimeException("資料庫發生錯誤" + e.getMessage());
		}
		return rowCount != 0;
	}

	@Override
	public boolean update(CatInfoVO catInfoVO) {
		int rowCount = 0;
		try (Connection connection = ds.getConnection();
				PreparedStatement ps = connection.prepareStatement(UPDATE)){
			if (catInfoVO.getMemID() == 0) {
				ps.setNull(1, Types.INTEGER);
			}else {
				ps.setInt(1, catInfoVO.getMemID());
			}
			ps.setString(2, catInfoVO.getShelterName());
			ps.setString(3, catInfoVO.getCatName());
			ps.setBoolean(4, catInfoVO.getHaveVaccine());
			ps.setString(5, catInfoVO.getHealth());		
			ps.setInt(6, catInfoVO.getAdoptCost());
			ps.setBoolean(7, catInfoVO.getAdopt());
			ps.setInt(8, catInfoVO.getCatID());
			rowCount = ps.executeUpdate();
		} catch (SQLException e) {
//			throw new RuntimeException();
			throw new RuntimeException("資料庫發生錯誤" + e.getMessage());
	
		}
		return rowCount != 0;
	}

	@Override
	public boolean delete(Integer catID) {
		int rowCount = 0;
		
		try(Connection connection = ds.getConnection();
				PreparedStatement ps = connection.prepareStatement(DELETE)) {
//			System.out.println("hello dao" + catID);
			ps.setInt(1, catID);
			rowCount = ps.executeUpdate();
//			System.out.println("hello dao 2--------------" + catID);
		} catch (Exception e) {
			throw new RuntimeException("資料庫發生錯誤" + e.getMessage());
		} 
		
		return rowCount != 0;
	}

	@Override
	public CatInfoVO getOne(Integer catID) {

		
		CatInfoVO catInfoVO = null;
		try (Connection connection = ds.getConnection();
				PreparedStatement ps = connection.prepareStatement(GET_ONE_STMT)) {
			ps.setInt(1, catID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				catInfoVO = new CatInfoVO();
				catInfoVO.setCatID(rs.getInt("CATID"));
				catInfoVO.setMemID(rs.getInt("MEMID"));
				catInfoVO.setShelterName(rs.getString("SHELTERNAME"));
				catInfoVO.setCatName(rs.getString("CATNAME"));
				catInfoVO.setBreed(rs.getString("BREED"));
				catInfoVO.setAge(rs.getInt("AGE"));
				catInfoVO.setSize(rs.getString("SIZE"));
				catInfoVO.setSex(rs.getString("SEX"));
				catInfoVO.setCoatColor(rs.getString("COATCOLOR"));
				catInfoVO.setEyeColor(rs.getString("EYECOLOR"));
				catInfoVO.setHaveVaccine(rs.getBoolean("HAVEVACCINE"));
				catInfoVO.setHealth(rs.getString("HEALTH"));
				catInfoVO.setAdoptCost(rs.getInt("ADOPTCOST"));
				catInfoVO.setAdopt(rs.getBoolean("ADOPT"));
				catInfoVO.setCreateDate(rs.getDate("CREATEDATE"));
			}
		} catch (SQLException e) {
			throw new RuntimeException("資料庫發生錯誤" + e.getMessage());
		}
		return catInfoVO;
	}

	@Override
	public List<CatInfoVO> getAll() {
		List<CatInfoVO> list = new ArrayList<CatInfoVO>();
		CatInfoVO catInfoVO = null;
		try(Connection connection = ds.getConnection(); 
				PreparedStatement ps = connection.prepareStatement(GET_ALL_STMT)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				catInfoVO = new CatInfoVO();
				catInfoVO.setCatID(rs.getInt("CATID"));
				catInfoVO.setMemID(rs.getInt("MEMID"));
				catInfoVO.setShelterName(rs.getString("SHELTERNAME"));
				catInfoVO.setCatName(rs.getString("CATNAME"));
				catInfoVO.setBreed(rs.getString("BREED"));
				catInfoVO.setAge(rs.getInt("AGE"));
				catInfoVO.setSize(rs.getString("SIZE"));
				catInfoVO.setSex(rs.getString("SEX"));
				catInfoVO.setCoatColor(rs.getString("COATCOLOR"));
				catInfoVO.setEyeColor(rs.getString("EYECOLOR"));
				catInfoVO.setHaveVaccine(rs.getBoolean("HAVEVACCINE"));
				catInfoVO.setHealth(rs.getString("HEALTH"));
				catInfoVO.setAdoptCost(rs.getInt("ADOPTCOST"));
				catInfoVO.setAdopt(rs.getBoolean("ADOPT"));
				catInfoVO.setCreateDate(rs.getDate("CREATEDATE"));
				list.add(catInfoVO);
			}
	} catch(SQLException e) {
		throw new RuntimeException("資料庫發生錯誤" + e.getMessage());
	}
		return list;
	}

	public Integer getLastCatID() {
		Integer catID = null;
		try (Connection connection = ds.getConnection();
				PreparedStatement ps = connection.prepareStatement(GET_LAST_CATID)) {
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				catID = rs.getInt("CATID");
			}
		} catch (SQLException e) {
			throw new RuntimeException("資料庫發生錯誤嘍" + e.getMessage());
		}
		return catID;
	}

	@Override
	public List<CatInfoVO> getMulti(CatInfoVO catInfoVO) {
		return null;
	}
	
	@Override
	public List<CatInfoVO> getFavList(List<String> catList) {
		List<CatInfoVO> list = new ArrayList<CatInfoVO>();
		CatInfoVO catInfoVO = null;
		String placeHolders = String.join(",", Collections.nCopies(catList.size(), "?"));
		String sql = GET_FAV_LIST + placeHolders + ")";
//		System.out.println(sql);
		try(Connection connection = ds.getConnection(); 
				PreparedStatement ps = connection.prepareStatement(sql)) {
			
			int i = 1;
		    for (String catID : catList) {
		        ps.setString(i++, catID);
		    }
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				catInfoVO = new CatInfoVO();
				catInfoVO.setCatID(rs.getInt("CATID"));
				catInfoVO.setMemID(rs.getInt("MEMID"));
				catInfoVO.setShelterName(rs.getString("SHELTERNAME"));
				catInfoVO.setCatName(rs.getString("CATNAME"));
				catInfoVO.setBreed(rs.getString("BREED"));
				catInfoVO.setAge(rs.getInt("AGE"));
				catInfoVO.setSize(rs.getString("SIZE"));
				catInfoVO.setSex(rs.getString("SEX"));
				catInfoVO.setCoatColor(rs.getString("COATCOLOR"));
				catInfoVO.setEyeColor(rs.getString("EYECOLOR"));
				catInfoVO.setHaveVaccine(rs.getBoolean("HAVEVACCINE"));
				catInfoVO.setHealth(rs.getString("HEALTH"));
				catInfoVO.setAdoptCost(rs.getInt("ADOPTCOST"));
				catInfoVO.setAdopt(rs.getBoolean("ADOPT"));
				catInfoVO.setCreateDate(rs.getDate("CREATEDATE"));
				list.add(catInfoVO);
			}
	} catch(SQLException e) {
		e.getMessage();
	}
		
	return list;
	}

	@Override
	public CatAndShelVO getOneAndShel(Integer catID) {
		
		CatAndShelVO catAndShelVO = null;
		try (Connection connection = ds.getConnection();
				PreparedStatement ps = connection.prepareStatement(GET_ONEANDSHELTER_STMT)) {
			ps.setInt(1, catID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				catAndShelVO = new CatAndShelVO();
				catAndShelVO.setCatID(rs.getInt("CATID"));
				catAndShelVO.setMemID(rs.getInt("MEMID"));
				catAndShelVO.setShelterName(rs.getString("SHELTERNAME"));
				catAndShelVO.setCatName(rs.getString("CATNAME"));
				catAndShelVO.setBreed(rs.getString("BREED"));
				catAndShelVO.setAge(rs.getInt("AGE"));
				catAndShelVO.setSize(rs.getString("SIZE"));
				catAndShelVO.setSex(rs.getString("SEX"));
				catAndShelVO.setCoatColor(rs.getString("COATCOLOR"));
				catAndShelVO.setEyeColor(rs.getString("EYECOLOR"));
				catAndShelVO.setHaveVaccine(rs.getBoolean("HAVEVACCINE"));
				catAndShelVO.setHealth(rs.getString("HEALTH"));
				catAndShelVO.setAdoptCost(rs.getInt("ADOPTCOST"));
				catAndShelVO.setAdopt(rs.getBoolean("ADOPT"));
				catAndShelVO.setCreateDate(rs.getDate("CREATEDATE"));
				catAndShelVO.setShelterAddr(rs.getString("SHELTERADDR"));
				catAndShelVO.setShelterCity(rs.getString("SHELTERCITY"));
				catAndShelVO.setLongitude(rs.getString("LONGITUDE"));
				catAndShelVO.setLatitude(rs.getString("LATITUDE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return catAndShelVO;
	}
}
