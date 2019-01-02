package com.kh.mhm.manager.model.dao;

import java.util.List;

import com.kh.mhm.member.model.vo.BlackList;
import com.kh.mhm.myPage.model.vo.Authority;

public interface ManagerDao {
	
	List<Integer> selectCount();
	
	List selectMemberList(String mtype);

	int grantAuthority(int mno);

	Authority selectRequest(int mno);

	int refuseAuthority(int mno);

	List searchMember(String condition, String keyword);

	int clearBlackList(int mno);

	BlackList selectOneBlackList(int mno);
}
