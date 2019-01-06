package com.kh.mhm.myPage.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.myPage.model.vo.Authority;
import com.kh.mhm.myPage.model.vo.Schedule;

public interface MyPageService {

	int insertSchedule(Schedule schedule);
  
  List<Map<String,Object>> selectSchedule(int mno);

	int updateMember(Member member);

	int deleteMember(Member member);

	int insertAuthority(Authority authority);

	int selectBoardTotalContents(int no);

	List<Map<String, Object>> selectMyBoardList(int cPage, int numPerPage, int no);
	List<Map<String, Object>> selectMyCommentList(int cPage, int numPerPage, int no);
	/*List<Map<String, String>> selectRequest(int mno);*/
	List<Authority> selectRequest(int mno);

	Authority selectOneRePermission(String aId);

	int updateAuthority(Authority authority);

	int deleteSchedule(int sId);

	int updateSchedule(Schedule schedule);

	int deleteMyAuthority(int aId);

	int selectCommentTotalContents(int no);
	
	
	
}
