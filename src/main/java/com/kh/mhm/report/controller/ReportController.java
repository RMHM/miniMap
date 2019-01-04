package com.kh.mhm.report.controller;

import java.io.IOException;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.myPage.model.vo.Schedule;
import com.kh.mhm.report.model.service.ReportService;
import com.kh.mhm.report.model.vo.Report;

@SessionAttributes(value = { "member" })
@Controller
public class ReportController {
	@Autowired
	private ReportService rs;
	
	@RequestMapping("/report/insertReport.do")
	public String insertReport(Member member){
		
		Report report = new Report();
		
		int result = rs.insertReport(report);
		return "";
	}
}
