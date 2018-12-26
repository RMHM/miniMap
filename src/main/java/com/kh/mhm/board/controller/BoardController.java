package com.kh.mhm.board.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.mhm.board.model.service.BoardService;
import com.kh.mhm.board.model.vo.Board;


@SessionAttributes(value = { "member" })
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
		
		System.out.println(list);

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
	
	@RequestMapping("board/boardinsert.do")
	public String boardinsert(Board board, Model model, HttpSession session, HttpServletRequest req) {
		int result;
		
		System.out.println(session.getAttribute("member"));
		
		board.setBContent(req.getParameter("boardcontent"));
		result = boardService.insertBoard(board);
		System.out.println(board);
		String loc = "/board/boardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 등록 성공!";
			loc = "/board/boardview.do?BId="+board.getBId();
			
		} else {
			msg = "게시글 등록 실패!";
		}
		
		model.addAttribute("loc", loc)
		.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	

	@RequestMapping("/board/boardview.do")
	public String boardview(@RequestParam int BId, Model model) {
		
		model.addAttribute("b", boardService.selectOneBoard(BId));		
		System.out.println(BId);
		System.out.println(model);
		/*model.addAttribute("b", boardService.updateOneCount(BId));*/
		return "board/boardview";
	}

	/*@RequestMapping(value="/board/boardview2.do", method=RequestMethod.POST)
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
		
	}*/
	
	@RequestMapping("/board/boardUpdateView.do")
	public void boardUpdateView(@RequestParam("BId") int BId, Model model) {
		
		model.addAttribute("board", boardService.selectOneBoard(BId));
		System.out.println(boardService.selectOneBoard(BId));		
		
	}
	
	@RequestMapping("/board/boardUpdate.do")
	public String boardUpdate(Board board, HttpSession session, Model model, HttpServletRequest req) {
		
		int BId = board.getBId();
		board.setBContent(req.getParameter("boardcontent"));
		
		Board originBoard = boardService.selectOneBoard(BId);
		originBoard.setBTitle(board.getBTitle());		
		originBoard.setBContent(board.getBContent());
		
		int result = boardService.updateBoard(board);
		
		String loc = "/board/boardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 수정 성공!";
			loc = "/board/boardview.do?BId="+board.getBId();
			
		} else {
			msg = "게시글 수정 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
	
	@RequestMapping("/board/boardDelete.do")
	public String boardDelete(@RequestParam("BId") int BId, HttpSession session, Model model) {
		
		int result = boardService.deleteBoard(BId);
		
		String loc = "/board/boardlist1.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 삭제 성공!";
			
		} else {
			msg = "게시글 삭제 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
}
