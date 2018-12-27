package com.kh.mhm.message.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.message.model.service.MessageService;
import com.kh.mhm.message.model.vo.Message;
import com.kh.mhm.message.model.vo.MessageSmpl;

@Controller
public class MessageController {
	
	@Autowired
	MessageService ms;

	@RequestMapping("/popUp.inbox")
	public String popUpInbox(HttpSession session) {
		Member member=(Member) session.getAttribute("member");
		List<Message> message=ms.selectMyMessage(member.getMno());
		session.setAttribute("message", message);
		return "message/message_inbox";
	}
	
	@RequestMapping("/popUp.write")
	public String pupUpWrite() {
		return "message/message_write";
	}
	
	@RequestMapping("/popUp.sent")
	public String pupUpSent(HttpSession session) {
		Member member=(Member) session.getAttribute("member");
		List<Message> message=ms.selectMessageSent(member.getMno());
		session.setAttribute("message", message);
		return "message/message_sent";
	}
	
	@RequestMapping("/popUp.store")
	public String pupUpStore(HttpSession session) {
		Member member=(Member) session.getAttribute("member");
		List<Message> message=ms.selectMessageStore(member.getMno());
		session.setAttribute("message", message);
		return "message/message_store";
	}
	
	@RequestMapping("/popUp.block")
	public String pupUpBlock() {
		return "message/message_block";
	}
	
	@RequestMapping(value="/message.delete", method = {RequestMethod.POST})
	@ResponseBody
	public int deleteMessage(int[] arr) {
		int result=ms.deleteMessage(arr);
		return result;
	}
	
	@RequestMapping(value="/message.store", method = {RequestMethod.POST})
	@ResponseBody
	public int storeMessage(int[] arr) {
		int result=ms.storeMessage(arr);
		return result;
	}
	
	@RequestMapping(value="/message.allread", method = {RequestMethod.POST})
	@ResponseBody
	public int storeMessage(String nick) {
		int result=ms.readAllMessage(nick);
		return result;
	}
	
	@RequestMapping("/detail.inbox")
	public String selectDetailInbox(HttpServletRequest req,HttpSession session) {
		System.out.println(req.getQueryString());
		Message message=ms.selectDetailInbox(req.getQueryString());
		//readflag update
		int result=0;
		if(message.getReadFlag()!="Y") {
			result=ms.updateReadFlag(message.getMeId());
		}
		// 에러처리
		
		session.setAttribute("message", message);
		return "message/detail_inbox";
	}
	
	@RequestMapping(value="/message.deleteOne", method = {RequestMethod.POST})
	@ResponseBody
	public int deleteMessageOne(int meId) {
		int result=ms.deleteMessageOne(meId);
		return result;
	}
	
	@RequestMapping(value="/message.storeOne", method = {RequestMethod.POST})
	@ResponseBody
	public int storeMessageOne(int meId) {
		int result=ms.storeMessageOne(meId);
		return result;
	}
	
	@RequestMapping("/detail.store")
	public String selectDetailStore(HttpServletRequest req,HttpSession session) {
		System.out.println(req.getQueryString());
		Message message=ms.selectDetailStore(req.getQueryString());
		//readflag update
		int result=0;
		if(message.getReadFlag()!="Y") {
			result=ms.updateReadFlag(message.getMeId());
		}
		// 에러처리
		
		session.setAttribute("message", message);
		return "message/detail_store";
	}
	
	@RequestMapping(value="/sent.delete", method = {RequestMethod.POST})
	@ResponseBody
	public int deleteSentMessage(int[] arr) {
		int result=ms.deleteSentMessage(arr);
		return result;
	}
	
	@RequestMapping("/detail.sent")
	public String selectDetailSent(HttpServletRequest req,HttpSession session) {
		System.out.println(req.getQueryString());
		Message message=ms.selectDetailSent(req.getQueryString());
		
		// 에러처리
		
		session.setAttribute("message", message);
		return "message/detail_sent";
	}
	
	@RequestMapping(value="/sent.deleteOne", method = {RequestMethod.POST})
	@ResponseBody
	public int deleteSentOne(int meId) {
		int result=ms.deleteSentOne(meId);
		return result;
	}
	
	@RequestMapping(value="/message.write", method = {RequestMethod.POST})
	@ResponseBody
	public int sendMessage(String nick, String title, String content, HttpSession session) {
		MessageSmpl message=new MessageSmpl(((Member)session.getAttribute("member")).getMno(),nick,title,content);
		int result=ms.sendMessage(message);
		return result;
	}
	
}
