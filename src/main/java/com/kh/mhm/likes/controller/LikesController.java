package com.kh.mhm.likes.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mhm.board.controller.BoardController;
import com.kh.mhm.board.model.service.BoardService;
import com.kh.mhm.board.model.vo.Board;
import com.kh.mhm.likes.model.service.LikesService;
import com.kh.mhm.likes.model.vo.Likes;
import com.kh.mhm.member.model.vo.Member;

@SessionAttributes(value = { "member" })
@Controller
public class LikesController {
	@Autowired
	private LikesService ls;
	
	@RequestMapping(value ="/likes/insertLikes.do")
	public ModelAndView likesinsert(Board board, Likes likes, Model model, HttpSession session, HttpServletRequest req) {
		System.out.println(likes);
		ModelAndView mv = new ModelAndView();
		Member m = (Member) session.getAttribute("member");
		
		ls.insertLikes(likes);
		System.out.println(likes);
		
		mv.addObject("loc", "/board/boardview.do?BId=" + board.getBId());
		mv.setViewName("common/msg");

		return mv;
	}
	

}
