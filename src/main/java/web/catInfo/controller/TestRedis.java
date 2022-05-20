package web.catInfo.controller;

import java.util.*;



import org.json.JSONArray;
import org.json.JSONObject;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import web.catInfo.dao.impl.CatInfoDAOimpl;
import web.catInfo.dao.impl.CatInfoRedisimpl;
import web.catInfo.entity.CatInfoVO;
import web.catInfo.util.JedisUtil;

public class TestRedis {
	public static void main(String[] args) {
		
		JedisPool jedisPool = JedisUtil.getJedisPool();
		Jedis jedis = jedisPool.getResource();
//		new CatInfoDAOimpl().jedisAdd(1, 1);
//		new CatInfoRedisimpl().jedisAdd(2, 10);
		
		List<String> catList1 = jedis.lrange("member:1:favorite", 0, -1);
		List<String> catList2 = jedis.lrange("member:2:favorite", 0, -1);
//		System.out.println(catList);
//		Jedis jedis = null; //
//		try {
//			jedis = new Jedis("localhost", 6379);
//			System.out.println(jedis.ping());
//		} finally {
//			System.out.println(jedis);
//			if (jedis != null) {
//				System.out.println();
//				jedis.close();				
//			}
//		}
		jedis.close();
		JedisUtil.shutdownJedisPool();
//		CatInfoVO myCat1 = new CatInfoVO(1, 2, "收容所1", "Cat1", null, null, null, null, null, null, null, null, null, null, null);
//		CatInfoVO myCat2 = new CatInfoVO(2, 2, "收容所1", "Cat2", null, null, null, null, null, null, null, null, null, null, null);
//		CatInfoVO myCat3 = new CatInfoVO();
////	Pen yourPen = new Pen(2, "Pentel", 50);
//		List<CatInfoVO> list = new ArrayList<CatInfoVO>();
//		list.add(myCat1);
//		list.add(myCat2);
//
//		String jObjStr = new JSONObject(myCat1).toString();
////		System.out.println(jObjStr);
//		
//		
//		String jArrayStr1 = new JSONArray(catList1).toString();
//		String jArrayStr2 = new JSONArray(catList2).toString();
//		System.out.println(jArrayStr1);
//		System.out.println(jArrayStr2);
//		StringBuilder sb = new StringBuilder("mem:").append(myCat1.getMemID());
//		jedis.set(sb.toString(), jArrayStr);
////		jedis.set("cats", jArrayStr);
//		
//	System.out.println(jedis.get(sb.toString()));
//	System.out.println(jedis.get("pens"));
	}

}
