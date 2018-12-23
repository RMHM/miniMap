package com.kh.mhm.myPage.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.myPage.model.dao.MyPageDao;
import com.kh.mhm.myPage.model.vo.Authority;
import com.kh.mhm.myPage.model.vo.Schedule;
@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDao md;
	@Override
	public int insertSchedule(Schedule schedule) {

		return md.insertSchedule(schedule);
	}
	@Override
  public List<Map<String,Object>> selectSchedule(int mno) {
		
		return md.selectSchedule(mno);
	}
	@Override
	public int updateMember(Member member) {
		return md.updateMember(member);

	}
	@Override
	public int deleteMember(Member member) {

		return md.deleteMember(member);
	}
	@Override
	public int insertAuthority(Authority authority) {
		return md.insertAuthority(authority);
	}

}
