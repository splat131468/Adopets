package web.product.dao.impl;

import java.util.List;

import web.product.dao.ValueDAO;
import web.product.entity.ValueVO;



public class ValueDAOJDBC implements ValueDAO {

	String url = "jdbc:mysql://localhost:3306/Adopets?useUnicode=yes&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Taipei";
	String user = "root";
	String password = "password";

	String sql = "SELECT * FROM VALUE where attrID = ?";

	@Override
	public List<ValueVO> getAllValue(Integer attrID) {
		// TODO Auto-generated method stub
		return null;
	}

// 原版	
//	public List<Map<String, String>> getAllValue(Integer attrID) {
//		List<ValueVO> list = new ArrayList<ValueVO>();
//		try (Connection connection = DriverManager.getConnection(url, user, password);
//				PreparedStatement ps = connection.prepareStatement(sql);) {
//			ps.setInt(1, attrID);
//			ResultSet rs = ps.executeQuery();
//			while (rs.next()) {
//				ValueVO valueVO = new ValueVO();
//				valueVO.setValueID(rs.getInt("valueID"));
//				valueVO.setAttrID(rs.getInt("attrID"));
//				valueVO.setValue(rs.getString("value"));
//				list.add(valueVO);
//			}
//			return list;
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
//
//	}
}
