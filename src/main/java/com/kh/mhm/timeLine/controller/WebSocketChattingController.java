package com.kh.mhm.timeLine.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.timeLine.model.service.TimeLineService;
import com.kh.mhm.timeLine.model.vo.PreTimeLine;

@Controller
public class WebSocketChattingController {

	@Autowired
	TimeLineService tlsi;

	@RequestMapping(value="/echo.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String chattingMethod(String userName, Model model, HttpServletRequest req, HttpSession session) throws Exception {
		req.setCharacterEncoding("UTF-8");

		/*Member member=(Member) session.getAttribute("member");
		System.out.println(member.toString());
		System.out.println(member.getMnick());*/

		session.setAttribute("userName", ((Member) session.getAttribute("member")).getMnick());

		String ipAddr=req.getRemoteAddr();
		model.addAttribute("host", ipAddr);
    List<PreTimeLine> list=new ArrayList<PreTimeLine>();
		list=tlsi.selectPreTimeLine();
		session.setAttribute("list", list);

		return "timeLine/echoView";
	}

	/*@RequestMapping("/testLink.do")
	public String testLink() {
		return "timeLine/testLink";
	}*/
}
