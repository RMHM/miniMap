package com.kh.mhm.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mhm.manager.model.service.ManagerService;

@Controller
public class ManagerController {
	
	@Autowired
	private ManagerService mns;
	
	@RequestMapping("/manager/visitCount.do")
	@ResponseBody
	public List<Integer> selectCount() {
		// All Day Avg
		List<Integer> result = mns.selectCount();
		return result;
	}
	
}
