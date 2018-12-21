package com.kh.mhm.member.model.service;

import java.util.List;

import com.kh.mhm.member.model.vo.Member;

public interface MemberService {
  
	Member selectOne(String mid);
	
	int insertMember(Member member);
	
	Member selectFindID(String email);

	List<Member> selectCommonMember();
	
	List<Member> selectCompanyMember();
}
