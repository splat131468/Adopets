package web.catInfo.dao.impl;

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

import web.catInfo.dao.CatPhotoGalleryDAO;
import web.catInfo.entity.CatPhotoGalleryVO;



public class CatPhotoGalleryDAOImp implements CatPhotoGalleryDAO {
	
private static DataSource ds = null;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB3");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = 
			"INSERT INTO CATPHOTOGALLERY (CATID, CATIMG, PHOTODATE) VALUES( ?, ?, ?)";

	private static final String DELETE =
			"DELETE FROM CATPHOTOGALLERY WHERE IMGID = ?";
	
	private static final String GET_ONE_STMT = 
			"SELECT * FROM CATPHOTOGALLERY WHERE CATID = ? AND CATIMG IS NOT NULL";
	
	@Override
	public boolean insert(CatPhotoGalleryVO catPhotoGalleryVO) {
		int rowCount = 0;
		try(Connection connection = ds.getConnection();
				PreparedStatement ps = connection.prepareStatement(INSERT_STMT)){
			ps.setInt(1, catPhotoGalleryVO.getCatID());
			ps.setBytes(2, catPhotoGalleryVO.getCatImg());
			ps.setTimestamp(3, catPhotoGalleryVO.getPhotoDate());
			rowCount = ps.executeUpdate();
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		return rowCount != 0;
	}

	@Override
	public boolean delete(Integer imgID) {
		int rowCount = 0;
		try(Connection connection = ds.getConnection();
				PreparedStatement ps = connection.prepareStatement(DELETE)) {
			ps.setInt(1, imgID);
			rowCount = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rowCount != 0;
	}

	@Override
	public List<CatPhotoGalleryVO> getOneCat(Integer catID) {
		List<CatPhotoGalleryVO> list = new ArrayList<CatPhotoGalleryVO>();
		CatPhotoGalleryVO catPhotoGalleryVO = null;
		try(Connection connection = ds.getConnection(); 
				PreparedStatement ps = connection.prepareStatement(GET_ONE_STMT)) {
			ps.setInt(1, catID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				catPhotoGalleryVO = new CatPhotoGalleryVO();
				catPhotoGalleryVO.setImgID(rs.getInt("IMGID"));
				catPhotoGalleryVO.setCatID(rs.getInt("CATID"));
				catPhotoGalleryVO.setCatImg(rs.getBytes("CATIMG"));
				catPhotoGalleryVO.setPhotoDate(rs.getTimestamp("PHOTODATE"));
				list.add(catPhotoGalleryVO);
			}
	} catch(Exception e) {
		e.printStackTrace();
	}
		return list;
		
	}

}
