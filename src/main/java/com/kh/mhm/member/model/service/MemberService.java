package com.kh.mhm.member.model.service;

import com.kh.mhm.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);
	Member selectOne(String mid);

}
