package com.kh.mhm.manager.model.dao;

import java.util.List;

import com.kh.mhm.member.model.vo.BlackList;
import com.kh.mhm.myPage.model.vo.Authority;

public interface ManagerDao {
	
	List<Integer> selectCount();
	
	List selectMemberList(String mtype);

	int grantAuthority(String mnick, int acode);

	List selectRequest(int mno);

	int refuseAuthority(String mnick, int acode);

	List searchMember(String condition, String keyword);

	int clearBlackList(int mno);

	List selectReportList(int mno);

	List selectStatistics();

	Authority selectRequestOne(int mno, int acode);
}
