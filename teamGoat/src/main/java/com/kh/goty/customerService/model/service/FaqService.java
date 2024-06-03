package com.kh.goty.customerService.model.service;

import java.util.List;

import com.kh.goty.customerService.model.vo.Faq;
import com.kh.goty.customerService.model.vo.QuestionCategory;

public interface FaqService {

	// 카테고리 조회
	List<QuestionCategory> selectCategoryList();
	
	// FAQ 생성
	int insertFaq(Faq faq);
	
	// FAQ 전체 리스트 조회
	List<Faq> selectFaqList();
	
	// FAQ 카테고리별 리스트 조회
	List<Faq> faqSearchList(int category);
	
	List<Faq> selectMainPageFaqList();
}
