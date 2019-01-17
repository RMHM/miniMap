package com.kh.mhm.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("/test/testMap.do")
	public String map() {
	//	return "test/NewFile";
		return "test/testMap";
	}
	@RequestMapping("/test/NewFile.do")
	public String NewFile() {
		//	return "test/NewFile";
		return "test/testMap2";
	}

	
	
}
