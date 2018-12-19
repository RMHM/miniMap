package com.kh.mhm.member.model.dao;

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

}
