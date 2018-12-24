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
	public int insertBoard(Board board, List<Fileref> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board selectOneBoard(int bId) {
		
		return boardDao.selectOneBoard(bId);
	}
	
	@Override
	public int updateOneCount(int bId) {
		// TODO Auto-generated method stub
		return boardDao.updateOneCount(bId);
	}

	@Override
	public List<Fileref> selectFilerefList(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(Board board, List<Fileref> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFile(int attNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	

	

}
