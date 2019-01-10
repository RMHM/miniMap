package com.kh.mhm.member.model.dao;

import java.util.List;
import java.util.Date;
import java.util.HashMap;

import com.kh.mhm.member.model.vo.Member;

public interface MemberDao {
	
	Member selectLogin(String mid);
	
	Member selectOne(String mid);

	int insertMember(Member member);

	Member selectFindID(String email);

	int checkIdDuplicate(HashMap<String, Object> hmap);

	int updateMemberPW(Member m);

	Date selectNowBlack(int mno);

	int checkPw(HashMap<String, Object> hmap);

	int checkNick(HashMap<String, Object> hmap);

	int checkEmail(HashMap<String, Object> hmap);

	
  
}
