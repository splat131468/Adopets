package web.chat.model;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;



@ServerEndpoint("/TogetherWS/{catID}")
public class ChatWS {

	private static final Map<String, Set<Session>> connectedSessions = new ConcurrentHashMap<>();
	private static JedisPool pool = JedisPoolUtil.getJedisPool();
	
	Gson gson = new Gson();

	@OnOpen
	public void onOpen(@PathParam("catID") String catID, Session userSession) throws IOException {
		Set<Session> set = connectedSessions.get(catID);
		if (set == null) {
			Set<Session> newSet = new HashSet<>();
			newSet.add(userSession);
			connectedSessions.put(catID, newSet);
		} else {
			set.add(userSession);
			
		}
	}

	@OnMessage
	public void onMessage(Session userSession, String message) {
		ChatMessage chatMessage = gson.fromJson(message, ChatMessage.class);
		String catID =CatinfoVO.catID;
		String userName = MemberVO.memName;
		if ("history".equals(chatMessage.getType())) {
			List<String> historyData = JedisHandleMessage.getHistoryMsg(catID);
			String historyMsg = gson.toJson(historyData);
			ChatMessage cmHistory = new ChatMessage("history", userName, historyMsg);
			if (userSession != null && userSession.isOpen()) {
				userSession.getAsyncRemote().sendText(gson.toJson(cmHistory));
				System.out.println("history = " + gson.toJson(cmHistory));
				return;
			}
		}
		
		Set<Session> Session = connectedSessions.get(catID);
		if (Session != null && ((javax.websocket.Session) Session).isOpen()) {
			((javax.websocket.Session) Session).getAsyncRemote().sendText(message);
			userSession.getAsyncRemote().sendText(message);
			JedisHandleMessage.saveChatMessage(catID, userName, message);
		}
		System.out.println("Message received: " + message);
	}

	


	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		String catID =CatinfoVO.catID;
		Set<Session> set = connectedSessions.get(catID);
		
		set.remove(userSession);
	
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}
	


		

}
