package com.kh.goty.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
import com.kh.goty.review.model.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("metacritic.main")
	public ModelAndView startMetacritic(ModelAndView mv) {
		
		String nintendo = "Nintendo Switch";
		String playstation = "PlayStation";
		String xbox = "XBox";
		
		PageInfo pi = Pagination.getPageInfo(reviewService.findGameCount(),
											 1,
											 4,
											 5);
		
		System.out.println(reviewService.findAllGames(pi));
		
		
		mv.setViewName("review/reviewMain");
		
		return mv;
	}
}
