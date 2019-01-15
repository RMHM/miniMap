package com.kh.mhm.coment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String insertComentContent(Coment coment, Model model, HttpSession session, HttpServletRequest req,
				@RequestParam(value = "bCode", required = false, defaultValue = "1") int bCode) {
		
		int result;
		
		System.out.println(session.getAttribute("member"));
		
		coment.setBid(Integer.parseInt(req.getParameter("BId")));
		coment.setCcontent(req.getParameter("cContent").replace("\r\n","<br>"));		
		System.out.println(coment);
		System.out.println(req.getParameter("cContent"));
				
		
		result = cs.insertComentContent(coment);
		System.out.println(result);
		
		String loc = "/board/boardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "댓글 등록 성공!";
			if(bCode==5) loc = "/board/adBoardView.do?bid="+req.getParameter("BId");
			else loc = "/board/boardview.do?BId="+req.getParameter("BId");
			
		} else {
			msg = "댓글 등록 실패!";
		}
		
		model.addAttribute("loc", loc)
		.addAttribute("msg", msg);
		
		return "common/msg";
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
	public String deleteComent(Coment coment, HttpSession session, Model model, HttpServletRequest req,
			@RequestParam(value = "bCode", required = false, defaultValue = "1") int bCode) {
		
		System.out.println("delete");
		System.out.println(coment);
		int cid = coment.getCid();
		Coment originComent = cs.selectOneComent(cid);
		
		System.out.println(originComent);
		
		int result = cs.deleteComent(cid);
		
		String loc = "/board/boardlist1.do";
		String msg = "";
		
		if(result > 0) {
			msg = "댓글 삭제 성공!";
			if(bCode == 5) loc = "/board/adBoardView.do?bid="+originComent.getBid();
			else loc = "/board/boardview.do?BId="+originComent.getBid();
			
		} else {
			msg = "댓글 삭제 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/coment/comentUpdate.do")
	public String updateComent(Coment coment, HttpSession session, Model model, HttpServletRequest req,
			@RequestParam(value = "bCode", required = false, defaultValue = "1") int bCode) {
		
		int cid = coment.getCid();
		System.out.println("update");
/*		coment.setCcontent(session.getAttribute("replycontent"));
		System.out.println(session.getAttribute("replycontent"));*/
		
		System.out.println(coment);
		
		
		Coment originComent = cs.selectOneComent(cid);
		System.out.println(originComent);
		System.out.println(coment.getCcontent());
		originComent.setCcontent(coment.getCcontent());
		
		int result = cs.updateComent(coment);
		
		String loc = "/board/boardlist1.do";
		String msg = "";
		
		if(result > 0) {
			msg = "댓글 수정 성공!";
			if(bCode == 5) loc = "/board/adBoardView.do?bid="+coment.getBid();
			else loc = "/board/boardview.do?BId="+coment.getBid();
			
		} else {
			msg = "댓글 수정 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
	@RequestMapping("/coment/comentAdd2.do")
	public String insertComentContent2(Coment coment, Model model, HttpSession session, HttpServletRequest req,
			@RequestParam(value = "bCode", required = false, defaultValue = "1") int bCode) {
		
		int result;
		
		System.out.println(session.getAttribute("member"));
		coment.setBid(Integer.parseInt(req.getParameter("BId")));		
		coment.setCcontent(coment.getCcontent().replace("\r\n","<br>"));	
		
		
		result = cs.insertComentContent2(coment);
		System.out.println(result);
		
		String loc = "/board/boardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "대댓글 등록 성공!";
			if(bCode==5) loc = "/board/adBoardView.do?bid="+req.getParameter("BId");
			else loc = "/board/boardview.do?BId="+req.getParameter("BId");
			
			
		} else {
			msg = "댓글 등록 실패!";
		}
		
		model.addAttribute("loc", loc)
		.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
}
