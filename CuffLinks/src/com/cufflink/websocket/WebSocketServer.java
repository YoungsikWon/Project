package com.cufflink.websocket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@ServerEndpoint("/WebSocketServer")
public class WebSocketServer {

	Logger logger = Logger.getLogger(WebSocketServer.class);

	static List<Session> users = new ArrayList<>();
	Session session;
	
	@OnOpen
	public void onOpen(Session session) {
		this.session = session;
		users.add(session);
	}

	@OnMessage
	public void onMessage(String data, Session session) {
		for (Session sess : users) {
			sess.getAsyncRemote().sendText(data);
		}
	}
	
	@OnClose
	public void onClose() {
		users.remove(this.session);
		System.out.println("closed!");
	}

	@OnError
	public void onError(Throwable t) {
		users.remove(this.session);
		t.printStackTrace();
	}
}
