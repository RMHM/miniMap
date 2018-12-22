package com.kh.mhm.member.model.dao;

import java.util.List;
import java.util.HashMap;

import com.kh.mhm.member.model.vo.Member;

public interface MemberDao {

	Member selectOne(String mid);

	int insertMember(Member member);

	Member selectFindID(String email);

	List<Member> selectCommonMember();

	int checkIdDuplicate(HashMap<String, Object> hmap);

	int updateMemberPW(Member m);

	List<Member> selectCompanyMember();

}
