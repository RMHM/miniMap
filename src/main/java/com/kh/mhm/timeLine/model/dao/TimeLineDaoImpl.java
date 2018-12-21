package com.kh.mhm.timeLine.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.timeLine.model.vo.TimeLine;
import com.kh.mhm.timeLine.model.vo.TimeLineSmpl;

@Repository
public class TimeLineDaoImpl implements TimeLineDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertTimeLine(TimeLineSmpl tls) {
		return sqlSession.insert("TimeLine.insertTimeLine",tls);			
	}
				
//	@Override
//	public int selectMno(String mnick) {
//		System.out.println("DAO mnick::"+mnick);
//		int result=sqlSession.selectOne("TimeLine.selectMno",mnick);
//		System.out.println("DAO result::"+result);
//		return result;
//	}

	@Override
	public Member getMemberByNick(String mnick) {
		Member member=sqlSession.selectOne("TimeLine.getMemberByNick",mnick);
		System.out.println("DAO member::"+member);
		return member;
	}

	@Override
	public List<TimeLine> selectPreTimeLine() {
		return sqlSession.selectList("TimeLine.selectPreTimeLine");
	}

}
