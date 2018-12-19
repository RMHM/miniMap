package com.kh.mhm.member.model.dao;

import com.kh.mhm.member.model.vo.Member;

public interface MemberDao {

	Member selectOne(String mid);

}
