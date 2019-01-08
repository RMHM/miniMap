package com.kh.mhm.message.common;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.message.model.service.MessageService;

@Controller
public class NoticeHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Logger logger = LoggerFactory.getLogger(NoticeHandler.class);
	
	@Autowired
	MessageService ms;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);

		logger.info("쪽지 웹소켓", session.getId());

		System.out.println(""+session.getId());
		// super.afterConnectionEstablished(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Member member=(Member)session.getAttributes().get("member");
		
		if(member!=null) {
			String counts=String.valueOf(ms.countNewMessage(member.getMno()));
			System.out.println("new message :: "+counts);
			
			for(WebSocketSession one:sessionList) {
				one.sendMessage(new TextMessage(counts));
			}
		}
		

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