package com.kh.mhm.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mhm.manager.model.service.ManagerService;
import com.kh.mhm.manager.model.vo.BlackList;
import com.kh.mhm.manager.model.vo.CompanyMember;

@Controller
public class ManagerController {

	@Autowired
	ManagerService mns;

	@RequestMapping("/manager/selectCompanyMember.do")
	@ResponseBody
	public List<CompanyMember> selectCompanyMember(){
		List<CompanyMember> clist = mns.selectCompanyMember();

		System.out.println("clist : " + clist);
		return clist;
	}

	@RequestMapping("/manager/selectBlackList.do")
	@ResponseBody
	public List<BlackList> selectBlackList(){
		List<BlackList> blist = mns.selectBlackList();

		System.out.println("blist : " + blist);
		return blist;
	}

	@RequestMapping("/manager/managerPage.go")
	public String managerPageGo() {
		return "manager/ManagerPage";
	}

}
