package com.kh.mhm.member.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mhm.common.SendMail;
import com.kh.mhm.member.model.service.MemberService;
import com.kh.mhm.member.model.vo.Member;

@SessionAttributes(value = { "member" })
@Controller
public class MemberController {

	@Autowired
	private BCryptPasswordEncoder bcpe;

	@Autowired
	private MemberService ms;
	
	@RequestMapping("/member/loginPage.go")
	public String loginGo() {
		return "member/loginPage";
	}

	@RequestMapping("/member/infoFindPage.go")
	public String infoFindGo() {
		return "member/infoFindPage";
	}

	@RequestMapping(value = "/member/memberLogin.do", method = RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam String mid, @RequestParam String mpw, Model model) {
		ModelAndView mv = new ModelAndView();

		Member m = ms.selectLogin(mid);
		System.out.println(m);
		String loc = "/";
		String msg = "";
		
		if (m == null) {
			msg = "회원정보가 존재하지 않습니다.";
			loc = "/member/loginPage.go";
		} else {
			if (bcpe.matches(mpw, m.getMpw())) {
				// @SessionAttributes annotation 사용
				java.util.Date endDate = ms.selectNowBlack(m.getMno());
				java.util.Date today = new java.util.Date();
				
				Pattern p = Pattern.compile("^[0-9]*$");
				Matcher ma = p.matcher(mpw);
				
				if(endDate != null && today.compareTo(endDate)>=0) {
					msg = "회원님은 " + new SimpleDateFormat("yyyy년 MM월 dd일").format(endDate) + "까지 사용이 불가능합니다.";
				} else {
					if(ma.find()) {
						msg = "임시 비밀번호로 로그인하셨습니다. 회원정보 수정으로 이동합니다.";
						loc = "/myPage/myPageMain.do";
					} else msg = "로그인되었습니다!";
					mv.addObject("member", m);
				}
				
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
				loc = "/member/loginPage.go";
			}
		}
		
		System.out.println(m);
		mv.addObject("loc", loc).addObject("msg", msg);
		mv.setViewName("/common/msg");
		return mv;
	}

	@RequestMapping(value = "/member/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus, Model model) {
		if (!sessionStatus.isComplete()) sessionStatus.setComplete();
		
		String loc = "/";
		String msg = "";
		
		msg = "로그아웃 되었습니다.";
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}

	@RequestMapping("/member/memberFindID.do")
	@ResponseBody
	public String memberFindID(@RequestParam String mname, @RequestParam String email) {
		String result = "";
		Member m = ms.selectFindID(email);
		if (m != null) {
			if (mname.equals(m.getMname()))
				result = m.getMid();
		}
		return result;
	}

	@RequestMapping("/member/memberFindPW.do")
	@ResponseBody
	public boolean memberFindPW(@RequestParam String mid, @RequestParam String mname, @RequestParam String email,
			HttpSession session) {
		boolean result = false;

		Member m = ms.selectOne(mid);

		if (m != null) {
			if (mname.equals(m.getMname()) && email.equals(m.getEmail())) {
				session.setAttribute("mid", mid);
				session.setAttribute("mname", mname);
				session.setAttribute("email", email);
				// 난수 생성
				String chkCode = "";
				for (int i = 0; i < 6; i++) {
					chkCode += String.valueOf((int)(Math.random()*10));
				}
				session.setAttribute("code", chkCode);
				// 인증번호 전송하기
				String getTitle = "miniMap 회원정보 인증코드 입니다.";
				String getContent = "입력하신 아이디 " + mid + "에 대한 인증코드입니다.\n인증번호는 " + chkCode + " 입니다.";
				new SendMail().sendMail(email, getTitle, getContent);

				result = true;
			}
		}
		return result;
	}

	@RequestMapping("/member/sessionChk.do")
	@ResponseBody
	public Map<String, Object> memberSessionValueChk(@RequestParam String mid, @RequestParam String mname,
			@RequestParam String email, @RequestParam String code, HttpSession session) {

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("isErr", false);

		if (!mid.equals((String) session.getAttribute("mid")))
			result.put("err", "아이디가");
		else if (!mname.equals((String) session.getAttribute("mname")))
			result.put("err", "이름이");
		else if (!email.equals((String) session.getAttribute("email")))
			result.put("err", "이메일이");
		else if (!code.equals((String) session.getAttribute("code")))
			result.put("err", "인증번호가");
		else {

			result.remove("isErr");
			result.put("isErr", true);
			// 비밀번호 재설정
			String newPW = "";
			for (int i = 0; i < 10; i++) {
				newPW += String.valueOf(((int) (Math.random() * 10 + 1)));
			}
			Member m = ms.selectOne(mid);
			m.setMpw(bcpe.encode(newPW));
			ms.updateMemberPW(m);

			// 임시번호 발송
			String getTitle = "miniMap 임시비밀번호 입니다.";
			String getContent = "아이디 " + mid + "에 대해 임시비밀번호로 재설정 하였습니다.\n빠른 시일내에 비밀번호를 변경하는 것을 권장드립니다.\n임시비밀번호는 "
					+ newPW + " 입니다.";

			new SendMail().sendMail(email, getTitle, getContent);

			// 기존 세션에 저장된 정보 제거
			session.invalidate();
		}

		return result;
	}

