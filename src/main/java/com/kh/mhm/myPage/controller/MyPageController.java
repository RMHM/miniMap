package com.kh.mhm.myPage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.mhm.board.model.service.BoardService;
import com.kh.mhm.board.model.vo.Board;
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

	@RequestMapping("/myPage/insertSchedule.do")
	public String insertSchedule(Member member, @RequestParam String startDateT, @RequestParam String endDateT,
			Schedule schedule, Model model) {
		/* java.util.Date utilDate = new java.util.Date(); */
		/* Date sqlDate = new Date(utilDate.getTime()); */
		/* System.out.println(sqlDate); */
		/* SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd"); */
		schedule.setStart_Date(Date.valueOf(startDateT));
		schedule.setEnd_Date(Date.valueOf(endDateT));
		schedule.setMNo(member.getMno());
		System.out.println("schedule: " + schedule);
		/* schedule.setStart_Date(()startDateT); */
		/*
		 * try { java.util.Date start =; java.util.Date end = sdf.parse(endDateT);
		 * 
		 * schedule.setStart_Date((Date) sdf.parse(startDateT));
		 * schedule.setEnd_Date((end.getTime())); System.out.println("start : " +start);
		 * 
		 * } catch (ParseException e) { e.printStackTrace(); } schedule.setMNo(10);
		 */ /* System.out.println(schedule); */
		int result = mps.insertSchedule(schedule);
		return selectSchedule(member, model);

	}

	/*
	 * @RequestMapping("/myPage/schedule.do") public String schedule() {
	 * 
	 * return "myPage/schedule"; }
	 */

	/* 총 일정 확인 */
	@RequestMapping("/myPage/selectSchedule.do")
	public String selectSchedule(Member member, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("insert 이후");
		/* System.out.println(ms.selectSchedule()); */

		/*
		 * List m =ms.selectSchedule();
		 */
		/*
		 * System.out.println("번호"+member.getMno()); map.put("list",
		 * mps.selectSchedule(member.getMno())); System.out.println(map);
		 */
		model.addAttribute("list", mps.selectSchedule(member.getMno()));
		/* System.out.println(map); */

		ArrayList<Schedule> as = new ArrayList<Schedule>();
		List l = mps.selectSchedule(member.getMno());

		List list = new ArrayList();

		/*
		 * System.out.println("리스트 " + l); System.out.println((l.get(0)));
		 */
		for (int i = 0; i < l.size(); i++) {
			Map<String, Object> result = mps.selectSchedule(member.getMno()).get(i);
			Map<String, Object> arr = new HashMap<String, Object>();

			arr.put("title", result.get("STITLE"));
			arr.put("start", result.get("START_DATE").toString());
			arr.put("end", result.get("END_DATE").toString());
			arr.put("color", result.get("SCOLOR").toString());
			arr.put("constraint", result.get("SCONTENT"));

			/*
			 * result.put("start", result.get("START_DATE").toString()); result.put("end",
			 * result.get("END_DATE").toString()); result.remove("START_DATE");
			 * result.remove("END_DATE");
			 */
			list.add(arr);
		}
		model.addAttribute("list", list);
		/* System.out.println("list"+list); */
		/*
		 * map.put("slist",l ); System.out.println("map"+map);
		 */
		/* schedule = */
		/* model.addAttribute("list", l); */
		/* l.replaceAll(operator); */
		/*
		 * l.remove("END_DATE"); System.out.println("remove" + l);
		 */
		/*
		 * System.out.println(ms.selectSchedule(mNo)); Map<String, Object> map = new
		 * HashMap<String, Object>(); as = (ArrayList<Schedule>) ms.selectSchedule(mNo);
		 */

		/*
		 * List<Map<String, String>> schedule =ms.selectSchedule(mNo);
		 * System.out.println("list"+schedule);
		 */
		/* System.out.println(schedule); */
		/*
		 * map.put("list",ms.selectSchedule(mNo)); System.out.println(map);
		 */
		/*
		 * 
		 * System.out.println("1"+ schedule); schedule = ms.selectSchedule(mNo);
		 * System.out.println("사이즈"+schedule.size()); Map map=new HashMap(); for(int
		 * i=0; i<schedule.size();i++) {
		 * 
		 * System.out.println(i+":"+schedule.get(i)); } map.put("slist", schedule);
		 * mv.addObject(map); mv.setViewName("list");
		 * 
		 * System.out.println(mv);
		 */
		return "myPage/schedule";
	}

	/* myPagemain경로 */
	@RequestMapping("/myPage/myPageMain.do")
	public String myPageMain() {

		/* return "myPage/schedule"; */
		return "myPage/myPageMain";
	}

	/* 비밀번호 비교후 수정페이지 이동 */
	@RequestMapping("/myPage/updateMemberView.do")
	public String updateMemberView() {
		return "member/memberView";
	}

	/* 회원정보 수정 하고 myPageMain 이동 */
	@RequestMapping("/myPage/updateMember.do")
	public String updateMember(Member member) {
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
	public String myBoardList(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage,Member member, Model model) {
		int no = member.getMno();
		int numPerPage = 10; 
		
		int totalContents = mps.selectBoardTotalContents(no);
		
		List<Map<String, Object>> list = 
				new ArrayList<Map<String, Object>>(mps.selectMyBoardList(cPage,numPerPage,no));
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myBoardList.do");
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
/*		System.out.println(list.get(0));
		System.out.println(list.size());*/
		return "myPage/boardMyView";
	}

	/*nav 클릭*/
	@RequestMapping("/myPage/rePermissionPage.do")
	public String requestViewPage(Member member,Model model) {
		/*int no = member.getMno();
		int numPerPage = 10; */
		// 한 페이지당 게시글 수
		/*ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>(mps.selectMyBoardList(cPage, numPerPage));*/
		/*int totalContents = mps.selectBoardTotalContents(no);*/
		
		// 3. 페이지 계산 후 작성할 HTML 추가
	/*	String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardList.do");
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
		*/
		/*List<Authority> list = mps.selectRequest(member.getMno());*/
		/*ArrayList<Map<String, String>> list = 
				new ArrayList<Map<String, String>>( mps.selectRequest(member.getMno()));
		
		System.out.println(list);
		System.out.println(list.get(0));
		System.out.println(list.get(0).);
		*//*Map<Authority,Object> result = new Map<Authority,Object>(mps.selectRequest(member.getMno()));
		*/
		List<Authority> list = mps.selectRequest(member.getMno());
		System.out.println(list);
	System.out.println(list.get(0).getAddress());
		model.addAttribute("list", list);
		return "myPage/requestView";
	}
	
	/* 요청클릭 */ 
	@RequestMapping("/myPage/rePermissionClick.do")
	public String requestPage(Member member) {
		return "myPage/requestPermission";
	}
	

	/* 권한 요청 */
	@RequestMapping("/myPage/rePermission.do")
	public String rePermission(Member member, Authority authority) {
		authority.setMNo(member.getMno());
		int result = mps.insertAuthority(authority);
		return "myPage/myPageMain";
	}
	
	/* 권한 승인 */
	@RequestMapping("/mypage/grantAuthority.do")
	public String grantAuthority(Authority autho, Model model) {
		
		msg = "승인이 완료 되었습니다.";
		loc = "/manager/grantPermission.go";
		
		/* atake, grant_date Y, sysdate로 수정되게 하기 */
		
		model.addAttribute("msg", msg)
		.addAttribute("loc", loc);
		
		return "common/msg";
	}

}
