package com.kh.mhm.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("/member/loginPage.go")
	public String loginGo() {
		return "member/loginPage";
	}
	
}
