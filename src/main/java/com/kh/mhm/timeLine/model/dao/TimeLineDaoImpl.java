package com.kh.mhm.timeLine.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.timeLine.model.vo.PreTimeLine;
import com.kh.mhm.timeLine.model.vo.TimeLineSmpl;

@Repository
public class TimeLineDaoImpl implements TimeLineDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertTimeLine(TimeLineSmpl tls) {
		int result=sqlSession.insert("TimeLine.insertTimeLine", tls);
		if(result>0) {
			return sqlSession.selectOne("TimeLine.getTid");
		}else {
			return 0;
		}
	}

	@Override
	public Member getMemberByNick(String mnick) {
		Member member = sqlSession.selectOne("TimeLine.getMemberByNick", mnick);
		System.out.println("DAO member::" + member);
		return member;
	}

	@Override
	public List<PreTimeLine> selectPreTimeLine() {
		return sqlSession.selectList("TimeLine.selectPreTimeLine");
	}

	@Override
	public List<PreTimeLine> loadMoreLine(int tId) {
		return sqlSession.selectList("TimeLine.loadMoreLine",tId);
	}

	@Override
	public int blockTimeLine(int tId, String mNick) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("tId", tId);
		map.put("mNick", mNick);
		return sqlSession.insert("TimeLine.blockTimeLine",map);
	}

	@Override
	public List<PreTimeLine> mainTimeLine() {
		return sqlSession.selectList("TimeLine.mainTimeLine");
	}

	@Override
	public List<PreTimeLine> searchTimeLine(String text) {
		return sqlSession.selectList("TimeLine.searchTimeLine",text);
	}

	@Override
	public List<PreTimeLine> classifyTimeLine(String tType) {
		return sqlSession.selectList("TimeLine.classifyTimeLine",tType);
	}

	@Override
	public List<PreTimeLine> loadMoreClassify(Map<String, Object> map) {
		return sqlSession.selectList("TimeLine.loadMoreClassify",map);
	}

}