	@RequestMapping("/member/memberEnroll.go")
	public String memberEnroll() {
		return "member/memberEnroll";
	}

	@RequestMapping("/member/memberEnrollEnd.do")
	public ModelAndView memberEnrollEnd(@RequestParam(value="profile", required = false)
				MultipartFile profile, HttpSession session, HttpServletRequest request, Member m, Model model,
				@RequestParam(value = "path", required = false, defaultValue = "") String path) {
		
		String saveDir = session.getServletContext().getRealPath("/resources/img/profiles");
		File dir = new File(saveDir);
		
		ModelAndView mv = new ModelAndView();
		
		if(dir.exists() == false) dir.mkdirs();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		int rndNum = (int) (Math.random() * 1000);
		
		
		if(profile != null) {
			String originName = profile.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf(".")+1);
			
			if (originName == null || originName.trim().equals("")) {
				m.setProfilePath("default.png");
				
				for (int i = 1; i <= 10; i++) {
					m.setProfilePath("default.png");
				}
				
			} else {
				String renamedName = sdf.format(new java.util.Date()) + "_" + rndNum + "." + ext;
				try {
					profile.transferTo(new File(saveDir + "/" + renamedName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}	
				
				m.setProfilePath(renamedName);
			}
		} else if(path != null || !path.trim().equals("")) {
			String ext = path.substring(path.lastIndexOf(".")+1);
			String renamedName = sdf.format(new java.util.Date()) + "_" + rndNum + "." + ext;
			System.out.printf("path : %s\n", path);
			
			try {
				FileUtils.copyURLToFile(new URL(path), new File(saveDir + "/" + renamedName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.addObject("parent", "/");
			m.setProfilePath(renamedName);
		}
		
		// m.setMpw(bcpe.encode(m.getMpw()));
		
		String loc = "/";
		String msg = "";
		
		System.out.println(m);
		// ** 이미지 경로 DEFAULT로 안들어가게 지정 **
		if (m.getProfilePath() == null || m.getProfilePath().trim() == "")
			m.setProfilePath("default.png");

		// ** 암호화 **
		// 기존 비밀번호
		String shapw = m.getMpw();
		System.out.println("암호화 전  : " + shapw);

		// 코드
		m.setMpw(bcpe.encode(shapw));
		System.out.println("암호화 후 : " + m.getMpw());

		int result = ms.insertMember(m);

		System.out.println(m);

		if (result > 0)
			msg = "회원 가입에 성공하였습니다.";
		else
			msg = "회원 가입 실패";
		
		mv.setViewName("common/msg");
		mv.addObject("member", null); // 회원가입 후 자동로그인 세션 유지x
		mv.addObject("loc", loc);
		mv.addObject("msg", msg);
			
		return mv;
	}
  
	@RequestMapping("/member/memberView.do")
	public String memberView(@RequestParam String mid) {

		return "member/memberView";
	}

	@ResponseBody
	@RequestMapping(value = "/member/checkIdDuplicate.do")
	public Map<String, Object> checkIdDuplicate(@RequestParam String mid) {

		Map<String, Object> map = new HashMap<String, Object>();

		boolean isUsable = ms.checkIdDuplicate(mid) == 0 ? true : false;

		map.put("isUsable", isUsable);	

		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "member/checkPw.do")
	public Map<String, Object> checkPw(@RequestParam String mpw) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = ms.checkPw(mpw) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
				
		return map;
	}
			
	@ResponseBody
	@RequestMapping(value = "/member/checkNick.do")
	public Map<String, Object> checkNick(@RequestParam String mnick) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = ms.checkNick(mnick) == 0 ? true : false; 
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/checkEmail.do")
	public Map<String, Object> checkEmail(@RequestParam String email){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = ms.checkEmail(email) == 0 ? true : false; 
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
  /*@RequestMapping(value = "/member/googleLogin", method = RequestMethod.POST)
	public Object googleLogin(@RequestParam String name, @RequestParam String img, @RequestParam String email) {
		ModelAndView mv = new ModelAndView();
		Member m = null;
		Object result = null;
		
		try {
			if(ms.selectCheckLogin(email) != 0) {
				mv.addObject("msg", "해당 이메일은 이미 가입되어있습니다.").addObject("loc", "/member/loginPage.go");
				mv.setViewName("common/msg");
			} else {
				m = ms.selectLogin(email);
				
				if(m!=null) {
					mv.addObject("msg", "로그인 되었습니다.").addObject("loc", "/").addObject("member", m);
					mv.setViewName("common/msg");
				} else {
					mv.addObject("gEmail", email).addObject("gName", name).addObject("gImg", img);
					Member signup = new Member();
					signup.setMid(email);
					signup.setMpw("임시");
					signup.setMname(name);
					signup.setMnick("임시");
					signup.setMtype("M");
					signup.setEmail(email);
					signup.setGender("M");
					signup.setAge(10);
					signup.setProfilePath("");
					mv.setViewName("member/googleSignUp");
				}
			}
			result = mv;
		} catch(Exception e) {
			e.getStackTrace();
		}
  
  
		return result;
	}*/
	
	
}