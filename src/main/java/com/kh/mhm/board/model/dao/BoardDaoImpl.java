package com.kh.mhm.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
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
	public List<Board> selectBoardList(int bCode) {
		
        return sqlSession.selectList("board.selectBoardListToBtype", bCode);
		
	}
	
	@Override
	public List<Board> selectBoardList(String keyfield, String keyword) {
		List<Board> list = null;
      
        if(keyfield != null && keyword != null && keyfield !="" && keyword !=""){
            Map<String, String> map = new HashMap<String, String> ();
            map.put("keyfield" , keyfield);
            map.put("keyword", keyword);
            list = sqlSession.selectList("board.selectSearchList", map);
            sqlSession.close();
            return list;
        }else {
            list = sqlSession.selectList("board.selectBoardList");
            sqlSession.close();
            return list;		
		
        }
        
		
	}
	

	@Override
	public List<Board> selectNoticeList(Board board) {
		
		return sqlSession.selectList("board.selectNoticeList");
	}
	

	@Override
	public int selectBoardTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.selectBoardTotalContents");
	}

	@Override
	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.insertBoard", board);
	}

	@Override
	public int insertFileref(Fileref a) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board selectOneBoard(int BId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.selectOneBoard", BId);
	}
	
	@Override
	public int updateOneCount(int BId) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.updateOneCount", BId);
	}

	@Override
	public List<Fileref> selectFilerefList(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.updateBoard", board);
	}

	@Override
	public int updateFileref(Fileref a) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int BId) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.deleteBoard", BId);
	}

	@Override
	public int deleteFileref(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, String>> selectBoardList2(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);	
		return sqlSession.selectList("board.selectBoardList",null,rowBounds);
	}

	@Override
	public int insertImgBoard(Board board) {
		return sqlSession.insert("board.insertImgBaord", board);
	}

	@Override
	public int insertImgFile(Fileref fref) {
		return sqlSession.insert("board.insertImgFile", fref);
	}

	@Override
	public String selectThumbnailImg(int bid) {
		return sqlSession.selectOne("board.selectThumbnailImg", bid);
	}

	@Override
	public int selectCommentCnt(int bid) {
		return sqlSession.selectOne("board.selectCommentCnt", bid);
	}

	@Override
	public int deleteImg(int bid) {
		return sqlSession.update("board.deleteImg", bid);
	}

	@Override
	public List<String> selectBoardImg(int bid) {
		return sqlSession.selectList("board.selectBoardImg", bid);
	}

	@Override
	public int deleteOneImg(String imgName) {
		return sqlSession.update("board.deleteOneImg", imgName);
	}

	@Override
	public int updateImgBoard(Board b) {
		return sqlSession.update("board.updateImgBoard", b);
	}

	@Override
	public int selectBoardCnt(int bCode) {
		return sqlSession.selectOne("board.selectBoardCnt", bCode);
	}

	@Override
	public List<Board> selectBoardListPart(Map<String, Integer> param) {
		return sqlSession.selectList("board.selectBoardListPart", param);
	}

	@Override
	public int selectAuthority(int mno) {
		return sqlSession.selectOne("board.selectAuthority", mno);
	}
}
