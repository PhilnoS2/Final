package com.kh.goty.customerService.model.service;

import java.util.List;

import com.kh.goty.customerService.model.vo.Notice;
import com.kh.goty.customerService.model.vo.QuestionCategory;

public interface CustomerService {

	
	// 공지사항
	int noticeInsert(Notice notice);
	
	List<QuestionCategory> selectCategoryList();
}
