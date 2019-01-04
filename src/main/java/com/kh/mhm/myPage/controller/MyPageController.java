package com.kh.mhm.myPage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mhm.api.AfterWeather;
import com.kh.mhm.api.Temperatures;
import com.kh.mhm.board.model.service.BoardService;
import com.kh.mhm.board.model.vo.Board;
import com.kh.mhm.common.Policy;
import com.kh.mhm.common.util.Utils;
import com.kh.mhm.member.model.service.MemberService;
import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.myPage.model.service.MyPageService;
import com.kh.mhm.myPage.model.vo.Authority;
import com.kh.mhm.myPage.model.vo.Schedule;
import com.sun.media.sound.SoftSynthesizer;

@SessionAttributes(value = { "member" })
@Controller
public class MyPageController {
	@Autowired
	private MyPageService mps;
	@Autowired
	private MemberService ms;

	@Autowired
	private BCryptPasswordEncoder bcpe;
	private String loc = "/";
	private String msg = "";

	/* 일정 추가 */
	@RequestMapping("/myPage/insertSchedule.do")
	public String insertSchedule(Member member, @RequestParam String startDateT, @RequestParam String endDateT, Schedule schedule, Model model) throws IOException {
		schedule.setStart_Date(Date.valueOf(startDateT));
		schedule.setEnd_Date(Date.valueOf(endDateT));
		schedule.setMNo(member.getMno());
		System.out.println("schedule: " + schedule);

		int result = mps.insertSchedule(schedule);
		return selectSchedule(member, model);

	}

	/* 일정 삭제 */
	@RequestMapping("/myPage/deleteSchedule.do")
  public String deleteSchedule(Member member, @RequestParam int sId, Model model) throws IOException {
		System.out.println("delete 실행");
		Schedule s = new Schedule();
		s.setSId(sId);
		System.out.println(sId);
		mps.deleteSchedule(sId);

		return selectSchedule(member, model);

	}

	/* 일정 수정 */
	@RequestMapping("/myPage/updateSchedule.do")
	public String updateSchedule(Member member, @RequestParam String startDateT, @RequestParam String endDateT, Schedule schedule, Model model) throws IOException {
		System.out.println("update실행");
		schedule.setStart_Date(Date.valueOf(startDateT));
		schedule.setEnd_Date(Date.valueOf(endDateT));
		schedule.setMNo(member.getMno());
		System.out.println(schedule);
		int result = mps.updateSchedule(schedule);
		return selectSchedule(member, model);

	}

	/* 총 일정 확인 */
	@RequestMapping("/myPage/selectSchedule.do")
	public String selectSchedule(Member member, Model model) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("insert 이후");
		model.addAttribute("list", mps.selectSchedule(member.getMno()));

		ArrayList<Schedule> as = new ArrayList<Schedule>();
		List l = mps.selectSchedule(member.getMno());

		List list = new ArrayList();

		for (int i = 0; i < l.size(); i++) {
			Map<String, Object> result = mps.selectSchedule(member.getMno()).get(i);
			Map<String, Object> arr = new HashMap<String, Object>();
			System.out.println(result);
			if (result.get("DELFLAG").equals("Y"))
				continue;
			/* if(result.get("delflag").equals("Y"))continue; */

			arr.put("sId", result.get("SID"));
			arr.put("title", result.get("STITLE"));
			arr.put("start", result.get("START_DATE").toString());
			arr.put("end", result.get("END_DATE").toString());
			arr.put("color", result.get("SCOLOR").toString());
			arr.put("content", result.get("SCONTENT"));
			list.add(arr);
		}
		AfterWeather a = new AfterWeather();
		Temperatures t = new Temperatures();
		
		java.util.Date today = new java.util.Date();
		int num = today.getMonth()+1;
		System.out.println(num);
		model.addAttribute("list", list);
    model.addAttribute("temper",t.temperature(num));
		model.addAttribute("weather",a.weather());
    
