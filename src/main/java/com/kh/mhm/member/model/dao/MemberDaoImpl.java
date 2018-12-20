package com.kh.mhm.member.model.dao;

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
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		sst.selectOne("member.checkIdDuplicate", hmap);
		
		return (Integer) hmap.get("result");
	}


}