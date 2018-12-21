package com.kh.mhm.member.model.dao;

import java.util.List;

import com.kh.mhm.member.model.vo.Member;

public interface MemberDao {

	Member selectOne(String mid);
	
	int insertMember(Member member);
	
	Member selectFindID(String email);

	List<Member> selectCommonMember();
	
	List<Member> selectCompanyMember();
}
