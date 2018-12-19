package com.kh.mhm.member.model.service;

import com.kh.mhm.member.model.vo.Member;

public interface MemberService {
  
	Member selectOne(String mid);
	
	int insertMember(Member member);
	
	Member selectFindID(String email);
}
