package com.kh.goty.customerService.model.service;

import java.util.List;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.customerService.model.vo.Notice;
import com.kh.goty.customerService.model.vo.QuestionCategory;

public interface CustomerService {

	
	// 공지사항 작성
	int noticeInsert(Notice notice);
	
	// 공지사항 리스트 조회
	int selectNoticeListCount();
	
	// 공지사항 조회수 증가
	int increaseNoticeCount(int noticeNo);
	
	// 공지사항 삭제
	int deleteNotice(int noticeNo);
	
	// 공지사항 업데이트
	int updateNotice(Notice notice);
	
	// 공지사항 상세 조회
	Notice selectNotice(int noticeNo);
	
	
	List<Notice> selectNoticeListAll(PageInfo pageInfo);
	
	List<QuestionCategory> selectCategoryList();
}
