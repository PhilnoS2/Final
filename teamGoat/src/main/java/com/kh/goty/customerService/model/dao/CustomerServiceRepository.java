package com.kh.goty.customerService.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goty.customerService.model.vo.Notice;

@Repository
public class CustomerServiceRepository {

	public int noticeInsert(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.insert("noticeMapper.noticeInsert", notice);
	}
	
	
}
