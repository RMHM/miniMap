package com.kh.mhm.manager.model.dao;

import java.util.List;

import com.kh.mhm.manager.model.vo.BlackList;
import com.kh.mhm.manager.model.vo.CompanyMember;

public interface ManagerDao {

	List<BlackList> selectBlackList();

	List<CompanyMember> selectCompanyMember();
}
