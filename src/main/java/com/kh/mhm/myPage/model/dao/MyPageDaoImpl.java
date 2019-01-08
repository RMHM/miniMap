package com.kh.mhm.myPage.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	@Override
	public int selectMyBoardCount(int no) {
		
		return sqlSession.selectOne("myPage.selectBoardCount",no);
	}
	@Override
	public List<Map<String, Object>> selectMyBoard(int cPage, int numPerPage, int no) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("myPage.selectMyBoard",no,rowBounds);
	}
	@Override
	public List<Map<String, Object>> selectMyComment(int cPage, int numPerPage, int no) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("myPage.selectMyComment",no,rowBounds);
	}
	@Override
/*	public List<Map<String, String>> selectRequest(int mno) {*/
	public List<Authority> selectRequest(int mno) {
		return sqlSession.selectList("myPage.selectRequest",mno);
	}
	@Override
	public int updateAuthority(Authority authority) {
		// TODO Auto-generated method stub
		return sqlSession.update("myPage.updateAuthority",authority);
	}
	/**/
	@Override
	public Authority selectOneAuthority(String aId) {
		return sqlSession.selectOne("myPage.selectOneMyAuthority",aId);
	}
	@Override
	public int deleteSchedule(int sId) {
		
		return sqlSession.update("myPage.deleteSchedule",sId);
	}
	@Override
	public int updateSchedule(Schedule schedule) {
	
		return sqlSession.update("myPage.updateSchedule",schedule);
	}
	@Override
	public int deleteMyAuthority(int aId) {
		return sqlSession.update("myPage.deleteAuthority",aId);
	}
	@Override
	public int selectCommentTotalContents(int no) {
		
		return sqlSession.selectOne("myPage.selectCommentCount",no);
	}
	@Override
	public int selectNick(String mnick) {
		
		return sqlSession.selectOne("myPage.selectNick",mnick);
	}
	@Override
	public int selectEmail(String email) {
		return sqlSession.selectOne("myPage.selectEmail",email);
	}
	@Override
	public int selectmessage(int mno) {
		
		return sqlSession.selectOne("myPage.selectMessageCount",mno);
	}
}
