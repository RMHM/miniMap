package com.kh.mhm.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
	
	@RequestMapping("/popUp.do")
	public String popUpMessage() {
		return "message/message";
	}
	
}
