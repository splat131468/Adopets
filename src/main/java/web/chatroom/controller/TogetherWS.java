package web.chatroom.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
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

import web.chatroom.dao.CatChatMessage;
import web.chatroom.dao.CatChatRoomMessage;



@ServerEndpoint("/TogetherWS/{catID}")
public class TogetherWS {
	 private static final Map<String, Set<Session>> connectedSessions = new ConcurrentHashMap<>();
//	private static final Set<Session> connectedSessions = Collections.synchronizedSet(new HashSet<>());
	Gson gson = new Gson();
	/*
	 * 如果想取得HttpSession與ServletContext必須實作
	 * ServerEndpointConfig.Configurator.modifyHandshake()，
	 * 參考https://stackoverflow.com/questions/21888425/accessing-servletcontext-and-httpsession-in-onmessage-of-a-jsr-356-serverendpoint
	 */
//	@OnOpen
//	public void onOpen(@PathParam("userName") String userName, Session userSession) throws IOException { //利用
//		connectedSessions.add(userSession);//加入各個使用者
//		String text = String.format("Session ID = %s, connected; userName = %s", userSession.getId(), userName);
//		System.out.println(text);
//	}
	
	@OnOpen
	 public void onOpen(@PathParam("catID") String catID, Session userSession) throws IOException {
//	  System.out.println("onOpen");
		Set<Session> set = connectedSessions.get(catID);
	  if (set == null) {
	   Set<Session> newSet = new HashSet<>();
	   newSet.add(userSession);
	   connectedSessions.put(catID, newSet);
	  } else {
	   set.add(userSession);
	  }
		String text = String.format("Session ID = %s, connected; catID = %s", userSession.getId(), catID);
		System.out.println(text);
	  
	 }

	@OnMessage
	public void onMessage(Session userSession, String message) {
		System.out.println("mes:"+message);
		CatChatMessage catChatMessage = gson.fromJson(message, CatChatMessage.class);
		
		String catID = catChatMessage.getCatID(); 
//		System.out.println("ON MESSAGE catID " + catID);
		Set<Session> set = connectedSessions.get(catID);
//		System.out.println("ON MESSAGE set " + set);
		
		
		
		if ("history".equals(catChatMessage.getType())) {
			List<String> historyData = CatChatRoomMessage.getHistoryMsg(catID);
			String historyMsg = gson.toJson(historyData); //把撈到的list轉成string
			CatChatMessage catCmHistory = new CatChatMessage("history", catID, historyMsg);
			if (userSession != null && userSession.isOpen()) {
				userSession.getAsyncRemote().sendText(gson.toJson(catCmHistory)); //給前端一個json
				System.out.println("history = " + gson.toJson(catCmHistory));
				return;
			}
		}
		
		
		
		CatChatRoomMessage.saveChatMessage(catID, message); //把message(from json) 存進redis				
		
		for (Session session : set) {
			if (session.isOpen()) {
				session.getAsyncRemote().sendText(message);//當還存在這個user連線時，送message給user
			}
			
		}
		System.out.println("來自 onMessage received: " + message);
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		connectedSessions.remove(userSession);
		String text = String.format("session ID = %s, disconnected; close code = %d; reason phrase = %s",
				userSession.getId(), reason.getCloseCode().getCode(), reason.getReasonPhrase());
		System.out.println(text);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

}
