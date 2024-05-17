package com.kh.goty.customerService.model.service;

import org.springframework.stereotype.Service;

import com.kh.goty.customerService.model.vo.Notice;

public interface CustomerService {

	
	// 공지사항
	int noticeInsert(Notice notice);
}
