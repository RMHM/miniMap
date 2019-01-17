package com.kh.mhm.timeLine.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.timeLine.model.service.TimeLineService;
import com.kh.mhm.timeLine.model.vo.PreTimeLine;

@Controller
public class WebSocketChattingController {

	@Autowired
	TimeLineService tls;

	@RequestMapping(value = "/echo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String chattingMethod(String userName, Model model, HttpServletRequest req, HttpSession session) throws Exception {
		req.setCharacterEncoding("UTF-8");

		if((Member) session.getAttribute("member")==null||((Member) session.getAttribute("member")).getMnick()=="") {
			model.addAttribute("msg", "회원가입을 하시면 타임라인을 이용하실 수 있습니다."); 
			model.addAttribute("url", "/"); 
			return "common/redirect";
		}else {
			session.setAttribute("userName", ((Member) session.getAttribute("member")).getMnick());

			String ipAddr = req.getRemoteAddr();
			model.addAttribute("host", ipAddr);
			List<PreTimeLine> list = new ArrayList<PreTimeLine>();
			list = tls.selectPreTimeLine();
			session.setAttribute("list", list);

			return "timeLine/echoView";
			
		}
		
	}

	
	@RequestMapping(value="/load.more", method=RequestMethod.POST)
	@ResponseBody
	public List<PreTimeLine> loadMoreLine(int tId) {
		List<PreTimeLine> list=tls.loadMoreLine(Integer.valueOf(tId));
		return list;
	}
	
	@RequestMapping(value="/block.timeline", method=RequestMethod.POST)
	@ResponseBody
	public int blockTimeLine(String tId,String mNick) {
		return tls.blockTimeLine(Integer.valueOf(tId),mNick);
	}
	
	@RequestMapping("letus/see.timeline")
	@ResponseBody
	public List<PreTimeLine> mainTimeLine() {
		List<PreTimeLine> list=tls.mainTimeLine();
		return list;
	}
	
	@RequestMapping("/timeline.search")
	public String searchTimeLine(Model model,HttpServletRequest req) throws UnsupportedEncodingException {
		String text=URLDecoder.decode(req.getQueryString(), "UTF-8");
		System.out.println(text);
		List<PreTimeLine> list=tls.searchTimeLine(text);
		model.addAttribute("list",list);
		return "timeLine/searchList";
	}
	
	@RequestMapping("/timeline.classify")
	@ResponseBody
	public List<PreTimeLine> classifyTimeLine(String tType){
		if(tType.length()>1) {
			List<PreTimeLine> list = tls.selectPreTimeLine();
			return list;
		}else {
			List<PreTimeLine> list=tls.classifyTimeLine(tType);
			return list;
		}
		
	}
	
	@RequestMapping("/load.classify")
	@ResponseBody
	public List<PreTimeLine> loadMoreClassify(int tId,String tType){
		if(tType.length()>1) {
			List<PreTimeLine> list=tls.loadMoreLine(Integer.valueOf(tId));
			return list;
		}else {
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("tId", tId);
			map.put("tType", tType);
			List<PreTimeLine> list=tls.loadMoreClassify(map);
			return list;
		}
		
	}
}
