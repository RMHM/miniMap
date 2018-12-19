package com.kh.mhm.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mhm.member.model.vo.Member;

@Controller
public class MemberController {
	
	/*@Autowired
	private BCryptPasswordEncoder bcpe;*/
	
	private String loc = "/";
	private String msg = "";
	
	@RequestMapping("/member/loginPage.go")
	public String loginGo() {
		return "member/loginPage";
	}
  @RequestMapping(value="/member/memberLogin.do", method = RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam String mid, @RequestParam String mpw, Model model) {
		ModelAndView mv = new ModelAndView();

		// Member m = ms.selectOne(uid);
		Member m = null;

		if(m == null) {
			msg = "회원정보가 존재하지 않습니다.";
			loc = "/member/loginPage.go";
		} else {
			/*if(bcpe.matches(mpw, m.getMpw())) {
				msg = "로그인되었습니다!";
				mv.addObject("member", m);
			} else msg = "비밀번호가 일치하지 않습니다.";*/
		}
		
		mv.addObject("loc", loc).addObject("msg", msg);
		mv.setViewName("/common/msg");
		
		return mv;
	}
  
  @RequestMapping("/member/memberEnroll.go")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
}
