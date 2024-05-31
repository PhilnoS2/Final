package com.kh.goty.customerService.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.customerService.model.repository.QuestionRepository;
import com.kh.goty.customerService.model.vo.Answer;
import com.kh.goty.customerService.model.vo.Question;
import com.kh.goty.customerService.model.vo.QuestionAttach;

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

	@Override
	public int updateQuestion(Question question) {
		return questionRepository.updateQuestion(question);
	}

	@Override
	public int deleteQuestion(int questionNo) {
		return questionRepository.deleteQuestion(questionNo);
	}

	@Override
	public Answer selectAnswer(int questionNo) {
		return questionRepository.selectAnswer(questionNo);
	}

	@Override
	public int searchQuestionListCount(HashMap<String, String> map) {
		return questionRepository.searchQuestionListCount(map);
	}

	@Override
	public List<Question> searchQuestionList(HashMap<String, String> map, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		
		return questionRepository.searchQuestionList(map, rowBounds);
	}

	@Override
	public List<Question> questionSearchList(int category, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		return questionRepository.questionSearchList(category, rowBounds);
	}

	@Override
	public int selectCategoryListCount(int category) {
		return questionRepository.selectCategoryListCount(category);
	}

	@Override
	public QuestionAttach selectQuestionAttach(int questionNo) {
		return questionRepository.selectQuestionAttach(questionNo);
	}

	


}
