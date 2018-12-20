package com.kh.mhm.board.controller;

import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/board/boardmain.do")
	public String board() {
		return "board/boardtest";
	}
	
	@RequestMapping("/board/boardwrite.do")
	public String boardwrite() {
		return "board/boardwrite";
	}
	@RequestMapping("/submit")
	public void submit(HttpServletRequest request){			
	    System.out.println("에디터 컨텐츠값:"+ request.getParameterMap());
	}


	
}
