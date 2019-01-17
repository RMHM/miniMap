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
import java.net.ConnectException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
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
import com.kh.mhm.message.model.service.MessageService;
import com.kh.mhm.message.model.vo.Message;
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
	MessageService mss;
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
		/*return selectSchedule(member, model);*/
		return "redirect:/myPage/selectScheduleNav.do";

	}

	/* 일정 삭제 */
	@RequestMapping("/myPage/deleteSchedule.do")
  public String deleteSchedule(Member member, @RequestParam int sId, Model model) throws IOException {
		System.out.println("delete 실행");
		Schedule s = new Schedule();
		s.setSId(sId);
		System.out.println(sId);
		mps.deleteSchedule(sId);

		/*return selectSchedule(member, model);*/
		return "redirect:/myPage/selectScheduleNav.do";

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
		/*return selectSchedule(member, model);*/
		return "myPage/schedule";

	}
	@RequestMapping("/myPage/selectScheduleNav.do")
	public String scheduleNav(Member member, Model model) {
		return "myPage/schedule";
	}

	/* 총 일정 확인 */
	@RequestMapping("/myPage/selectSchedule.do")
	@ResponseBody
  public Map<String,Object> selectSchedule(Member member, Model model,
			@RequestParam(value = "type", required = false, defaultValue = "1") int cPage
			) throws IOException {
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
	
		
		String times = "";
		map.put("list", list);
		/*try{*/
			map.put("temper",t.temperature(num));
			map.put("weather",a.weather());
		/*}catch(SocketTimeoutException| ConnectException|UnknownHostException e) {
			msg="날씨 정보를 갖고오는 중 오류가 발생했습니다.";
			map.put("msg", times);
		}*/
	
		/*return "myPage/schedule";*/
		return map;
	}
	
	/*월 평균 기온*/
	@RequestMapping(value="/myPage/temper.do")
	@ResponseBody
	public ArrayList temperature(@RequestParam int num) throws IOException {
		System.out.println("다음 날짜 확인 ");
		Temperatures t = new Temperatures();
		System.out.println(t);
		return t.temperature(num);
	}
	
	/*ajax 실시간 문자수 ==> 소켓 활용하기로 했음*/
	/*@RequestMapping(value = "/myPage/message.do")
	@ResponseBody
	public int messageCount(Member member, Model model) {

		return mps.selectMyMessage(member.getMno());
	}*/
	
	
	/* myPagemain 경로 */
	@RequestMapping("/myPage/myPageMain.do")
	public String myPageMain(Member member,Model model) {
		/*List<Message> message =mss.selectMyMessage(member.getMno());
		model.addAttribute("msg",message);*/
		return "myPage/myPageMain";
	}

	/* 비밀번호 비교후 수정페이지 이동 */
	@RequestMapping("/myPage/updateMemberView.do")
	public String updateMemberView() {
		return "myPage/updateview";
	}

	/* 회원정보 수정 하고 myPageMain 이동 */
	@RequestMapping("/myPage/updateMember.do")
	public String updateMember(@RequestParam(value="profile", required = false) MultipartFile profile,Member member, @RequestParam String mpwTest, HttpSession session, HttpServletRequest request) {
		System.out.println("이름 : " + profile);
		System.out.println(profile.getOriginalFilename());
		System.out.println(profile.getSize());
		System.out.println(profile.getName());
		System.out.println(profile.getContentType());
		System.out.println("-----------------------");
		if(profile.getSize()==0) {
			System.out.println("원본"+member.getProfilePath());
		
		}else {
			if(profile.getName().equals("default.PNG")) {
				System.out.println("기본이미지 :+ " + profile.getName());
				member.setProfilePath(profile.getName());
			}else {
				String saveDir = session.getServletContext().getRealPath("/resources/img/profiles");
				File dir = new File(saveDir);
				
				if(dir.exists() == false) dir.mkdirs();
				String originName = profile.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".")+1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				int rndNum = (int)(Math.random() * 1000);
				String renamedName = sdf.format(new java.util.Date()) + "_" + rndNum + "." + ext;
				
				// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
				try {
					profile.transferTo(new File(saveDir + "/" + renamedName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				member.setProfilePath(renamedName);
			}
		}
		member.setMpw((member.getMpw().equals(""))? mpwTest :bcpe.encode(member.getMpw()));
	
		
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
			/*session.invalidate();*/

			msg = "탈퇴를 완료했습니다.";

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
	
	/* 닉네임 비교 ajax */
	@RequestMapping(value = "/myPage/nickCheck.do")
	@ResponseBody
	public Map<String, Object> nickCheck(@RequestParam String mnick, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int result = mps.selectNick(mnick);		
			if(result>0)result = 1;
			else result=0;
			System.out.println(result);
			map.put("result", result);
		}catch(NullPointerException e) {
			e.getMessage();
		}
		
		return map;
	}
	/* 이메일 비교 ajax */
	@RequestMapping(value = "/myPage/emailCheck.do")
	@ResponseBody
	public Map<String, Object> emailCheck(@RequestParam String email, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			int result = mps.selectEmail(email);		
			if(result>0)result = 1;
			else result=0;
			System.out.println(result);
			map.put("result", result);
		}catch(NullPointerException e) {
			e.getMessage();
		}
		
		return map;
	}

	/* 내 게시글 */
	@RequestMapping("/myPage/myBoardList.do")
	public String myBoardList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Member member, Model model) {
		int no = member.getMno();
		int numPerPage = 5;

		int totalContents = mps.selectBoardTotalContents(no);
		/*int totalCoContents = mps.selectCommentTotalContents(no);*/
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(
				mps.selectMyBoardList(cPage, numPerPage, no));
	/*	List<Map<String, Object>> colist = new ArrayList<Map<String, Object>>(
				mps.selectMyCommentList(cPage, numPerPage, no));
		*/
		/*String copageBar = Utils.getPageBar(totalCoContents, cPage, numPerPage, "myBoardList.do");*/
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myBoardList.do");
		model.addAttribute("list", list)
				.addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", numPerPage)
				.addAttribute("pageBar", pageBar)
				.addAttribute("myType","board")
				/*.addAttribute("colist", colist)
				.addAttribute("totalCoContents", totalCoContents)
				.addAttribute("copageBar", copageBar)*/
				;
		return "myPage/boardMyView";
	}
	
	/* 댓글 */
	@RequestMapping("/myPage/myCommentList.do")
	public String myCommentList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Member member, Model model) {
		int no = member.getMno();
		int numPerPage = 5;
		int totalCoContents = mps.selectCommentTotalContents(no);
		
		List<Map<String, Object>> colist = new ArrayList<Map<String, Object>>(
				mps.selectMyCommentList(cPage, numPerPage, no));
		
		String copageBar = Utils.getPageBar(totalCoContents, cPage, numPerPage, "myCommentList.do");
	
		model.addAttribute("numPerPage", numPerPage)
				.addAttribute("colist", colist)
				.addAttribute("totalCoContents", totalCoContents)
				.addAttribute("copageBar", copageBar)
				.addAttribute("myType","comment")
				;
		return "myPage/boardMyView";
	}
	
	/* nav클릭 요청목록보기 */
	@RequestMapping("/myPage/rePermissionPage.do")
	public String requestViewPage(Member member, Model model) {
		List<Authority> list = mps.selectRequest(member.getMno());
		/*try {
		Map<String, Object> map = model.asMap();
		System.out.println("asdasd"+(map.get("msg").toString()));
			
		
		
		}catch(NullPointerException e) {
			e.getMessage();
		}*/
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
	public String rePermission(@RequestParam(value="reImg", required = false) MultipartFile reImg,Member member, Model model, Authority authority,HttpSession session, HttpServletRequest request) {
		System.out.println("----");
		System.out.println("요청 추가" + reImg);
		System.out.println("사이즈"+reImg.getSize());
		if(reImg.getSize()==0) {
			
			System.out.println("원본" + authority.getImg_file());
			
			
		}else {
		String saveDir = session.getServletContext().getRealPath("/resources/img/authority");
		File dir = new File(saveDir);
		
		if(dir.exists() == false) dir.mkdirs();
		String originName = reImg.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf(".")+1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		int rndNum = (int)(Math.random() * 1000);
		String renamedName = sdf.format(new java.util.Date()) + "_" + rndNum + "." + ext;
		// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
		try {
			reImg.transferTo(new File(saveDir + "/" + renamedName));
		
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		authority.setImg_file(renamedName);
		
		}
		authority.setMNo(member.getMno());
		authority.setMName(member.getMname());
		int result = mps.insertAuthority(authority);
		if (result==0) model.addAttribute("msg","이미 요청하셨습니다.");
		else model.addAttribute("msg","요청되셨습니다.");
		return requestViewPage(member,model);
	}

	@RequestMapping("/myPage/selectRequest.do")
	@ResponseBody
	public Authority selectOneRepermission(@RequestParam String aId) {
		Authority authority = mps.selectOneRePermission(aId);
		return authority;
	}

	/* 요청 수정 */
	@RequestMapping("/myPage/updateRePermission.do")
	public String updateRePermission(Authority authority,@RequestParam(value="reImg", required = false) MultipartFile reImg, Member member, Model model,HttpSession session, HttpServletRequest request) {
		System.out.println("수정 하기시작");
		System.out.println(authority);
		
		
		
		if(reImg.getSize()!=0) {
			String saveDir = session.getServletContext().getRealPath("/resources/img/authority");
			File dir = new File(saveDir);
			
			if(dir.exists() == false) dir.mkdirs();
			String originName = reImg.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf(".")+1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
			int rndNum = (int)(Math.random() * 1000);
			String renamedName = sdf.format(new java.util.Date()) + "_" + rndNum + "." + ext;
			// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
			try {
				reImg.transferTo(new File(saveDir + "/" + renamedName));
			
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			authority.setImg_file(renamedName);
			
			}
		
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