		return "myPage/schedule";
	}
	
	/*월 평균 기온*/
	@RequestMapping(value="/myPage/temper.do")
	@ResponseBody
	public ArrayList temperature(@RequestParam int num) throws IOException {
		
		Temperatures t = new Temperatures();
		System.out.println(t.temperature(num));
		return t.temperature(num);
	}
	

	/* myPagemain 경로 */
	@RequestMapping("/myPage/myPageMain.do")
	public String myPageMain() {

		/* return "myPage/schedule"; */
		return "myPage/myPageMain";
	}

	/* 비밀번호 비교후 수정페이지 이동 */
	@RequestMapping("/myPage/updateMemberView.do")
	public String updateMemberView() {
		return "myPage/updateview";
	}

	/* 회원정보 수정 하고 myPageMain 이동 */
	@RequestMapping("/myPage/updateMember.do")
	public String updateMember(@RequestParam(value="profile", required = false) MultipartFile profile,Member member, HttpSession session, HttpServletRequest request) {

	
		String saveDir = session.getServletContext().getRealPath("/resources/img/profiles");
		File dir = new File(saveDir);
		
		if(dir.exists() == false) dir.mkdirs();
		String originName = profile.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf(".")+1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		int rndNum = (int)(Math.random() * 1000);
		System.out.println("origint"+originName);
		System.out.println("ext"+ext);
		
		String renamedName = sdf.format(new java.util.Date()) + "_" + rndNum + "." + ext;
		
		// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
		try {
			profile.transferTo(new File(saveDir + "/" + renamedName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		member.setProfilePath(renamedName);
		System.out.println(renamedName);
		
		member.setMpw(bcpe.encode(member.getMpw()));
		int result = mps.updateMember(member);
		return "myPage/myPageMain";
	}

	/* 회원 탈퇴 */
	@RequestMapping("/myPage/deleteMember.do")
	public String deleteMember(Member member, SessionStatus sessionStatus, HttpSession session, Model model) {
		member.setMpw(bcpe.encode(member.getMpw()));
		int result = mps.deleteMember(member);
		if (result > 0) {
			sessionStatus.setComplete();

			msg = "로그아웃 되었습니다.";

		} else
			msg = "탈퇴실패";
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		return "common/msg";
	}

	/* 비밀번호 비교 ajax */
	@RequestMapping(value = "/myPage/passCheck.do")
	@ResponseBody
	public Map<String, Object> passCheck(@RequestParam String mpw, @RequestParam String mid, Model model) {
		Member m = ms.selectOne(mid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", bcpe.matches(mpw, m.getMpw()));
		return map;
	}

	/* 내 게시글 */
	@RequestMapping("/myPage/myBoardList.do")
	public String myBoardList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Member member, Model model) {
		int no = member.getMno();
		int numPerPage = 10;

		int totalContents = mps.selectBoardTotalContents(no);
    
    System.out.println(totalContents);
    
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(
				mps.selectMyBoardList(cPage, numPerPage, no));
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myBoardList.do");
		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", numPerPage).addAttribute("pageBar", pageBar);
    System.out.println(pageBar);
		/*
		 * System.out.println(list.get(0)); System.out.println(list.size());
		 */
		return "myPage/boardMyView";
	}

	/* nav클릭 요청목록보기 */
	@RequestMapping("/myPage/rePermissionPage.do")
	public String requestViewPage(Member member, Model model) {
		List<Authority> list = mps.selectRequest(member.getMno());
		model.addAttribute("list", list);
		return "myPage/requestView";
	}

	/* 요청페이지로이동 */
	@RequestMapping("/myPage/rePermissionClick.do")
	public String requestPage(Member member) {
		return "myPage/requestPermission";
	}

	/* 권한 요청 */
	@RequestMapping("/myPage/rePermission.do")
	public String rePermission(Member member, Authority authority) {
		authority.setMNo(member.getMno());
		int result = mps.insertAuthority(authority);
		return "myPage/requestView";
	}

	@RequestMapping("/myPage/selectRequest.do")
	@ResponseBody
	public Authority selectOneRepermission(@RequestParam String aId) {
		Authority authority = mps.selectOneRePermission(aId);
		return authority;
	}

	/* 요청 수정 */
	@RequestMapping("/myPage/updateRePermission.do")
	public String updateRePermission(Authority authority, Member member, Model model) {
		System.out.println("수정 하기시작");
		System.out.println(authority);

		int result = mps.updateAuthority(authority);

		return requestViewPage(member, model);
	}

	/* 요청 취소 */
	@RequestMapping("/myPage/deleteRePermission.do")
	public String deleteRePermission(Authority authority, Member member, Model model) {
		System.out.println("삭제 하기시작");
		System.out.println(authority);

		int result = mps.deleteMyAuthority(authority.getAId());

		return requestViewPage(member, model);
	}
	
	
/*	@RequestMapping("/myPage/testt.do")
	public String test1() {
		
		return "myPage/test";
	}
	
	@RequestMapping(value = "/myPage/test.do")
	@ResponseBody
	public Map<String,Object> test() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", "asd");
		return map;

	}*/
	
	
	

}
