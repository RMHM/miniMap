package com.kh.mhm.member.model.service;

import java.util.List;
import java.util.HashMap;

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

	@Override
	public int insertMember(Member member) {
		return mDao.insertMember(member);
	}

	@Override
	public Member selectFindID(String email) {
		return mDao.selectFindID(email);
	}

	@Override
	public List<Member> selectCommonMember() {
		return mDao.selectCommonMember();
	}

	@Override
	public List<Member> selectCompanyMember() {
		return mDao.selectCompanyMember();
	}

	@Override
	public int updateMemberPW(Member m) {
		return mDao.updateMemberPW(m);
	}

	@Override
	public int checkIdDuplicate(String mid) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("mid", mid);
		return mDao.checkIdDuplicate(hmap);
	}

}
