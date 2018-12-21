package com.kh.mhm.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.myPage.model.vo.Schedule;

public interface MyPageDao {

	int insertSchedule(Schedule schedule);
	
	List<Map<String,Object>>  selectSchedule();

	int updateMember(Member member);

}
