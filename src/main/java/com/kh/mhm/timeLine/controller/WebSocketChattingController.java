package com.kh.mhm.timeLine.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebSocketChattingController {
	
	@RequestMapping(value="/echo.do", method=RequestMethod.POST)
	public String chattingMethod(String userName, Model model, HttpServletRequest req, HttpSession session) throws Exception {
		req.setCharacterEncoding("UTF-8");
		session.setAttribute("userName", userName);
		String ipAddr=req.getRemoteAddr();
		model.addAttribute("host", ipAddr);
		
		return "timeLine/echoView";
	}
	
	@RequestMapping("/testLink.do")
	public String testLink() {
		return "timeLine/testLink";
	}
}
