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

	List<Member> selectCommonMember();

	int checkIdDuplicate(HashMap<String, Object> hmap);

	int updateMemberPW(Member m);

	List<Member> selectCompanyMember();
	
	Date selectNowBlack(int mno);
  
  int checkNick(HashMap<String, Object> hmap);
  
  List selectMemberList(String mtype);

}
