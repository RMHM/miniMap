package com.kh.mhm.manager.model.service;

import java.util.List;

import com.kh.mhm.member.model.vo.BlackList;
import com.kh.mhm.myPage.model.vo.Authority;

public interface ManagerService {
	
	List<Integer> selectCount();
	
	List selectMemberList(String mtype);

	int grantAuthority(String mnick);

	List selectRequest(int mno);

	int refuseAuthority(String mnick);
  
	List searchMember(String condition, String keyword);

	int clearBlackList(int mno);

	List selectReportList(int mno);

	List selectStatistics();

	Authority selectRequestOne(int mno, int acode);

}
