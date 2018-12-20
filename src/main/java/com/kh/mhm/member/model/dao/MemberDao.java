package com.kh.mhm.member.model.dao;

import java.util.HashMap;

import com.kh.mhm.member.model.vo.Member;

public interface MemberDao {

	Member selectOne(String mid);
	
	int insertMember(Member member);
	
	Member selectFindID(String email);

	int checkIdDuplicate(HashMap<String, Object> hmap);
}
