package com.kh.mhm.report.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.kh.mhm.board.controller.BoardController;
import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.myPage.model.vo.Schedule;
import com.kh.mhm.report.model.service.ReportService;
import com.kh.mhm.report.model.vo.Report;

@SessionAttributes(value = { "member" })
@Controller
public class ReportController {
	@Autowired
	private ReportService rs;
	@Autowired
	private BoardController bc;
	
	@RequestMapping(value = "/report/insertReport.do")
	@ResponseBody
  public Map<String, Object> insertReport(@RequestParam Map<String,Object> re,  Member member,Model model){
	
		Gson gson = new Gson();
		Report report = gson.fromJson(re.toString(),Report.class);
    System.out.println(report);
		int result = rs.insertReport(report);
		String msg = "";
		
    if(result ==0)msg="이미 신고하셨습니다.";
		else msg="신고 접수가 완료되었습니다";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg",msg);
		return map;
	}
}
