package web.product.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import web.product.dao.SkuDAO;
import web.product.entity.SkuVO;



public class SkuDAOJDBC implements SkuDAO {

	String url = "jdbc:mysql://localhost:3306/Adopets?useUnicode=yes&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Taipei";
	String user = "root";
	String password = "password";
	
	String istSkuSQL = "insert into SKU (spuID,skuPrice ,stock, specAttr, status, addedTime) values( ? , ? , ? , ? , ? , ? )";
	

	
	@Override
	public int insertSKU(List<SkuVO> skus) {
		
		
		int res = -1;
		try (Connection connection = DriverManager.getConnection(url, user, password);
				PreparedStatement ps = connection.prepareStatement(istSkuSQL);) {
			
			for(SkuVO sku:skus) {
		
				ps.setInt(1, sku.getSpuID());
				ps.setInt(2, sku.getSkuPrice());
				ps.setInt(3, sku.getStock());
				ps.setString(4, sku.getSpecAttr());
				ps.setInt(5, sku.getStatus());
				ps.setTimestamp(6, sku.getAddedTime());
				ps.addBatch();
			}
			ps.executeBatch();
			res=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
		
		
		
	}

	
	String updateSku = "update SKU set skuPrice = ? , stock = ? , status = ? where skuId = ?";  ; 
	@Override
	public int updateProd(SkuVO skuVO) {
		int index = -1;
		try (Connection connection = DriverManager.getConnection(url, user, password);
				PreparedStatement ps = connection.prepareStatement(updateSku);) {
			ps.setInt(1, skuVO.getSkuPrice());
			ps.setInt(2, skuVO.getStock());
			ps.setInt(3, skuVO.getStatus());
			ps.setInt(4, skuVO.getSkuID());
			index = ps.executeUpdate();
			return index;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return index;
	}
	
	

}
