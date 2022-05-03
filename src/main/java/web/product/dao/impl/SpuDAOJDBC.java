package web.product.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import web.product.dao.SpuDAO;
import web.product.entity.SkuVO;
import web.product.entity.SpuVO;



public class SpuDAOJDBC implements SpuDAO {

	String url = "jdbc:mysql://localhost:3306/ADOPETS?useUnicode=yes&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Taipei";
	String user = "root";
	String password = "password";
	
	
	String spuSQL = "insert into SPU (`ctgID` ,`spuName`,`descript`) values(?,?,?);";
	

	
	@Override
	public SpuVO inserSPU(SpuVO spuVO) {
		
		// array 接gk value
		String[] spuID = { "spuID" };
		int gk = -1;
		try (Connection connection = DriverManager.getConnection(url, user, password);
				PreparedStatement ps = connection.prepareStatement(spuSQL, spuID);) {
			ps.setInt(1, spuVO.getCtgID());
			ps.setString(2, spuVO.getSpuName());
			ps.setString(3, spuVO.getDescript());
			int rowC = ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				gk = rs.getInt(1);
			}
			spuVO.setSpuID(gk);
			return spuVO;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return spuVO;		
	}

	@Override
	public List<SkuVO> getAllProd() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SkuVO> queryByName(String prodName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SkuVO> getMainPage() {
		// TODO Auto-generated method stub
		return null;
	}

	

}
