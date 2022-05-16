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



@ServerEndpoint("/TogetherWS/{catName}")
public class ChatWS {

	private static final Map<Integer, Set<Session>> connectedSessions = new ConcurrentHashMap<>();
	
	private static final Set<Session> set = Collections.synchronizedSet(new HashSet<Session>());

	Gson gson = new Gson();

	@OnOpen
	public void onOpen(@PathParam("catName") String catName, Session userSession) throws IOException {
		set.add(userSession);
	

	}

	@OnMessage
	public void onMessage(Session userSession, String message) {
		

		
		for (Session session : set) {
			if (session.isOpen())
				session.getAsyncRemote().sendText(message);
		}
		System.out.println("Message received: " + message);
	}

	


	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		
		
		
		set.remove(userSession);
	
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

}
