package com.kh.goty.customerService.model.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.goty.customerService.model.vo.Question;
import com.kh.goty.customerService.model.vo.QuestionAttach;

@Mapper
public interface QuestionRepository {
	int insertQuestion(HashMap<String, Object> map);
	
	int selectQuestionListCount();
	
	List<Question> selectQuestionListAll(RowBounds rowBounds);

	Question selectQuestion(int questionNo);
	
	int updateQuestion(Question question);
	
	int deleteQuestion(int questionNo);
	
	Question selectAnswer(int questionNo);
	
	int searchQuestionListCount(HashMap<String, String> map);
	
	List<Question> searchQuestionList(HashMap<String, String> map, RowBounds rowBounds);
	
	int selectCategoryListCount(int category);
	
	List<Question> questionSearchList(int category, RowBounds rowBounds);
	
	QuestionAttach selectQuestionAttach(int questionNo);
}
