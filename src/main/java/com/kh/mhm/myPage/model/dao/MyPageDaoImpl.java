package com.kh.mhm.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.member.model.vo.Member;
import com.kh.mhm.myPage.model.vo.Authority;
import com.kh.mhm.myPage.model.vo.Schedule;
@Repository
public class MyPageDaoImpl implements MyPageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public int insertSchedule(Schedule schedule) {

		return sqlSession.insert("myPage.insertSchedule", schedule);
	}
	@Override
	public List<Map<String,Object>> selectSchedule(int mno) {
		return sqlSession.selectList("myPage.selectSchedule",mno);
	}
	@Override
	public int updateMember(Member member) {

		return sqlSession.update("member.updateMember",member);
	}
	@Override
	public int deleteMember(Member member) {

		return sqlSession.update("member.deleteMember",member);
	}
	@Override
	public int insertAuthority(Authority authority) {
	
		return sqlSession.insert("authority.insertAuthority",authority);
	}

}
