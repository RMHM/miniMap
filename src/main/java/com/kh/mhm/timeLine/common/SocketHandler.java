package com.kh.mhm.timeLine.common;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.timeLine.model.service.TimeLineService;
import com.kh.mhm.timeLine.model.vo.TimeLineSmpl;

@Controller
public class SocketHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Logger logger = LoggerFactory.getLogger(SocketHandler.class);

	@Autowired
	TimeLineService tlsi;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);

		logger.info("{}연결됨", session.getId());

		System.out.println("타임라인 입장자 :"+session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("session주소 : "+session.getRemoteAddress());
		System.out.println(session.getAttributes().get("userName"));

		String nick=(String)session.getAttributes().get("userName");
		System.out.println("nick::"+nick);

		Member member=tlsi.getMemberByNick(nick);

		System.out.println(member.toString());
    
		String text=message.getPayload();
		StringTokenizer st=new StringTokenizer(text,"|%%|&");
		String content=st.nextToken();
		String tag=st.nextToken();
		String type=st.nextToken();
		TimeLineSmpl tls=new TimeLineSmpl(type,member.getMno(),content,tag);
		System.out.println(tls.toString());
		int result=tlsi.insertTimeLine(tls);
		String profPath=member.getProfilePath();
		System.out.println("profPath::"+profPath);
		System.out.println("content::"+content);
		System.out.println("tag::"+tag);
		switch(type) {
		case "S":type="교통"; break;
		case "W":type="날씨"; break;
		case "F":type="먹거리"; break;
		case "T":type="볼거리"; break;
		case "E":type="기타";
		}
    


		for (WebSocketSession one : sessionList) {
			one.sendMessage(new TextMessage(session.getId() + "|%%|&" 
						+content+"|%%|&"
						+session.getRemoteAddress()+"|%%|&"
						+session.getAttributes().get("userName")+"|%%|&"
						+profPath+"|%%|&"
						+tag+"|%%|&"
						+result+"|%%|&"
						+type));
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		sessionList.remove(session);
		logger.info("{}연결끊김",session.getId());

		for (WebSocketSession one : sessionList) {
			if(one==session) continue;
			one.sendMessage(new TextMessage(session.getAttributes().get("userName")+"님이 퇴장하셨습니다."));
		}

	}

}