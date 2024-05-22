package com.kh.goty.customerService.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.goty.customerService.model.repository.FaqRepository;
import com.kh.goty.customerService.model.vo.Faq;
import com.kh.goty.customerService.model.vo.QuestionCategory;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FaqServiceImpl implements FaqService {
	
	private final FaqRepository faqRepository;
	
	@Override
	public int insertFaq(Faq faq) {
		return faqRepository.insertFaq(faq);
	}

	@Override
	public List<Faq> selectFaqList() {
		return faqRepository.selectFaqList();
	}

	@Override
	public List<Faq> faqSearchList(int category) {
		return faqRepository.faqSearchList(category);
	}

	@Override
	public List<QuestionCategory> selectCategoryList() {
		return faqRepository.selectCategoryList();
	}
	
}
