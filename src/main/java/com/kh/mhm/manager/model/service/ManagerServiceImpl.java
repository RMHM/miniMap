package com.kh.mhm.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mhm.manager.model.dao.ManagerDao;
import com.kh.mhm.manager.model.vo.BlackList;
import com.kh.mhm.manager.model.vo.CompanyMember;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	ManagerDao mnDao;

	@Override
	public List<BlackList> selectBlackList() {
		return mnDao.selectBlackList();
	}

	@Override
	public List<CompanyMember> selectCompanyMember() {
		return mnDao.selectCompanyMember();
	}

	@Override
	public List<Integer> selectCount() {
		return mnDao.selectCount();
	}

}
