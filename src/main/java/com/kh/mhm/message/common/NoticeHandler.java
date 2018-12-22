package com.kh.mhm.message.common;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.mhm.message.model.service.MessageServiceImpl;


public class NoticeHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList = new ArrayList();
	private Logger logger = LoggerFactory.getLogger(NoticeHandler.class);

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//		sessionList.add(session);
		//
		//		logger.info("{}연결됨", session.getId());
		//		
		//		System.out.println("채팅방 입장자 :"+session.getId() );
		// super.afterConnectionEstablished(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		this.logger.info(message.getPayload());

		MessageServiceImpl msi=new MessageServiceImpl();

		int result=msi.countNewMessage(message.getPayload());

		session.sendMessage(new TextMessage(String.valueOf(result))); 


	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		//		sessionList.remove(session);
		//		logger.info("{}연결끊김",session.getId());
		//		
		//		for (WebSocketSession one : sessionList) {
		//			if(one==session) continue;
		//			one.sendMessage(new TextMessage(session.getAttributes().get("userName")+"님이 퇴장하셨습니다."));
		//		}


		//super.afterConnectionClosed(session, status);
	}

}