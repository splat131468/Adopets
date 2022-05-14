package web.catInfo.dao.impl;

import java.util.List;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import web.catInfo.dao.CatInfoRedis;
import web.catInfo.util.JedisUtil;

public class CatInfoRedisimpl implements CatInfoRedis{

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

}
