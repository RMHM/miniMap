package com.kh.mhm.coment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.mhm.coment.model.service.ComentService;
import com.kh.mhm.coment.model.vo.Coment;

@Controller
public class ComentController {
	
	@Autowired
	private ComentService cs;
	
	@RequestMapping("/coment/comentList.do")
	public List<Coment> selectComentList(@RequestParam int bid){
		List<Coment> result = null;
		try {
			result = cs.selectCometList(bid);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	@RequestMapping("/coment/comentAdd.do")
	public String insertComentContent(Coment coment) {
		try {
			cs.insertComentContent(coment);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	@RequestMapping("/coment/comentReport.do")
	public String insertComentReport(@RequestParam int cid) {
		try {
			cs.insertComentReport(cid);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	@RequestMapping("/coment/comentDelete.do")
	public String deleteComent(@RequestParam int cid, Model model) {
		/*try {
			cs.deleteComent(cid);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;*/
		int result = cs.deleteComent(cid);
		
		String loc = "/board/boardlist1.do";
		String msg = "";
		
		if(result > 0) {
			msg = "댓글 삭제 성공!";
			
		} else {
			msg = "댓글 삭제 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/coment/comentUpdate.do")
	public String updateComent(Coment coment) {
		try {
			cs.updateComent(coment);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
}
