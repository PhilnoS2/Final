package com.kh.goty.board.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.goty.board.model.vo.Board;
import com.kh.goty.board.model.vo.Reply;
import com.kh.goty.board.model.vo.Report;
import com.kh.goty.common.model.vo.PageInfo;

public interface BoardService {

	public List<Board> selectListAll(PageInfo pageInfo, HashMap<String, Object> map);

	public int selectListCount(HashMap<String, Object> map);

	public int insert(Board board);

	public Board selectBoard(int boardNo);

	public int increaseCount(int boardNo);

	public Board updateBoardForm(int boardNo);

	public int updateBoard(Board board);

	public int save(Reply reply);

	public List<Reply> findAllReply(int freeBoardNo, RowBounds rowBounds);

	public int replyCount(int boardNo);

	public int insertReport(Report report);

	public int deleteBoard(int boardNo);
	

}
