package com.kh.goty.customerService.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.customerService.model.vo.Answer;
import com.kh.goty.customerService.model.vo.Faq;
import com.kh.goty.customerService.model.vo.Question;
import com.kh.goty.customerService.model.vo.QuestionAttach;


public interface QuestionService {
	int insertQuestion(HashMap<String, Object> map);
	
	int selectQuestionListCount();
	
	Question selectQuestion(int questionNo);
	
	List<Question> selectQuestionListAll(PageInfo pageInfo);
	
	int updateQuestion(Question question);
	
	int deleteQuestion(int questionNo);
	
	Answer selectAnswer(int questionNo);
	
	int searchQuestionListCount(HashMap<String, String> map);
	
	List<Question> searchQuestionList(HashMap<String, String> map, PageInfo pageInfo);
	
	int selectCategoryListCount(int category);
	
	List<Question> questionSearchList(int category, PageInfo pageInfo);
	
	QuestionAttach selectQuestionAttach(int questionNo);
	
	
	
}
