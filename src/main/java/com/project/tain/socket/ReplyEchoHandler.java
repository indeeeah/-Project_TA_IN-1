package com.project.tain.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ReplyEchoHandler extends TextWebSocketHandler {
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();

	// 연결되었을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결됐다~ session : "+session);
		System.out.println(session.getUri());
		String uri = session.getUri().toString();
		String[] arr = uri.split("=");
		String ID = arr[1];
		userSessions.put(ID, session);
	}

	// 메세지가 왔을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//메세지 형태는 보내는아이디,받는아이디,메세지내용
		String msg = message.getPayload();
		String[] strs = msg.split(",");
		if (strs != null) {
			String id = strs[0];
			String toid = strs[1];
			String content = strs[2];
			
			WebSocketSession m_id = userSessions.get(toid);
			if (m_id != null) {
				TextMessage tmpMsg = new TextMessage(id + "님이 "
						+ "메시지를 보냈습니다!"+content);
				m_id.sendMessage(tmpMsg);
			}
		}
	}

	// 종료되었을때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed :" + session + " : " + status);
	}

}
