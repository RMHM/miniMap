package com.kh.mhm.board.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.mhm.board.model.service.BoardService;
import com.kh.mhm.board.model.vo.Board;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	@RequestMapping("/board/boardlist1.do")
	public String freeboard(@ModelAttribute("board") Board board, Model model) {
		
		List<Board> list = boardService.selectBoardList(board);	
		List<Board> list2 = boardService.selectNoticeList(board);	
		
        model.addAttribute("list", list);
		model.addAttribute("list2", list2);

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
	public String boardview(@RequestParam int bId, Model model) {
		
		model.addAttribute("b", boardService.selectOneBoard(bId));		
		System.out.println(bId);
		System.out.println(model);
		/*model.addAttribute("b", boardService.updateOneCount(bId));*/
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
