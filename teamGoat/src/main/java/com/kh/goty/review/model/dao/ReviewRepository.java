package com.kh.goty.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.goty.review.model.vo.Review;

@Repository
public class ReviewRepository {

	public int findGameCount(SqlSession sqlSession) {
		return sqlSession.selectOne("reviewMapper.findGameCount");
	}
	
	public List<Review> findAllGames(SqlSession sqlSession, RowBounds rowBounds){
		return sqlSession.selectList("reviewMapper.findAllGames", null, rowBounds);
	}
}
