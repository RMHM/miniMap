package com.kh.mhm.manager.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mhm.common.util.Utils;
import com.kh.mhm.manager.model.service.ManagerService;
import com.kh.mhm.member.model.vo.BlackList;
import com.kh.mhm.member.model.vo.CompanyMember;
import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.myPage.model.service.MyPageService;
import com.kh.mhm.myPage.model.vo.Authority;

@Controller
public class ManagerController {
	
  private String msg = "";
	private String loc = "/";
  
	@Autowired
	private ManagerService mns;
	
	@Autowired
	private MyPageService mps;
	
	// 통계
	@RequestMapping("/manager/visitCount.do")
	@ResponseBody
	public List<Integer> selectCount() {
		// All Day Avg
		List<Integer> result = mns.selectCount();
		return result;
	}
	
	@RequestMapping("/manager/statistics.do")
	@ResponseBody
	public List selectStatistics(){
		List result = mns.selectStatistics();
		System.out.println("result : " + result);
		return result;
	}

	// 관리자 페이지로 이동
	@RequestMapping("manager/managerPage.go")
	public String managerPageGo() {
		return "manager/ManagerPage";
	}
	
	// 승인 페이지로 이동
	@RequestMapping("manager/CheckPermission.go")
	public String CheckPermissionGo(Model model, @RequestParam("mno") int mno) {
		
		List list = mns.selectRequest(mno);
		
		System.out.println("list : " + list);
		
		model.addAttribute("list", list);
		
		return "manager/Check_Permission";
	}
	
	// 요청 정보 조회
	@RequestMapping("manager/selectRequestOne.do")
	@ResponseBody
	public Authority selectRequestOne(@RequestParam("mno") int mno, @RequestParam("acode") int acode) {
		
		Authority autho = mns.selectRequestOne(mno, acode);
		
		System.out.println("autho : " + autho);
		
		return autho;
	}

	// 회원 조회
	@RequestMapping("manager/selectMemberList.do")
    @ResponseBody
    public List selectMemberList(String mtype, Model model) {
    	
    	List list = mns.selectMemberList(mtype);
    	
    	return list;
    }
	
	// 회원이 작성한 게시글/댓글 조회
	@RequestMapping("manager/selectUsersBoardList.do")
	public String selectBoardList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam("mno") int mno
			/*Member member*/, Model model) {
		int no = mno;/*member.getMno();*/
		System.out.println("mno : " + mno);
		int numPerPage = 5;

		int totalContents = mps.selectBoardTotalContents(no);
		int totalCoContents = mps.selectCommentTotalContents(no);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(
				mps.selectMyBoardList(cPage, numPerPage, no));
		List<Map<String, Object>> colist = new ArrayList<Map<String, Object>>(
				mps.selectMyCommentList(cPage, numPerPage, no));
		
		String copageBar = Utils.getPageBar(totalCoContents, cPage, numPerPage, "myBoardList.do");
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myBoardList.do");
		model.addAttribute("list", list)
				.addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", numPerPage)
				.addAttribute("pageBar", pageBar)
				.addAttribute("colist", colist)
				.addAttribute("totalCoContents", totalCoContents)
				.addAttribute("copageBar", copageBar);
		
		return "manager/MemberBoardView";
	}

	// 권한 승인 (승인 or 거절 시 쪽지 보낼 수 있게 만들기)
	@RequestMapping("manager/grantAuthority.do")
	public String grantAuthority(Model model, @RequestParam("mnick") String mnick, @RequestParam("acode") int acode) {
		
		int result = mns.grantAuthority(mnick, acode);
		
		if(result > 0) {
			msg = "승인이 완료 되었습니다.";
			loc = "/message/message.allow?mnick="+mnick;
		} else {
			msg = "승인 오류가 발생하였습니다.";
			loc = "/manager/managerPage.go";
		}
		
		model.addAttribute("msg", msg)
		.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	// 권한 요청 거부
	@RequestMapping("manager/refuseAuthority.do")
	public String refuseAuthority(Model model, @RequestParam("mnick") String mnick, @RequestParam("content") String content
			, @RequestParam("acode") int acode) {
		
		int result = mns.refuseAuthority(mnick, acode);
		
		if(result > 0) {
			msg = "요청이 거부 되었습니다.";
			loc = "/message/message.reject?content="+content+"&mnick="+mnick;
		} else {
			msg = "요청 거부 오류가 발생하였습니다.";
			loc = "/manager/managerPage.go";
		}
		
		model.addAttribute("msg", msg)
		.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	// 회원 검색
	@RequestMapping("manager/searchMember.do")
	@ResponseBody
	public List searchMember(@RequestParam("condition") String condition, @RequestParam("keyword") String keyword, Model model) {
		
		List list = mns.searchMember(condition, keyword);
		
		model.addAttribute("list", list);
		
		return list;
	}
	
	// 블랙리스트 승인창 이동
	@RequestMapping("manager/selectReportList.go")
	public String clearBlack(Model model, @RequestParam("mno") int mno) {
		
		List report = mns.selectReportList(mno);
		
		System.out.println("report : " + report);
		
		model.addAttribute("report", report);
		
		return "manager/reportPage";
	}
	
	// 블랙리스트 해제
	@RequestMapping("manager/clearBlackList.do")
	public String clearBlackList(Model model, @RequestParam("mno") int mno) {
		
		int result = mns.clearBlackList(mno);
		
		loc = "/manager/managerPage.go";
		
		if(result > 0) {
			msg = "해당 회원의 정지가 정상적으로 해제되었습니다.";
		} else {
			msg = "블랙리스트 해제 중 오류가 발생했습니다!";
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
		
	}
	
	// 개요 페이지 이동
	@RequestMapping("/synopsis")
	public String goInfo() {
		return "common/synopsis";
	}
	
}
