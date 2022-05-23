package web.chatroom.dao;

import java.util.List;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import web.chatroom.util.JedisPoolUtil;

public class CatChatRoomMessage {

	private static JedisPool pool = JedisPoolUtil.getJedisPool();

	public static List<String> getHistoryMsg(String catName) {
		String key = new StringBuilder("catID").append(":").append(catName).toString();
		Jedis jedis = null;
		jedis = pool.getResource();
		List<String> historyData = jedis.lrange(key, 0, -1);
		jedis.close();
		return historyData;
	}

	public static void saveChatMessage(String catID, String message) {
		String senderKey = new StringBuilder("catID").append(":").append(catID).toString();
//		String receiverKey = new StringBuilder(receiver).append(":").append(sender).toString();
		Jedis jedis = pool.getResource();
		jedis.rpush(senderKey, message);
//		jedis.rpush(receiverKey, message);

		jedis.close();
	}

}
