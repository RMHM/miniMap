package com.kh.mhm.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mhm.manager.model.service.ManagerService;
import com.kh.mhm.myPage.model.vo.Authority;

@Controller
public class ManagerController {
	
  private String msg = "";
	private String loc = "/";
  
	@Autowired
	private ManagerService mns;
	
	@RequestMapping("/manager/visitCount.do")
	@ResponseBody
	public List<Integer> selectCount() {
		// All Day Avg
		List<Integer> result = mns.selectCount();
		return result;
	}

	// 관리자 페이지로 이동
	@RequestMapping("manager/managerPage.go")
	public String managerPageGo() {
		return "manager/ManagerPage";
	}
	
	// 승인 페이지로 이동
	@RequestMapping("manager/grantPermission.go")
	public String grantPermissionGo(Model model, @RequestParam("mno") int mno) {
		
		Authority autho = mns.selectRequest(mno);
		
		System.out.println("autho : " + autho);
		
		model.addAttribute("autho", autho);
		
		return "manager/grant_Permission";
	}

	// 회원 조회
	@RequestMapping("manager/selectMemberList.do")
    @ResponseBody
    public List selectMemberList(String mtype, Model model) {
    	
    	List list = mns.selectMemberList(mtype);
		
    	model.addAttribute("list", list);
    	
    	System.out.println("list : " + list);
    	
    	return list;
    }

	// 권한 승인 (승인 or 거절 시 쪽지 보낼 수 있게 만들기)
	@RequestMapping("manager/grantAuthority.do")
	public String grantAuthority(Model model, @RequestParam("mno") int mno) {
		
		int result = mns.grantAuthority(mno);
		
		System.out.println("result : " + result);
		
		if(result > 0) {
			msg = "승인이 완료 되었습니다.";
			loc = "managerPage.go"/*"/message/message.write"*/;
		} else {
			msg = "승인 오류가 발생하였습니다.";
			loc = "/manager/grantPermission.go";
		}
		
		model.addAttribute("msg", msg)
		.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	// 권한 요청 거부
	@RequestMapping("manager/refuseAuthority.do")
	public String refuseAuthority(Model model, @RequestParam("mno") int mno) {
		
		int result = mns.refuseAuthority(mno);
		
		if(result > 0) {
			msg = "요청이 거부 되었습니다.";
			loc = "managerPage.go"/*"/message/message.write"*/;
		} else {
			msg = "요청 거부 오류가 발생하였습니다.";
			loc = "/manager/grantPermission.go";
		}
		
		model.addAttribute("msg", msg)
		.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
}
