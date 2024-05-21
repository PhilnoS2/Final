package com.kh.goty.board.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.goty.board.model.vo.Board;
import com.kh.goty.common.model.vo.PageInfo;

public interface BoardService {

	public List<Board> selectListAll(PageInfo pageInfo, HashMap<String, Object> map);

	public int selectListCount(HashMap<String, Object> map);

	public int insert(Board board);

	public Board selectBoard(int boardNo);

	public int increaseCount(int boardNo);

	public Board updateBoardForm(int boardNo);

	public int updateBoard(Board board);
	

}
