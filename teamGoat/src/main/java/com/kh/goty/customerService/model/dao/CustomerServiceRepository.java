package com.kh.goty.customerService.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goty.customerService.model.vo.Notice;
import com.kh.goty.customerService.model.vo.QuestionCategory;

@Repository
public class CustomerServiceRepository {

	public int noticeInsert(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.insert("noticeMapper.noticeInsert", notice);
	}
	
	public List<QuestionCategory> selectCategoryList(SqlSessionTemplate sqlSession){
		return sqlSession.selectList("faqMapper.selectCategoryList");
	}
}
