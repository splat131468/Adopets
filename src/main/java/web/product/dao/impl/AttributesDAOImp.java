package web.product.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.product.dao.AttributesDAO;
import web.product.entity.AttrWithValue;



public class AttributesDAOImp implements AttributesDAO {

	String url = "jdbc:mysql://localhost:3306/ADOPETS?useUnicode=yes&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Taipei";
	String user = "root";
	String password = "password";
	Connection con;

	private static final String GET_ALL_ATTR = "select attrName, value  " + "from  ATTRIBUTES  a " + "	join VALUE e "
			+ "	on a.attrID = e.attrID " + "    where ctgID = ?; ";

	
//	public static void main(String[] args) {
//		AttributesDAOImp attributesDAOImp = new AttributesDAOImp(); 
//		List<AttrWithValue> all = attributesDAOImp.getAll(1);
//		System.out.println(all);
//	}
	
	@Override
	public List<AttrWithValue> getAll(Integer ctgID) {

		List<AttrWithValue> list = new ArrayList<>();
		// AttrWithValue List<String>
		List<String> attrValist = new ArrayList<String>();
		try (Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement ps = con.prepareStatement(GET_ALL_ATTR);) {
			ps.setInt(1, ctgID);
			ResultSet rs = ps.executeQuery();
			String temp = "";
			AttrWithValue attrWithValue = new AttrWithValue();
			while (rs.next()) {
				// 屬性名稱不一樣則建立新的物件
				String attrName = rs.getString("attrName");
				if (!(temp).equals(attrName)) { // 判斷下個屬性名
				
					// 第一個不能加入
					if (!rs.isFirst()) {
						attrWithValue.setValueList(attrValist);
						list.add(attrWithValue);
					}
					attrValist = new ArrayList<String>();
					attrWithValue = new AttrWithValue();
					attrWithValue.setAttrName(rs.getString("attrName"));
					
				}
				temp = rs.getString("attrName"); // 目前屬性名
				
				attrValist.add(rs.getString("value"));
				
				// 最後一個要補加入！
				if (rs.isLast()) {
					attrWithValue.setValueList(attrValist);
					list.add(attrWithValue);
				}

			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	String addSql = "insert into ATTRIBUTES (ctgID, attrName) values(? , ?)";

	public int addAttr(Integer ctgID, String attrName) {

		try (Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement ps = con.prepareStatement(addSql);) {
			ps.setInt(1, ctgID);
			ps.setString(2, attrName);

			int update = ps.executeUpdate();
			return update;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}

	String updateSql = "update ATTRIBUTES set attrName = ? where attrID = ?";

	public int updateAttr(String attrName, Integer attrID) {
		try (Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement ps = con.prepareStatement(updateSql);) {

			ps.setString(1, attrName);
			ps.setInt(2, 1);
			int update = ps.executeUpdate();
			return update;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	String delSql = "delete from ATTRIBUTES where attrID = ?";

	public int delAttr(Integer attrID) {
		try (Connection con = DriverManager.getConnection(url, user, password);
				PreparedStatement ps = con.prepareStatement(delSql);) {
			ps.setInt(1, attrID);
			int del = ps.executeUpdate();
			return del;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
