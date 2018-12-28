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

	int selectMyBoardCount(int no);

	List<Map<String, Object>> selectMyBoard(int cPage, int numPerPage, int no);

	/*List<Map<String, String>> selectRequest(int mno);*/
	List<Authority> selectRequest(int mno);

	

	int updateAuthority(Authority authority);

	Authority selectOneAuthority(String aId);


}
