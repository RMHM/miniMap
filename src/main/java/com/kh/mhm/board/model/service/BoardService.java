package com.kh.mhm.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.mhm.board.model.vo.Fileref;
import com.kh.mhm.board.model.vo.Board;

public interface BoardService {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(Board board, List<Fileref> attachList);

	Board selectOneBoard(int boardNo);

	List<Fileref> selectFilerefList(int boardNo);

	int updateBoard(Board board, List<Fileref> attachList);

	int deleteBoard(int boardNo);

	int deleteFile(int attNo);

}
