package com.kh.mhm.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.myPage.model.vo.Authority;
import com.kh.mhm.myPage.model.vo.Schedule;

public interface MyPageDao {
	/* 일정 */
	int insertSchedule(Schedule schedule);
  
    List<Map<String,Object>>  selectSchedule(int mno);
    
    /* 회원 정보 */
	int updateMember(Member member);

	int deleteMember(Member member);

	/* 작성 글 */
	int selectMyBoardCount(int no);
	
	/* 권한 */
	int insertAuthority(Authority authority);

	List<Map<String, Object>> selectMyBoard(int cPage, int numPerPage, int no);

	/*List<Map<String, String>> selectRequest(int mno);*/
	List<Authority> selectRequest(int mno);

	

	int updateAuthority(Authority authority);

	Authority selectOneAuthority(String aId);

	int deleteSchedule(int sId);

	int updateSchedule(Schedule schedule);

	int deleteMyAuthority(int aId);

	int selectCommentTotalContents(int no);

	List<Map<String, Object>> selectMyComment(int cPage, int numPerPage, int no);


}
