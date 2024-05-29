package com.kh.goty.customerService.model.repository;

import org.apache.ibatis.annotations.Mapper;

import com.kh.goty.customerService.model.vo.Question;
import com.kh.goty.customerService.model.vo.QuestionAttach;

@Mapper
public interface QuestionRepository {

	int insertQuestion(Question question);
	int insertFile(QuestionAttach questionAttach);
	
}
