package com.kh.mhm.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myPageController {
	@RequestMapping("/myPage/myPageMain.do")
	public String myPageMain() {
		
		return "myPage/schedule";
		/*return "myPage/myPageMain";*/
	}
}
