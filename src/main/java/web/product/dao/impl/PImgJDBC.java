package web.product.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;



import web.product.dao.PImgDAO;
import web.product.entity.PImgVO;


public class PImgJDBC implements PImgDAO {

	String url = "jdbc:mysql://localhost:3306/Adopets?useUnicode=yes&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Taipei";
	String user = "root";
	String password = "password";

	String istsql = "insert into PIMG (spuID ,spuImg ,mainImg) values(?,?,?);";

	@Override
	public int uploadPics(List<PImgVO> imgList) {
		int res = -1;

		try (Connection connection = DriverManager.getConnection(url, user, password);
				PreparedStatement ps = connection.prepareStatement(istsql);) {
			for (PImgVO vo : imgList) {
				
				
				
				ps.setInt(1, vo.getSpuID());
				ps.setBytes(2, vo.getSpuImg());
				ps.setInt(3, vo.getMainImg());
				ps.addBatch();
			}
			ps.executeBatch();
			res=1;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	
	String sqlForPic = "select spuImg from  sku k  "
			+ "join spu p\n"
			+ "		on k.spuID = p.spuID  "
			+ "		join  pImg c "
			+ "            on p.spuID = c.spuID "
			+ "		where k.skuID = ? and mainImg = 1 ;";
	
	@Override
	public PImgVO getPicByID(Integer skuID) {
		
		PImgVO pImgVO = new PImgVO();
		
		try (Connection connection = DriverManager.getConnection(url, user, password);
				PreparedStatement ps = connection.prepareStatement(sqlForPic);) {
				
				ps.setInt(1, skuID);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					pImgVO.setSpuImg(rs.getBytes(1));
				}
				return pImgVO;
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

}
