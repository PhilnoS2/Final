package com.kh.goty.customerService.model.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.goty.customerService.model.repository.QuestionRepository;
import com.kh.goty.customerService.model.vo.Question;
import com.kh.goty.customerService.model.vo.QuestionAttach;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QuestionServiceImpl implements QuestionService {

	private final QuestionRepository questionRepository;
	
	
	@Override
	@Transactional
	public int insertQuestion(Question question, QuestionAttach questionAttach) {
	
		
		if(questionAttach != null) {
			questionRepository.insertQuestion(question);
			System.out.println(question.getQuestionNo());
			new QuestionAttach().setQuestionNo(question.getQuestionNo());
			questionRepository.insertFile(questionAttach);
		}
		
		return 1;
	}


}
