package com.kh.goty.board.model.service;

import java.util.List;

import com.kh.goty.board.model.vo.Board;
import com.kh.goty.common.model.vo.PageInfo;

public interface BoardService {

	public List<Board> selectListAll(PageInfo pageInfo, int categoryNo);

	public int selectListCount(int categoryNo);

	public int insert(Board board);

	public Board selectBoard(int boardNo);

	public int increaseCount(int boardNo);

}
