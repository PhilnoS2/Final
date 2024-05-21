package com.kh.goty.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.review.model.dao.ReviewRepository;
import com.kh.goty.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ReviewRepository reviewRepository;

	@Override
	public int findGameCount() {
		return reviewRepository.findGameCount(sqlSession);
	}
	
	@Override
	public List<Review> findAllGames(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset ,pi.getBoardLimit());
		
		return reviewRepository.findAllGames(sqlSession, rowBounds);
	}


}
