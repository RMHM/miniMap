package com.kh.mhm.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.mhm.board.model.vo.Fileref;
import com.kh.mhm.board.model.vo.Board;

public interface BoardService {

	List<Board> selectBoardList(Board board);	
	
	List<Board> selectNoticeList(Board board);		

	int selectBoardTotalContents();

	int insertBoard(Board board, List<Fileref> attachList);

	Board selectOneBoard(int bId);
	
	int updateOneCount(int bId);

	List<Fileref> selectFilerefList(int boardNo);

	int updateBoard(Board board, List<Fileref> attachList);

	int deleteBoard(int boardNo);

	int deleteFile(int attNo);

}
