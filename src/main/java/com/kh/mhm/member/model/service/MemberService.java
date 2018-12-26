package com.kh.mhm.member.model.service;

import java.util.List;

import com.kh.mhm.member.model.vo.Member;

public interface MemberService {
  
	Member selectOne(String mid);
	
	int insertMember(Member member);
	
	Member selectFindID(String email);
  
	int updateMemberPW(Member m);
	
	int checkIdDuplicate(String mid);
	
	List selectMemberList(String mtype);
	
}
