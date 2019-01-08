package com.kh.mhm.board.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mhm.board.model.vo.Board;
import com.kh.mhm.board.model.vo.Fileref;
import com.kh.mhm.board.model.dao.BoardDao;
import com.kh.mhm.board.model.service.BoardServiceImpl;

@Service
public class BoardServiceImpl implements BoardService {
	
	Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	BoardDao boardDao;

	@Override
	public List<Map<String, String>> selectBoardList1(int cPage, int numPerPage) {		
		return boardDao.selectBoardList1(cPage, numPerPage);
	}	
	@Override
	public List<Board> selectSearchList1(String keyfield, String keyword) {
		List<Board> list = null;
        list = boardDao.selectSearchList1(keyfield, keyword);
        return list;
	}
	@Override
	public List<Board> selectNoticeList1(Board board) {
		List<Board> list = null;
        list = boardDao.selectNoticeList1(board);
        return list;
	}	
	@Override
	public int selectBoardTotalContents1() {		
		return boardDao.selectBoardTotalContents1();
	}
	
	@Override
	public List<Map<String, String>> selectBoardList2(int cPage, int numPerPage) {		
		return boardDao.selectBoardList2(cPage, numPerPage);
	}	
	@Override
	public List<Board> selectSearchList2(String keyfield, String keyword) {
		List<Board> list = null;
        list = boardDao.selectSearchList2(keyfield, keyword);
        return list;
	}
	@Override
	public List<Board> selectNoticeList2(Board board) {
		List<Board> list = null;
        list = boardDao.selectNoticeList2(board);
        return list;
	}	
	@Override
	public int selectBoardTotalContents2() {		
		return boardDao.selectBoardTotalContents2();
	}
	
	@Override
	public List<Map<String, String>> selectBoardList3(int cPage, int numPerPage) {		
		return boardDao.selectBoardList3(cPage, numPerPage);
	}	
	@Override
	public List<Board> selectSearchList3(String keyfield, String keyword) {
		List<Board> list = null;
        list = boardDao.selectSearchList3(keyfield, keyword);
        return list;
	}
	@Override
	public List<Board> selectNoticeList3(Board board) {
		List<Board> list = null;
        list = boardDao.selectNoticeList3(board);
        return list;
	}	
	@Override
	public int selectBoardTotalContents3() {		
		return boardDao.selectBoardTotalContents3();
	}
	@Override
	public List<Map<String, String>> selectBoardList4(int cPage, int numPerPage) {		
		return boardDao.selectBoardList4(cPage, numPerPage);
	}	
	@Override
	public List<Board> selectSearchList4(String keyfield, String keyword) {
		List<Board> list = null;
        list = boardDao.selectSearchList4(keyfield, keyword);
        return list;
	}
	@Override
	public List<Board> selectNoticeList4(Board board) {
		List<Board> list = null;
        list = boardDao.selectNoticeList4(board);
        return list;
	}	
	@Override
	public int selectBoardTotalContents4() {		
		return boardDao.selectBoardTotalContents4();
	}
	
	

	@Override
	public int insertBoard(Board board/*, List<Fileref> attachList*/) {
		// TODO Auto-generated method stub
		return boardDao.insertBoard(board);
		
	}

	@Override
	public Board selectOneBoard(int BId) {
		
		return boardDao.selectOneBoard(BId);
	}
	
	@Override
	public int updateOneCount(int BId) {
		// TODO Auto-generated method stub
		return boardDao.updateOneCount(BId);
	}

	@Override
	public List<Fileref> selectFilerefList(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(Board board/*, List<Fileref> attachList*/) {
		int result = 0;
		
		result = boardDao.updateBoard(board);
		
		return result;
	}

	@Override
	public int deleteBoard(int BId) {
		// TODO Auto-generated method stub
		return boardDao.deleteBoard(BId);
	}

	

	@Override
	public int insertImgBoard(Board board) {
		return boardDao.insertImgBoard(board);
	}

	@Override
	public int insertImgFile(Fileref fref) {
		return boardDao.insertImgFile(fref);
	}

	@Override
	public String selectThumbnailImg(int bid) {
		return boardDao.selectThumbnailImg(bid);
	}

	@Override
	public int selectCommentCnt(int bid) {
		return boardDao.selectCommentCnt(bid);
	}

	@Override
	public int deleteImg(int bid) {
		return boardDao.deleteImg(bid);
	}

	@Override
	public List<String> selectBoardImg(int bid) {
		return boardDao.selectBoardImg(bid);
	}

	@Override
	public int deleteOneImg(String imgName) {
		return boardDao.deleteOneImg(imgName);
	}

	@Override
	public int updateImgBoard(Board b) {
		return boardDao.updateImgBoard(b);
	}

	@Override
	public int selectBoardCnt(int bCode) {
		return boardDao.selectBoardCnt(bCode);
	}

	@Override
	public List<Board> selectBoardListPart(Map<String, Integer> param) {
		return boardDao.selectBoardListPart(param);
	}

	@Override
	public int selectAuthority(int mno) {
		return boardDao.selectAuthority(mno);
	}
}
