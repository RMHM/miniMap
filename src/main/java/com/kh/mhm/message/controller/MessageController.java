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
import com.kh.mhm.message.common.util.Paging;
import com.kh.mhm.message.model.service.MessageService;
import com.kh.mhm.message.model.vo.Message;
import com.kh.mhm.message.model.vo.MessageBlock;
import com.kh.mhm.message.model.vo.MessageSmpl;

@Controller
public class MessageController {
	
	@Autowired
	MessageService ms;

	@RequestMapping("/popUp.inbox")
	public String popUpInbox(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, HttpSession session) {
		Member member=(Member) session.getAttribute("member");
		int numPerPage = 9; // 한 페이지당 게시글 수
		
		/*List<Message> message=ms.selectMyMessage(member.getMno());*/
		
		// 1. 현재 페이지 게시글 목록 가져오기
		List<Message> message = ms.selectMyMessage(cPage, numPerPage, member.getMno());
		
		
		// 2. 전체 게시글 개수 가져오기
		int totalContents = ms.countMyMessage(member.getMno());
		
		// 3. 페이지 계산 후 작성할 HTML 추가
		String pageBar = Paging.getPageBar(totalContents, cPage, numPerPage, "/popUp.inbox");
		
		session.setAttribute("message", message);
		session.setAttribute("totalContents", totalContents);
		session.setAttribute("numPerPage", numPerPage);
		session.setAttribute("pageBar", pageBar);
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
	public String pupUpSent(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,HttpSession session) {
		Member member=(Member) session.getAttribute("member");
		
		int numPerPage = 9;
		
		List<Message> message = ms.selectMessageSent(cPage, numPerPage, member.getMno());
		
		int totalContents = ms.countMessageSent(member.getMno());
		
		String pageBar = Paging.getPageBar(totalContents, cPage, numPerPage, "/popUp.sent");
		
		session.setAttribute("message", message);
		session.setAttribute("totalContents", totalContents);
		session.setAttribute("numPerPage", numPerPage);
		session.setAttribute("pageBar", pageBar);
		
		return "message/message_sent";
	}
	
	@RequestMapping("/popUp.store")
	public String pupUpStore(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,HttpSession session) {
		Member member=(Member) session.getAttribute("member");
		int numPerPage = 9;
		List<Message> message=ms.selectMessageStore(cPage, numPerPage, member.getMno());
		int totalContents = ms.countMessageStore(member.getMno());
		String pageBar = Paging.getPageBar(totalContents, cPage, numPerPage, "/popUp.store");
		session.setAttribute("message", message);
		session.setAttribute("totalContents", totalContents);
		session.setAttribute("numPerPage", numPerPage);
		session.setAttribute("pageBar", pageBar);
		return "message/message_store";
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
	public int storeMessageOne(String meId) {
		System.out.println(meId);
		int result=ms.storeMessageOne(Integer.valueOf(meId));
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
	public String sendMessage(String nick, String title, String content, HttpSession session,Model model) {
		MessageSmpl message=new MessageSmpl(((Member)session.getAttribute("member")).getMno(),nick,title,content);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("mNo", message.getmNo());
		map.put("mNick", message.getmNick());
		int blockChk=ms.checkBlock(map);
		System.out.println(blockChk);
		if(blockChk>0) {
			model.addAttribute("msg", "차단한 회원에게는 쪽지를 보낼 수 없습니다."); 
			model.addAttribute("url", "/popUp.write"); 
			return "common/redirect";
		}else {
			int result=ms.sendMessage(message);
			if(session.getAttribute("mNick")!=null||session.getAttribute("mNick")!="") {
				session.removeAttribute("mNick");
			}
			return String.valueOf(result);
		}
		
	}
	
	@RequestMapping("/nick.find")
	@ResponseBody
	public Map<String, Object> findNick(String nick) {

		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable = ms.findNick(nick) == 1 ? true : false;
		map.put("isUsable", isUsable);
		return map;
	}
	
	// 기업회원 승인 허가 쪽지 전송
	@RequestMapping("/message/message.allow")
	public String allowMHM(Model model, @RequestParam("mnick") String mnick) {
		String title="[MHM] 요청해주신 권한이 승인 되었습니다!";
		String content="요청해주신 권한이 승인 되었습니다.";
		MessageSmpl message=new MessageSmpl(1, mnick, title, content);
		int result=ms.sendMessage(message);
		
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
		MessageSmpl message=new MessageSmpl(1, mnick, title, content);
		int result=ms.sendMessage(message);
		String msg = "요청 거부에 대한 쪽지 전송이 완료 되었습니다.";
		String loc = "/manager/managerPage.go";
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/popUp.block")
	public String popUpblock(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, HttpSession session) {
		Member member=(Member) session.getAttribute("member");
		int numPerPage = 12;
		
		List<Message> block = ms.selectMessageBlock(cPage, numPerPage, member.getMno());
		
		
		int totalContents = ms.countMessageBlock(member.getMno());
		
		String pageBar = Paging.getPageBar(totalContents, cPage, numPerPage, "/popUp.block");
		
		session.setAttribute("block", block);
		session.setAttribute("totalContents", totalContents);
		session.setAttribute("numPerPage", numPerPage);
		session.setAttribute("pageBar", pageBar);
		return "message/message_block";
	}
	
	@RequestMapping(value="/message.unblock", method = {RequestMethod.POST})
	@ResponseBody
	public int unblockMessage(String[] arr, int mNo) {
		int result=ms.unblockMessage(arr,mNo);
		return result;
	}
	
	@RequestMapping("/block.member")
	public String popUpBlockMessage(HttpSession session) {
		int mNo=((Member)session.getAttribute("member")).getMno();
		String mNick=((Member)session.getAttribute("member")).getMnick();
		session.setAttribute("mNo", mNo);
		session.setAttribute("mNick", mNick);
		return "message/askBlock";
	}
	
	@RequestMapping(value="/message.ban", method = {RequestMethod.POST})
	@ResponseBody
	public int banMessage(int mNo, String mNick,String content) {
		MessageBlock mb=new MessageBlock();
		mb.setmNo(mNo);
		mb.setBlock_mNick(mNick);
		mb.setBlock_note(content);
		int result=ms.banMessage(mb);
		return result;
	}
}
