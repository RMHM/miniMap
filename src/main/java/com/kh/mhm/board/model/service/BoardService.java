package com.kh.mhm.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.mhm.board.model.vo.Fileref;
import com.kh.mhm.board.model.vo.Board;

public interface BoardService {
	
	static int BOARD_SERVICE_ERROR = 0;
	static int BOARD_SERVICE_COMPLETE = 1;

	// btype용
	List<Board> selectBoardList(int bCode);
	
	List<Board> selectBoardList(String keyfield, String keyword);	
	
	List<Board> selectNoticeList(Board board);		

	int selectBoardTotalContents();

	int insertBoard(Board board/*, List<Fileref> attachList*/);

	Board selectOneBoard(int bId);
	
	int updateOneCount(int bId);

	List<Fileref> selectFilerefList(int boardNo);

	int updateBoard(Board board/*, List<Fileref> attachList*/);

	int deleteBoard(int boardNo);

	List<Map<String, String>> selectBoardList2(int cPage, int numPerPage);
	
  int insertImgBoard(Board board);
	
	int insertImgFile(Fileref fref);
	
	String selectThumbnailImg(int bid);
	
	int selectCommentCnt(int bid);
	
	int deleteImg(int bid);
	
	List<String> selectBoardImg(int bid);
	
	int deleteOneImg(String imgName);
	
	int updateImgBoard(Board b);
	
	int selectBoardCnt(int bCode);
	
	List<Board> selectBoardListPart(Map<String, Integer> param);
	
	int selectAuthority(int mno);

}
