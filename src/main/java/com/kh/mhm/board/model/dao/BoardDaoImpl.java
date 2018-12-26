package com.kh.mhm.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.board.model.vo.Board;
import com.kh.mhm.board.model.vo.Fileref;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Board> selectBoardList(Board board) {
		
        return sqlSession.selectList("board.selectBoardList");
		
	}
	

	@Override
	public List<Board> selectNoticeList(Board board) {
		
		return sqlSession.selectList("board.selectNoticeList");
	}
	

	@Override
	public int selectBoardTotalContents() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFileref(Fileref a) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board selectOneBoard(int bId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.selectOneBoard", bId);
	}
	
	@Override
	public int updateOneCount(int bId) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.updateOneCount", bId);
	}

	@Override
	public List<Fileref> selectFilerefList(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFileref(Fileref a) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFileref(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFile(int attNo) {
		// TODO Auto-generated method stub
		return 0;
	}






	

}