package com.kh.goty.customerService.model.service;

import com.kh.goty.customerService.model.vo.Question;
import com.kh.goty.customerService.model.vo.QuestionAttach;

public interface QuestionService {

	
	int insertQuestion(Question question, QuestionAttach questionAttach);

	
}
