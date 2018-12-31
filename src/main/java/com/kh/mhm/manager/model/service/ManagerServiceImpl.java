package com.kh.mhm.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mhm.manager.model.dao.ManagerDao;
import com.kh.mhm.myPage.model.vo.Authority;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	private ManagerDao mnDao;
	
	@Override
	public List<Integer> selectCount() {
		return mnDao.selectCount();
	}
  
  @Override
	public List selectMemberList(String mtype) {
		return mnDao.selectMemberList(mtype);
	}

	@Override
	public int grantAuthority(int mno) {
		return mnDao.grantAuthority(mno);
	}

	@Override
	public int refuseAuthority(int mno) {
		return mnDao.refuseAuthority(mno);
	}
	
	@Override
	public Authority selectRequest(int mno) {
		return mnDao.selectRequest(mno);
	}

	@Override
	public List searchMember(String condition, String keyword) {
		return mnDao.searchMember(condition, keyword);
	}
  
}
