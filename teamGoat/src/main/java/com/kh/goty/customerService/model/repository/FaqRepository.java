package com.kh.goty.customerService.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.goty.customerService.model.vo.Faq;
import com.kh.goty.customerService.model.vo.QuestionCategory;

@Mapper
public interface FaqRepository {

	int insertFaq(Faq faq);

	List<Faq> selectFaqList();

	List<Faq> faqSearchList(int category);
	
	List<QuestionCategory> selectCategoryList();

	List<Faq> selectMainPageFaqList();
}
