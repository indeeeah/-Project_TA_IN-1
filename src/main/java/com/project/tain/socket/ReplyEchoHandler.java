package com.project.tain.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import com.project.tain.membermanage.model.service.mMessageServiceImpl;
import com.project.tain.membermanage.model.vo.mMessageVO;

@Controller
public class ReplyEchoHandler extends TextWebSocketHandler {
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	@Autowired
	private mMessageServiceImpl mMessageServiceImpl;

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
			String m_date = strs[3];
			mMessageVO mvo = new mMessageVO(id, toid, content, m_date, "N");
			mvo.setM_id(id);
			mvo.setM_id2(toid);
			mvo.setM_message(content);
			mvo.setM_date(m_date);
			mvo.setM_check("N");
			System.out.println(mvo);
			if(content != "!Alarm") {
				mMessageServiceImpl.sendMessage(mvo);
			}
			WebSocketSession m_id = userSessions.get(toid);
			if (m_id != null) {
				TextMessage tmpMsg = new TextMessage(id+","+content);
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
