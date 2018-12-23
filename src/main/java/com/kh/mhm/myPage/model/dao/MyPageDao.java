package com.kh.mhm.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.myPage.model.vo.Authority;
import com.kh.mhm.myPage.model.vo.Schedule;

public interface MyPageDao {

	int insertSchedule(Schedule schedule);
  
  List<Map<String,Object>>  selectSchedule(int mno);

	int updateMember(Member member);

	int deleteMember(Member member);

	int insertAuthority(Authority authority);

}
