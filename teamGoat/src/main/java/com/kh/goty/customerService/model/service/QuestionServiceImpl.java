package com.kh.goty.customerService.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.customerService.model.repository.QuestionRepository;
import com.kh.goty.customerService.model.vo.Question;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QuestionServiceImpl implements QuestionService {

	private final QuestionRepository questionRepository;

	@Override
	public int insertQuestion(HashMap<String, Object> map) {
		return questionRepository.insertQuestion(map);
	}

	@Override
	public int selectQuestionListCount() {
		return questionRepository.selectQuestionListCount();
	}

	@Override
	public List<Question> selectQuestionListAll(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		return questionRepository.selectQuestionListAll(rowBounds);
	}

	@Override
	public Question selectQuestion(int questionNo) {
		return questionRepository.selectQuestion(questionNo);
	}
	
	


}
