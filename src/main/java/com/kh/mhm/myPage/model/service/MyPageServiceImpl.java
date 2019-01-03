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
	@Override
	public int selectBoardTotalContents(int no) {
		return  md.selectMyBoardCount(no);
	}
	@Override
	public List<Map<String, Object>> selectMyBoardList(int cPage, int numPerPage, int no) {
		return  md.selectMyBoard(cPage,numPerPage,no);
	}
	@Override
	/*public List<Map<String, String>> selectRequest(int mno) {*/
	public List<Authority> selectRequest(int mno) {
		return md.selectRequest(mno);
	}
	@Override
	public Authority selectOneRePermission(String aId) {
		
		return md.selectOneAuthority(aId);
	}
	@Override
	public int updateAuthority(Authority authority) {
		
		return  md.updateAuthority(authority);
	}
	@Override
	public int deleteSchedule(int sId) {
		
		return md.deleteSchedule(sId);
	}
	@Override
	public int updateSchedule(Schedule schedule) {
	
		return  md.updateSchedule(schedule);
	}
	@Override
	public int deleteMyAuthority(int aId) {
		
		return  md.deleteMyAuthority(aId);
	}

}
