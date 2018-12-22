package com.kh.mhm.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.mhm.board.model.vo.Fileref;
import com.kh.mhm.board.model.vo.Board;

public interface BoardDao {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(Board board);

	int insertFileref(Fileref a);

	Board selectOneBoard(int boardNo);

	List<Fileref> selectFilerefList(int boardNo);

	int updateBoard(Board board);

	int updateFileref(Fileref a);

	int deleteBoard(int boardNo);

	int deleteFileref(int boardNo);

	int deleteFile(int attNo);

}
