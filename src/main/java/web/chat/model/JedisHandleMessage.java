package web.chat.model;

import java.util.List;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisHandleMessage {


	private static JedisPool pool = JedisPoolUtil.getJedisPool();

	public static List<String> getHistoryMsg(String catID) {
		String key = new String(catID);
		Jedis jedis = null;
		jedis = pool.getResource();
		List<String> historyData = jedis.lrange(key, 0, -1);
		jedis.close();
		return historyData;
	}

	public static void saveChatMessage(String catID, String userName, String message) {
	
		String Key = new StringBuilder(catID).append(":").append(userName).toString();
		Jedis jedis = pool.getResource();
		jedis.rpush(Key, message);
		jedis.close();
	}

}
