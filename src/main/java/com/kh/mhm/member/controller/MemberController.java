package com.kh.mhm.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

	private String loc = "/";
	private String msg = "";

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

		Member m = ms.selectOne(mid);

		if (m == null) {
			msg = "회원정보가 존재하지 않습니다.";
			loc = "/member/loginPage.go";
		} else {
			if (bcpe.matches(mpw, m.getMpw())) {
				msg = "로그인되었습니다!";
				// @SessionAttributes annotation 사용
				mv.addObject("member", m);
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
				loc = "/member/loginPage.go";
			}
		}

		mv.addObject("loc", loc).addObject("msg", msg);
		mv.setViewName("/common/msg");

		return mv;
	}

  @RequestMapping(value="/member/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus, Model model) {
		if(!sessionStatus.isComplete()) sessionStatus.setComplete();
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
					chkCode += (char) ((int) (Math.random() * 93 + 34));
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
	public String memberEnrollEnd(Member m, Model model) {

		System.out.println(m);
		// ** 이미지 경로 DEFAULT로 안들어가게 지정 **
    if(m.getProfilePath() == null || m.getProfilePath().trim() == "") m.setProfilePath("default.png");

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

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		

		return "common/msg";
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

	@RequestMapping("/member/selectCommonMember.do")
	@ResponseBody
	public List<Member> selectCommonMember() {

		List<Member> mlist = ms.selectCommonMember();
		System.out.println("mlist : " + mlist);

		return mlist;
	}

	@RequestMapping("/member/selectCompanyMember.do")
	@ResponseBody
  public List<Member> selectCompanyMember() {
    
		List<Member> clist = ms.selectCompanyMember();

		System.out.println("clist : " + clist);
		return clist;
	}

	@RequestMapping("/member/insertFile.do")
	public void insertFile() {

	}

  /*@RequestMapping("/member/insertFileEnd.do")
	public String insertMember(Member member, Model model, HttpSession session,
			@RequestParam(value="upFile", required = false) MultipartFile[] upFile) {
		// 저장 경로 생성
		String sfile = session.getServletContext().getRealPath("/resources/img/profiles");
		List<Member> List = new ArrayList<Member>();

		// 폴더 유무 확인 후 생성
		File file = new File(sfile);

		System.out.println("폴더가 있니? " + file.exists());

    if(file.exists() == false) file.mkdirs();

		// 업로드
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				// 원본 이름 가져오기
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".")+1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

				int rNum = (int) (Math.random() * 1000);

				// 서버에서 저장 후 관리할 파일 명
				String renamedName = sdf.format(new Date()) + "_" + rNum + "." + ext;

				// 
			}
		}
	}*/

} 