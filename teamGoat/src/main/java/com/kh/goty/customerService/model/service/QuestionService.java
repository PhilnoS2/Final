package com.kh.goty.customerService.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.customerService.model.vo.Question;


public interface QuestionService {
	int insertQuestion(HashMap<String, Object> map);
	
	int selectQuestionListCount();
	
	Question selectQuestion(int questionNo);
	
	List<Question> selectQuestionListAll(PageInfo pageInfo);
	
	int updateQuestion(Question question);
	
	int deleteQuestion(int questionNo);
	
	Question selectAnswer(int questionNo);
	
}
