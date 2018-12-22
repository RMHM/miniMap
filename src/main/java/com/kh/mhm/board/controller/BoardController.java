package com.kh.mhm.board.controller;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	@RequestMapping("/board/boardlist1.do")
	public String freeboard() {
		return "board/freeBoardList";
	}
	@RequestMapping("/board/boardlist2.do")
	public String infoboard() {
		return "board/infoBoardList";
	}
	@RequestMapping("/board/boardlist3.do")
	public String reviewboard() {
		return "board/reviewBoardList";
	}
	@RequestMapping("/board/boardlist4.do")
	public String qaboard() {
		return "board/qaBoardList";
	}	
	@RequestMapping("/board/boardwrite.do")
	public String boardwrite() {
		return "/board/boardwrite";
	}	

	@RequestMapping("/board/boardview.do")
	public String boardview() {
		return "board/boardview";
	}

	@RequestMapping(value="/board/boardview2.do", method=RequestMethod.POST)
	public String testEditorResult(HttpServletRequest req, Model model) {
		String result = req.getParameter("boardcontent");
		System.out.println(result);
		// 값 전달 확인
		Enumeration e = req.getParameterNames();
		String name = null;
		while (e.hasMoreElements()){
			name = e.nextElement().toString();
			System.out.println(name + " : " + req.getParameter(name));
		}		
		model.addAttribute("result", result);

		return "board/boardview";
	}



}
