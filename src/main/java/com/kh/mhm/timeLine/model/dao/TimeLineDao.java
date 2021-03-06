package com.kh.mhm.timeLine.model.dao;

import java.util.List;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.timeLine.model.vo.PreTimeLine;
import com.kh.mhm.timeLine.model.vo.TimeLineSmpl;

public interface TimeLineDao {

	// int selectMno(String mnick);

	Member getMemberByNick(String mnick);

	int insertTimeLine(TimeLineSmpl tls);

	List<PreTimeLine> selectPreTimeLine();
	
	List<PreTimeLine> loadMoreLine(int tId);
	
	int blockTimeLine(int tId, String mNick);
	
	List<PreTimeLine> mainTimeLine();
}
