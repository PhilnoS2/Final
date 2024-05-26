package com.kh.goty.board.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.goty.board.model.vo.Board;
import com.kh.goty.board.model.vo.Reply;

@Mapper
public interface BoardMapper {

	List<Board> selectListAll(HashMap<String, Object> map, RowBounds rowBounds);

	int selectListCount(HashMap<String, Object> map);

	int insert(Board board);

	Board selectBoard(int boardNo);

	int increaseCount(int boardNo);

	Board updateBoardForm(int boardNo);

	int updateBoard(Board board);

	int save(Reply reply);

	List<Reply> findAllReply(int freeBoardNo, RowBounds rowBounds);

	int replyCount(int boardNo);

}
