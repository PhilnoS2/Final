package com.kh.goty.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goty.board.model.vo.Board;

@Repository
public class BoardRepository {

public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public List<Board> seleltListAll(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return sqlSession.selectList("boardMapper.seleltListAll", null, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("boardMapper.insertBoard", board) ;
	}
	
	
}