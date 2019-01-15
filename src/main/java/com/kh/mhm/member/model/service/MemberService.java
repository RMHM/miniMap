package com.kh.mhm.member.model.service;

import java.util.Date;

import com.kh.mhm.member.model.vo.Member;

public interface MemberService {
	
	Member selectLogin(String mid);
	
	Member selectOne(String mid);
	
	Member selectOne(int mno);

	int insertMember(Member member);

	Member selectFindID(String email);

	int updateMemberPW(Member m);

	int checkIdDuplicate(String mid);
	
	Date selectNowBlack(int mno);

	int checkPw(String mpw);

	int checkNick(String mnick);

	int checkEmail(String email);

	int selectCheckLogin(String gEmail);
  
}
