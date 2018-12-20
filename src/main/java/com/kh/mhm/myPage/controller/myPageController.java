package com.kh.mhm.myPage.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import java.sql.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mhm.myPage.model.service.MyPageService;
import com.kh.mhm.myPage.model.vo.Schedule;

@Controller
public class myPageController {
	@Autowired
	private MyPageService ms;
	@RequestMapping("/myPage/myPageMain.do")
	public String myPageMain() {
		
		return "myPage/schedule";
		/*return "myPage/myPageMain";*/
	}
	
	@RequestMapping("/myPage/insertSchedule.do")
	public String insertSchedule(@RequestParam String startDateT, @RequestParam String endDateT,Schedule schedule,Model model) {
		java.util.Date utilDate = new java.util.Date();
		 /*Date sqlDate = new Date(utilDate.getTime());*/
		 System.out.println("파람 :" +startDateT);
		 /*System.out.println(sqlDate);*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		System.out.println();

		try {
			/*java.util.Date start =;*/
			java.util.Date end =  sdf.parse(endDateT);
			
			schedule.setStart_Date((Date) sdf.parse(startDateT));
			schedule.setEnd_Date(new Date(end.getTime()));
		/*	System.out.println("start : " +start);*/
		} catch (ParseException e) {
			e.printStackTrace();
		}
		schedule.setMNo(10);
		System.out.println(schedule);
		int result = ms.insertSchedule(schedule);
		return "myPage/schedule";
	}
	
	@RequestMapping("/myPage/selectSchedult.do")
	@ResponseBody
	public Map<String, Object> selectSchedule(@RequestParam int mNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		/*System.out.println(ms.selectSchedule());*/
		
	/*
		List m =ms.selectSchedule();
*/
		
		map.put("list", ms.selectSchedule());
		
		/*System.out.println(map);*/
	/*	ArrayList<Schedule> as = new ArrayList<Schedule>();
		
		System.out.println(ms.selectSchedule(mNo));
		Map<String, Object> map = new HashMap<String, Object>();
		as = (ArrayList<Schedule>) ms.selectSchedule(mNo);
		*/
		
		/*List<Map<String, String>>  schedule =ms.selectSchedule(mNo);
		System.out.println("list"+schedule);*/
		/*System.out.println(schedule);*/
	/*	map.put("list",ms.selectSchedule(mNo));
		System.out.println(map);*/
		/*
		
		System.out.println("1"+ schedule);
		schedule = ms.selectSchedule(mNo);
		System.out.println("사이즈"+schedule.size());
		Map map=new HashMap();
		for(int i=0; i<schedule.size();i++) {
			
			System.out.println(i+":"+schedule.get(i));
		}
		map.put("slist", schedule);
		mv.addObject(map);
		mv.setViewName("list");
		
		System.out.println(mv);
		*/
		return map;
	}
	
	
}
