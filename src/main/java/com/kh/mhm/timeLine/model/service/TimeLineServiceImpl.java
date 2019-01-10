package com.kh.mhm.timeLine.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.timeLine.model.dao.TimeLineDao;
import com.kh.mhm.timeLine.model.vo.PreTimeLine;
import com.kh.mhm.timeLine.model.vo.TimeLineSmpl;

@Service
public class TimeLineServiceImpl implements TimeLineService {

	@Autowired
	TimeLineDao tldi;

	@Override
	public int insertTimeLine(TimeLineSmpl tls) {
		return tldi.insertTimeLine(tls);
	}

	// @Override
	// public int selectMno(String mnick) {
	// System.out.println("SERVICE mnick::"+mnick);
	// int result= tldi.selectMno(mnick);
	// System.out.println("SERVICE result::"+result);
	// return result;
	// }

	@Override
	public Member getMemberByNick(String mnick) {
		return tldi.getMemberByNick(mnick);
	}

	@Override
	public List<PreTimeLine> selectPreTimeLine() {
		return tldi.selectPreTimeLine();
	}

	@Override
	public List<PreTimeLine> loadMoreLine(int tId) {
		return tldi.loadMoreLine(tId);
	}

}
