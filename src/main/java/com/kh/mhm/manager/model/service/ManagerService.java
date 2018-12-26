package com.kh.mhm.manager.model.service;

import java.util.List;

import com.kh.mhm.manager.model.vo.BlackList;
import com.kh.mhm.manager.model.vo.CompanyMember;

public interface ManagerService {

	List<BlackList> selectBlackList();

	List<CompanyMember> selectCompanyMember();

	List<Integer> selectCount();

}
