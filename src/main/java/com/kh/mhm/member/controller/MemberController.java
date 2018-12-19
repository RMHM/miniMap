package com.kh.mhm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mhm.member.model.service.MemberService;
import com.kh.mhm.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcpe;
	
	@Autowired
	private MemberService ms;
	
	private String loc = "/";
	private String msg = "";
	
	@RequestMapping("/member/loginPage.go")
	public String loginGo() {
		return "member/loginPage";
	}
  @RequestMapping(value="/member/memberLogin.do", method = RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam String mid, @RequestParam String mpw, Model model) {
		ModelAndView mv = new ModelAndView();

		 Member m = ms.selectOne(mid);

		if(m == null) {
			msg = "회원정보가 존재하지 않습니다.";
			loc = "/member/loginPage.go";
		} else {
			if(bcpe.matches(mpw, m.getMpw())) {
				msg = "로그인되었습니다!";
				mv.addObject("member", m);
			} else msg = "비밀번호가 일치하지 않습니다.";
		}
		
		mv.addObject("loc", loc).addObject("msg", msg);
		mv.setViewName("/common/msg");
		
		return mv;
	}
  
  @RequestMapping("/member/memberEnroll.go")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
  
  @RequestMapping("/member/memberEnrollEnd.go")
  public String memberEnrollEnd(Member member, Model model) {
	  
	  // 기존 비밀번호
	  String rawPassword = member.getMpw();
	  System.out.println("비밀번호 암호화 전 : " +rawPassword);
	  
	  // 암호화 코드
	  member.setMpw(bcryptPasswordEncoder.encode(rawPassword));
	  
	  System.out.println("비밀번호 암호화 후 : " +member.getMpw());
	  
	  int result = memberService.insertMember(member);
	  
	  String loc = "/";
	  String msg = "";
	  
	  if(result > 0) msg = "회원 가입이 정상적으로 되었습니다.";
	  else msg = "회원 가입이 실패 하였습니다.";
	  
	  model.addAttribute("loc", loc);
	  model.addAttribute("msg", msg);
	  
	  return "common/msg";
  }
}
