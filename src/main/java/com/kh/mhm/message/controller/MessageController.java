package com.kh.mhm.message.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String pupUpWrite(HttpServletRequest req,HttpSession session) throws UnsupportedEncodingException {
		if(req.getQueryString()==null||req.getQueryString()=="") {
			if(session.getAttribute("mNick")!=null||session.getAttribute("mNick")!="") {
				session.removeAttribute("mNick");
			}
			return "message/message_write";
		}else {
			if(session.getAttribute("mNick")!=null||session.getAttribute("mNick")!="") {
				session.removeAttribute("mNick");
			}
			String mNick=URLDecoder.decode(req.getQueryString(), "UTF-8");
			System.out.println("QS::"+mNick);
			session.setAttribute("mNick", mNick);
			return "message/message_write";
		}
		
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
		if(session.getAttribute("mNick")!=null||session.getAttribute("mNick")!="") {
			session.removeAttribute("mNick");
		}
		return result;
	}
	
	@RequestMapping("/nick.find")
	@ResponseBody
	public Map<String, Object> findNick(String nick) {

		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable = ms.findNick(nick) == 1 ? true : false;
		map.put("isUsable", isUsable);
		return map;
	}
	
	// 회원가입 축하 쪽지 전송
	// 나중에 회원가입쪽과 연동
	@RequestMapping("/message.welcome")
	public String welcomeMHM() {
		String title="회원가입을 축하드립니다!";
		String content="회원님의 가입을 진심으로 축하드리며 미니맵에서 즐거운 여행 되시길 바랍니다.";
		// 사이트 관리자의 회원번호는 1번 고정해야함
		MessageSmpl message=new MessageSmpl(1, "사이트관리자", title, content);
		int result=ms.sendMessage(message);
		// result 결과에 따른 에러처리(추후 진행)
		return "/";
	}
	
	// 기업회원 승인 허가 쪽지 전송
	@RequestMapping("/message/message.allow")
	public String allowMHM(Model model, @RequestParam("mnick") String mnick) {
		String title="[MHM] 요청해주신 권한이 승인 되었습니다!";
		String content="요청해주신 권한이 승인 되었습니다.";
		// 사이트 관리자의 회원번호는 1번 고정해야함
		MessageSmpl message=new MessageSmpl(1, mnick, title, content);
		int result=ms.sendMessage(message);
		// result 결과에 따른 에러처리(추후 진행)
		
		String msg = "요청 승인에 대한 쪽지 전송이 완료 되었습니다.";
		String loc = "/manager/managerPage.go";
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	// 기업회원 승인 거절 쪽지 전송
	@RequestMapping("/message/message.reject")
	public String rejectMHM(@RequestParam("content") String content, @RequestParam("mnick") String mnick, Model model) {
		String title="[MHM] 요청해주신 권한이 거절 되었습니다.";
		System.out.println("MSG사유 : " + content);
		// 사이트 관리자의 회원번호는 1번 고정해야함
		MessageSmpl message=new MessageSmpl(1, mnick, title, content);
		int result=ms.sendMessage(message);
		// result 결과에 따른 에러처리(추후 진행)
		String msg = "요청 거부에 대한 쪽지 전송이 완료 되었습니다.";
		String loc = "/manager/managerPage.go";
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}
}
