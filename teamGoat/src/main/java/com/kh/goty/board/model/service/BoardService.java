package com.kh.goty.board.model.service;

import java.util.List;

import com.kh.goty.board.model.vo.Board;
import com.kh.goty.common.model.vo.PageInfo;

public interface BoardService {

	public List<Board> selectListAll(PageInfo pageInfo);

	public int selectListCount();

	public int insert(Board board);

}
