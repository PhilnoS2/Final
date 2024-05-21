package com.kh.goty.board.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goty.board.model.vo.Board;

@Repository
public class BoardRepository {

public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("boardMapper.selectListCount", map);
	}
	
	public List<Board> seleltListAll(SqlSessionTemplate sqlSession, HashMap<String, Object> map , RowBounds rowBounds) {
		return sqlSession.selectList("boardMapper.seleltListAll", map, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("boardMapper.insertBoard", board) ;
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount", boardNo);
	}

	public Board updateBoardForm(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.updateBoardForm", boardNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.update("boardMapper.updateBoard", board);
	}
	
}
