package com.kh.mhm.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mhm.member.model.dao.MemberDao;
import com.kh.mhm.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	@Override
	public Member selectOne(String mid) {
		return mDao.selectOne(mid);
	}

}
