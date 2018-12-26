package com.kh.mhm.coment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping("/commnet/comentAdd.do")
	public String insertComentContent(Coment coment) {
		try {
			cs.insertComentContent(coment);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	@RequestMapping("/commnet/comentReport.do")
	public String insertComentReport(@RequestParam int cid) {
		try {
			cs.insertComentReport(cid);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	@RequestMapping("/coment/comentDelete.do")
	public String deleteComent(@RequestParam int cid) {
		try {
			cs.deleteComent(cid);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
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
