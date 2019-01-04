package com.kh.mhm.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.mhm.board.model.vo.Fileref;
import com.kh.mhm.board.model.vo.Board;

public interface BoardDao {

	List<Board> selectBoardList(int bCode);
	
	List<Board> selectBoardList(Board board);
	
	List<Board> selectNoticeList(Board board);

	int selectBoardTotalContents();

	int insertBoard(Board board);

	int insertFileref(Fileref a);
	
	int updateOneCount(int bId);

	Board selectOneBoard(int bId);

	List<Fileref> selectFilerefList(int boardNo);

	int updateBoard(Board board);

	int updateFileref(Fileref a);

	int deleteBoard(int boardNo);

	int deleteFileref(int boardNo);

	int deleteFile(int attNo);

	List<Map<String, String>> selectBoardList2(int cPage, int numPerPage);

  int insertImgBoard(Board board);
	
	int insertImgFile(Fileref fref);
	
	String selectThumbnailImg(int bid);
	
	int selectCommentCnt(int bid);
}
