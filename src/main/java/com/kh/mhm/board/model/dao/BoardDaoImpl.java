package com.kh.mhm.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mhm.board.model.vo.Board;
import com.kh.mhm.board.model.vo.Fileref;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	SqlSessionFactory sqlMapper;	   

	/*@Override
	public List<Board> selectBoardList(int bCode) {
		
        return sqlSession.selectList("board.selectBoardListToBtype", bCode);
		
	}*/
	
	@Override
	public List<Board> selectBoardList1(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);	
		return sqlSession.selectList("board.selectBoardList1",null,rowBounds);
	}
	
	@Override
	public List<Board> selectSearchList1(String keyfield, String keyword) {
		List<Board> list = null;		
		SqlSession session = sqlMapper.openSession();		      
        if(keyfield != null && keyword != null && keyfield !="" && keyword !=""){
            Map<String, String> map = new HashMap<String, String> ();
            map.put("keyfield" , keyfield);
            map.put("keyword", keyword);
            list = session.selectList("board.selectSearchList1", map);
            session.close();
            return list;
        }else {
            list = session.selectList("board.selectBoardList1");
            session.close();
            return list;
        }		        
	}
	
	@Override
	public List<Board> selectNoticeList1(Board board) {		
		return sqlSession.selectList("board.selectNoticeList1");
	}
	
	@Override
	public List<Board> selectBestList1(Board board) {
		return sqlSession.selectList("board.selectBestList1");
	}
	
	@Override
	public int selectBoardTotalContents1() {
		return sqlSession.selectOne("board.selectBoardTotalContents1");
	}
	
	@Override
	public List<Board> selectBoardList2(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);	
		return sqlSession.selectList("board.selectBoardList2",null,rowBounds);
	}
	
	@Override
	public List<Board> selectSearchList2(String keyfield, String keyword) {
		List<Board> list = null;		
		SqlSession session = sqlMapper.openSession();		      
        if(keyfield != null && keyword != null && keyfield !="" && keyword !=""){
            Map<String, String> map = new HashMap<String, String> ();
            map.put("keyfield" , keyfield);
            map.put("keyword", keyword);
            list = session.selectList("board.selectSearchList2", map);
            session.close();
            return list;
        }else {
            list = session.selectList("board.selectBoardList2");
            session.close();
            return list;
        }		        
	}
	
	@Override
	public List<Board> selectNoticeList2(Board board) {		
		return sqlSession.selectList("board.selectNoticeList2");
	}
	
	@Override
	public List<Board> selectBestList2(Board board) {
		return sqlSession.selectList("board.selectBestList2");
	}
	
	@Override
	public int selectBoardTotalContents2() {
		return sqlSession.selectOne("board.selectBoardTotalContents2");
	}
	
	
	@Override
	public List<Board> selectBoardList3(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);	
		return sqlSession.selectList("board.selectBoardList3",null,rowBounds);
	}
	
	@Override
	public List<Board> selectSearchList3(String keyfield, String keyword) {
		List<Board> list = null;		
		SqlSession session = sqlMapper.openSession();		      
        if(keyfield != null && keyword != null && keyfield !="" && keyword !=""){
            Map<String, String> map = new HashMap<String, String> ();
            map.put("keyfield" , keyfield);
            map.put("keyword", keyword);
            list = session.selectList("board.selectSearchList3", map);
            session.close();
            return list;
        }else {
            list = session.selectList("board.selectBoardList3");
            session.close();
            return list;
        }		        
	}
	
	@Override
	public List<Board> selectNoticeList3(Board board) {		
		return sqlSession.selectList("board.selectNoticeList3");
	}
	
	@Override
	public List<Board> selectBestList3(Board board) {
		return sqlSession.selectList("board.selectBestList3");
	}
	
	@Override
	public int selectBoardTotalContents3() {
		return sqlSession.selectOne("board.selectBoardTotalContents3");
	}
	
	@Override
	public List<Board> selectBoardList4(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);	
		return sqlSession.selectList("board.selectBoardList4",null,rowBounds);
	}
	
	@Override
	public List<Board> selectSearchList4(String keyfield, String keyword) {
		List<Board> list = null;		
		SqlSession session = sqlMapper.openSession();		      
        if(keyfield != null && keyword != null && keyfield !="" && keyword !=""){
            Map<String, String> map = new HashMap<String, String> ();
            map.put("keyfield" , keyfield);
            map.put("keyword", keyword);
            list = session.selectList("board.selectSearchList4", map);
            session.close();
            return list;
        }else {
            list = session.selectList("board.selectBoardList4");
            session.close();
            return list;
        }		        
	}
	
	@Override
	public List<Board> selectNoticeList4(Board board) {		
		return sqlSession.selectList("board.selectNoticeList4");
	}
	
	@Override
	public List<Board> selectBestList4(Board board) {
		return sqlSession.selectList("board.selectBestList4");
	}
	
	@Override
	public int selectBoardTotalContents4() {
		return sqlSession.selectOne("board.selectBoardTotalContents4");
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
	public int updateLikes(int BId) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.updateLikes",BId);
	}

	
	@Override
	public int updateBlindOff(int BId) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.updateBlindOff", BId);
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
	public int selectBoardCnt(Map<String, Object> param) {
		return sqlSession.selectOne("board.selectBoardCnt", param);
	}

	@Override
	public List<Board> selectBoardListPart(Map<String, Object> param) {
		return sqlSession.selectList("board.selectBoardListPart", param);
	}

	@Override
	public int selectAuthority(int mno) {
		return sqlSession.selectOne("board.selectAuthority", mno);
	}

	@Override
	public List<Board> selectRecentBoard(Map<String, Integer> param) {
		return sqlSession.selectList("board.selectRecentBoard", param);
	}

	@Override
	public String selectBoardMemberType(int mno) {
		return sqlSession.selectOne("board.selectBoardMemberType", mno);
	}

}
