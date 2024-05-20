package com.kh.goty.customerService.model.service;

import java.util.List;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.customerService.model.vo.Notice;
import com.kh.goty.customerService.model.vo.QuestionCategory;

public interface CustomerService {

	
	// 공지사항
	int noticeInsert(Notice notice);
	
	// 공지사항 리스트 조회
	int selectNoticeListCount();
	
	List<Notice> selectNoticeListAll(PageInfo pageInfo);
	
	List<QuestionCategory> selectCategoryList();
}
