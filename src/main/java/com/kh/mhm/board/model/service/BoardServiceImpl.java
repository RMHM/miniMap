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
	public List<Board> selectBoardList(int bCode) {
		List<Board> list = null;
        list = boardDao.selectBoardList(bCode);
        return list;
	}
	
	@Override
	public List<Board> selectBoardList(Board board) {
		List<Board> list = null;
        list = boardDao.selectBoardList(board);
        return list;
	}
	
	@Override
	public List<Board> selectNoticeList(Board board) {
		List<Board> list = null;
        list = boardDao.selectNoticeList(board);
        return list;
	}
	
	@Override
	public int selectBoardTotalContents() {
		
		return boardDao.selectBoardTotalContents();
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
	public int deleteFile(int attNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, String>> selectBoardList2(int cPage, int numPerPage) {
		
		return boardDao.selectBoardList2(cPage, numPerPage);
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

}
