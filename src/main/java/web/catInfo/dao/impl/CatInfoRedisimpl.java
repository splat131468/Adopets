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

import org.json.JSONArray;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import web.catInfo.dao.CatInfoRedis;
import web.catInfo.entity.CatInfoVO;
import web.catInfo.util.JedisUtil;

public class CatInfoRedisimpl implements CatInfoRedis{
	
	private static DataSource ds = null;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jndi");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String GET_ONE_STMT = 
			"SELECT * FROM CATINFO WHERE CATID = ? ";

	@Override
	public void jedisAdd(Integer memID, Integer catID) {
		
		JedisPool jedisPool = JedisUtil.getJedisPool();
		Jedis jedis = jedisPool.getResource();
		List<String> catList = jedis.lrange("member:" + memID + ":favorite", 0, -1);
		if (catList.size() == 0) {
			jedis.rpush("member:" + memID+"" + ":favorite", catID+"");
			jedis.close();
		} else {
			jedis.lpush("member:" + memID+"" + ":favorite", catID+"");
		}
	}

	@Override
	public void jedisDelete(Integer memID, Integer catID) {
		JedisPool jedisPool = JedisUtil.getJedisPool();
		Jedis jedis = jedisPool.getResource();

		List<String> catList = jedis.lrange("member:" + memID + ":favorite", 0, -1);

		if (memID != null && catID != null) {

			for (int i = 0; i < catList.size(); i++) {

				String existID = catList.get(i); //index

				if (existID.equals(catID)) {

					jedis.lrem("member:" + memID + ":favorite",0 , catID+"");
					jedis.close();
				}
			}
		}
	}

	@Override
	public void jedisAddCatVO(Integer memID, Integer catID) {
		JedisPool jedisPool = JedisUtil.getJedisPool();
		Jedis jedis = jedisPool.getResource();
		
		CatInfoVO catInfoVO = null;
		
//SQL
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
		} catch (Exception e) {
			e.printStackTrace();
		}
//SQL		
		
		
//		List<CatInfoVO> catList = new ArrayList<>();
		List<String> catList = jedis.lrange("member:" + memID + ":favorite", 0, -1);
//		catList.add(catInfoVO);
		String jArrayStr = new JSONArray(catList).toString();
		
		if (catList.size() == 0) {
			jedis.rpush("member:" + memID+"" + ":favorite", catID+"");
			jedis.close();
		} else {
			jedis.lpush("member:" + memID+"" + ":favorite", catID+"");
		}
		
	}

}
