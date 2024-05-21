package com.kh.goty.review.model.service;

import java.util.List;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.review.model.vo.Review;

public interface ReviewService {

	int findGameCount();
	
	List<Review> findAllGames(PageInfo pi);
	
	
}
