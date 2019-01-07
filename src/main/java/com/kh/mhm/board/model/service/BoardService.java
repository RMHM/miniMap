package com.kh.mhm.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.mhm.board.model.vo.Fileref;
import com.kh.mhm.board.model.vo.Board;

public interface BoardService {
	
	static int BOARD_SERVICE_ERROR = 0;
	static int BOARD_SERVICE_COMPLETE = 1;

	// btype용
	/*List<Board> selectBoardList(int bCode);*/
	
	// 1= 자유 2= 정보 3= 질문 4= 후기 게시판 리스트 출력
	
	List<Map<String, String>> selectBoardList1(int cPage, int numPerPage);
	
	List<Board> selectSearchList1(String keyfield, String keyword);	
	
	List<Board> selectNoticeList1(Board board);		

	int selectBoardTotalContents1();
	
	List<Map<String, String>> selectBoardList2(int cPage, int numPerPage);
	
	List<Board> selectSearchList2(String keyfield, String keyword);	
	
	List<Board> selectNoticeList2(Board board);		

	int selectBoardTotalContents2();
	
	List<Map<String, String>> selectBoardList3(int cPage, int numPerPage);
	
	List<Board> selectSearchList3(String keyfield, String keyword);	
	
	List<Board> selectNoticeList3(Board board);		

	int selectBoardTotalContents3();
	
	List<Map<String, String>> selectBoardList4(int cPage, int numPerPage);
	
	List<Board> selectSearchList4(String keyfield, String keyword);	
	
	List<Board> selectNoticeList4(Board board);		

	int selectBoardTotalContents4();
	
	//-------------------------------------//
	

	int insertBoard(Board board);

	Board selectOneBoard(int bId);
	
	int updateOneCount(int bId);

	List<Fileref> selectFilerefList(int boardNo);

	int updateBoard(Board board);

	int deleteBoard(int boardNo);
	
	
	
	
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
