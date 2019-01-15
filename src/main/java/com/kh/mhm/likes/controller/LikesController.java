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
	@Autowired
	private BoardService bs;
	
	@RequestMapping(value ="/likes/insertLikes.do")
	@ResponseBody
	public Map<String, Object> likesinsert(@RequestParam Map<String,Object> li, HttpSession session, HttpServletRequest req, Model model) {
		Gson gson = new Gson();
		Likes likes = gson.fromJson(li.toString(), Likes.class);
		int result = ls.insertLikes(likes);
		String msg = "";
		
		if(result ==0) {
			msg="이미 추천하셨습니다.";
		}else {
			bs.updateLikes(likes.getTarget_bid());
			msg="게시물을 추천하였습니다";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg",msg);
		return map;		

		
	}
	

}
