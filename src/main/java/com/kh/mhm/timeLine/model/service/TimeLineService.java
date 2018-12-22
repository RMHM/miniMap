package com.kh.mhm.timeLine.model.service;

import java.util.List;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.timeLine.model.vo.TimeLine;
import com.kh.mhm.timeLine.model.vo.TimeLineSmpl;

public interface TimeLineService {

	//	int selectMno(String mnick);

	Member getMemberByNick(String mnick);

	int insertTimeLine(TimeLineSmpl tls);

	List<TimeLine> selectPreTimeLine();

}
