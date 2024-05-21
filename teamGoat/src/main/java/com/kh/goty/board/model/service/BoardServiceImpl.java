package com.kh.goty.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goty.board.model.dao.BoardRepository;
import com.kh.goty.board.model.vo.Board;
import com.kh.goty.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardRepository boardRepository;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	@Override
	public int selectListCount(int categoryNo) {
		return boardRepository.selectListCount(sqlSession, categoryNo);
	}
	
	@Override
	public List<Board> selectListAll(PageInfo pageInfo, int categoryNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		
		return boardRepository.seleltListAll(sqlSession, categoryNo ,rowBounds);
	}

	@Override
	public int insert(Board board) {
		return boardRepository.insertBoard(sqlSession, board);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return boardRepository.selectBoard(sqlSession, boardNo);
	}

	@Override
	public int increaseCount(int boardNo) {
		return boardRepository.increaseCount(sqlSession, boardNo);
	}

	@Override
	public List<Board> searchBoards(PageInfo pageInfo, HashMap<String, String> map) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		
		return boardRepository.searchBoards(sqlSession, map, rowBounds);
	}


}
