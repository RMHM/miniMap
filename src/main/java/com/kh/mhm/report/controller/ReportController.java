package com.kh.mhm.report.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.kh.mhm.member.model.service.MemberService;
import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.report.model.service.ReportService;
import com.kh.mhm.report.model.vo.Report;

@SessionAttributes(value = { "member" })
@Controller
public class ReportController {
	@Autowired
	private ReportService rs;
	@Autowired
	private MemberService ms;

	@RequestMapping(value = "/report/insertReport.do")
	@ResponseBody
	public Map<String, Object> insertReport(@RequestParam Map<String,Object> re,  Member member,Model model){

		Gson gson = new Gson();
		Report report = gson.fromJson(re.toString(),Report.class);
		Map<String, Object> map = null;
		String msg = null;
		Member m = null;
		
    try {
			map = new HashMap<String, Object>();
			System.out.println(report);
			msg="이미 신고하셨습니다.";
			if(report.getTarget_type() == 'M') {
				m = ms.selectOne(report.getTarget_id());
				if(m.getMtype().equals("A")) msg = "관리자는 신고할 수 없습니다.";
			}
			
			if(report.getTarget_type() != 'M' || !m.getMtype().equals("A")) {
				System.out.println("확인하기");
				int result = rs.insertReport(report);
				if(result != 0) msg="신고 접수가 완료되었습니다";
			}
		} catch(Exception e) {
			e.getStackTrace();
		}
    
		map.put("msg",msg);
		return map;
	}
}
