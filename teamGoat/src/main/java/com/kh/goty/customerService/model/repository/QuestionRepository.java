package com.kh.goty.customerService.model.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.goty.customerService.model.vo.Notice;
import com.kh.goty.customerService.model.vo.Question;

@Mapper
public interface QuestionRepository {
	int insertQuestion(HashMap<String, Object> map);
	
	int selectQuestionListCount();
	
	List<Question> selectQuestionListAll(RowBounds rowBounds);

	Question selectQuestion(int questionNo);
	
}
