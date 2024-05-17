package com.kh.goty.board.model.service;

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
	public int selectListCount() {
		return boardRepository.selectListCount(sqlSession);
	}
	
	@Override
	public List<Board> selectListAll(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		
		return boardRepository.seleltListAll(sqlSession, rowBounds);
	}


}
