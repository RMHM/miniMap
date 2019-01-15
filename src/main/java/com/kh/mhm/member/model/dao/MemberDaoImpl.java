package com.kh.mhm.member.model.dao;

import java.util.Date;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public Member selectLogin(String mid) {
		return sst.selectOne("member.selectLogin", mid);
	}
	
	@Override
	public Member selectOne(String mid) {
		return sst.selectOne("member.selectOne", mid);
	}

	@Override
	public int insertMember(Member member) {
		return sst.insert("member.insertMember", member);
	}

	@Override
	public Member selectFindID(String email) {
		return sst.selectOne("member.selectFindID", email);
	}

	@Override
	public int updateMemberPW(Member m) {
		return sst.update("member.updatePW", m);
	}

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		sst.selectOne("member.checkIdDuplicate", hmap);
		return (Integer) hmap.get("result");
	}

	@Override
	public Date selectNowBlack(int mno) {
		return sst.selectOne("member.selectNowBlack", mno);
	}

	@Override
	public int checkPw(HashMap<String, Object> hmap) {
		sst.selectOne("member.checkPw", hmap);
		return (Integer) hmap.get("result");
	}

	@Override
	public int checkNick(HashMap<String, Object> hmap) {
		sst.selectOne("member.checkNick", hmap);
		return (Integer) hmap.get("result");
	}

	@Override
	public int checkEmail(HashMap<String, Object> hmap) {
		sst.selectOne("member.checkEmail", hmap);
		return (Integer) hmap.get("result");
	}

	@Override
	public Member selectOne(int mno) {
		return sst.selectOne("member.selectOneMno", mno);
	}

  @Override
	public int selectCheckLogin(String gEmail) {
		return sst.selectOne("member.selectCheckLogin", gEmail);
	}
}
