package com.kh.mhm.member.model.service;

import java.util.Date;
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
	public Member selectLogin(String mid) {
		return mDao.selectLogin(mid);
	}
	
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
	public int updateMemberPW(Member m) {
		return mDao.updateMemberPW(m);
	}

	@Override
	public int checkIdDuplicate(String mid) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("mid", mid);
		return mDao.checkIdDuplicate(hmap);
	}

	@Override
	public Date selectNowBlack(int mno) {
		return mDao.selectNowBlack(mno);
	}

	@Override
	public int checkPw(String mpw) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("mpw", mpw);
		return mDao.checkPw(hmap);
	}

	@Override
	public int checkNick(String mnick) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("mnick", mnick);
		return mDao.checkNick(hmap);
	}

	@Override
	public int checkEmail(String email) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("email", email);
		return mDao.checkEmail(hmap);
	}

	@Override
	public Member selectOne(int mno) {
		return mDao.selectOne(mno);
	}

  @Override
	public int selectCheckLogin(String gEmail) {
		return mDao.selectCheckLogin(gEmail);
	}
}
