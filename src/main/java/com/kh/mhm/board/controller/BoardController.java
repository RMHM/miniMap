package com.kh.mhm.board.controller;

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
	
}
