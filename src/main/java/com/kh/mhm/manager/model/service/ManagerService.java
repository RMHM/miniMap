package com.kh.mhm.manager.model.service;

import java.util.List;

import com.kh.mhm.myPage.model.vo.Authority;

public interface ManagerService {
	
	List<Integer> selectCount();
	
	List selectMemberList(String mtype);

	int grantAuthority(int mno);

	Authority selectRequest(int mno);

	int refuseAuthority(int mno);

}
