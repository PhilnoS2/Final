package com.kh.goty.board.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.goty.board.model.dao.BoardMapper;
import com.kh.goty.board.model.vo.Board;
import com.kh.goty.board.model.vo.Reply;
import com.kh.goty.board.model.vo.Report;
import com.kh.goty.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	/*
	@Autowired
	BoardRepository boardRepository;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	 */
	
	private final BoardMapper boardMapper;


	@Override
	public int selectListCount(HashMap<String, Object> map) {
		return boardMapper.selectListCount(map);
	}

	@Override
	public List<Board> selectListAll(PageInfo pageInfo, HashMap<String, Object> map) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		
		return boardMapper.selectListAll(map, rowBounds);
	}

	@Override
	public int insert(Board board) {
		return boardMapper.insert(board);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return boardMapper.selectBoard(boardNo);
	}

	@Override
	public int increaseCount(int boardNo) {
		return boardMapper.increaseCount(boardNo);
	}

	@Override
	public Board updateBoardForm(int boardNo) {
		return boardMapper.updateBoardForm(boardNo);
	}

	@Override
	public int updateBoard(Board board) {
		return boardMapper.updateBoard(board);
	}

	@Override
	public int save(Reply reply) {
		return boardMapper.save(reply);
	}

	@Override
	public List<Reply> findAllReply(int freeBoardNo, RowBounds rowBounds) {
		return boardMapper.findAllReply(freeBoardNo, rowBounds);
	}

	@Override
	public int replyCount(int boardNo) {
		return boardMapper.replyCount(boardNo);
	}

	@Override
	public int insertReport(Report report) {
		return boardMapper.insertReport(report);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardMapper.deleteBoard(boardNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	/*
	@Override
	public int selectListCount(HashMap<String, Object> map) {
		return boardRepository.selectListCount(sqlSession, map);
	}
	
	@Override
	public List<Board> selectListAll(PageInfo pageInfo, HashMap<String, Object> map) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		
		return boardRepository.seleltListAll(sqlSession, map ,rowBounds);
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
	public Board updateBoardForm(int boardNo) {
		return boardRepository.updateBoardForm(sqlSession, boardNo);
	}

	@Override
	public int updateBoard(Board board) {
		return boardRepository.updateBoard(sqlSession, board);
	}

	@Override
	public int save(Reply reply) {
		return 0;
	}
	*/
}
