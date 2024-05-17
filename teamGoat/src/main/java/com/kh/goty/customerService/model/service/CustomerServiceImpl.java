package com.kh.goty.customerService.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goty.customerService.model.dao.CustomerServiceRepository;
import com.kh.goty.customerService.model.vo.Notice;

@Service
public class CustomerServiceImpl implements CustomerService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CustomerServiceRepository customerServiceRepository;
	
	@Override
	public int noticeInsert(Notice notice) {
		
		return customerServiceRepository.noticeInsert(sqlSession, notice);
	}

	
	
	
	
}
