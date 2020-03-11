package org.sangmin.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

//웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String payloadMessage = (String) message.getPayload();
		System.out.println("서버에 도착한 메시지:" + payloadMessage);
		
		
		Map<String, Object> map = session.getAttributes();
		String userId = (String) map.get("userName");
		System.out.println("전송자 아이디:" + userId);
		
		session.sendMessage(new TextMessage(userId + " : " + payloadMessage));

	
	}

// 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		super.afterConnectionEstablished(session);
		System.out.println("클라이언트 접속됨");

		Map<String, Object> map = session.getAttributes();
		String id = (String) map.get("userName");
	}

// 클라이언트가 접속을 종료하면 호출되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		System.out.println("클라이언트 접속해제");
	}

// 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
		System.out.println("전송오류 발생");
	}

}