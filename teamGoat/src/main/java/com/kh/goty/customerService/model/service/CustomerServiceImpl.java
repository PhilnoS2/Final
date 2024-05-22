package com.kh.goty.customerService.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.customerService.model.dao.CustomerServiceRepository;
import com.kh.goty.customerService.model.vo.Faq;
import com.kh.goty.customerService.model.vo.Notice;
import com.kh.goty.customerService.model.vo.QuestionCategory;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomerServiceImpl implements CustomerService {

	
	private final SqlSessionTemplate sqlSession;
	
	private final CustomerServiceRepository customerServiceRepository;
	
	public final int noticeInsert(Notice notice) {
		
		return customerServiceRepository.noticeInsert(sqlSession, notice);
	}

	@Override
	public List<QuestionCategory> selectCategoryList() {

		return customerServiceRepository.selectCategoryList(sqlSession);
	}

	@Override
	public int selectNoticeListCount() {
		return customerServiceRepository.selectNoticeListCount(sqlSession);
	}

	@Override
	public List<Notice> selectNoticeListAll(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		
		return customerServiceRepository.selectNoticeListAll(sqlSession, rowBounds);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return customerServiceRepository.selectNotice(sqlSession, noticeNo);
	}

	@Override
	public int increaseNoticeCount(int noticeNo) {
		return customerServiceRepository.increaseNoticeCount(sqlSession, noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return customerServiceRepository.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	public int updateNotice(Notice notice) {
		return customerServiceRepository.updateNotice(sqlSession, notice);
	}

	@Override
	public List<Notice> noticeSearchList(HashMap<String, String> map, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		
		return customerServiceRepository.noticeSearchList(sqlSession, map, rowBounds);
	}

	@Override
	public int insertFaq(Faq faq) {
		return customerServiceRepository.insertFaq(sqlSession, faq);
	}

	@Override
	public List<Faq> selectFaqList() {
		return customerServiceRepository.selectFaqList(sqlSession);
	}

	@Override
	public List<Faq> faqSearchList(int category) {
		return customerServiceRepository.faqSearchList(sqlSession, category);
	}
}
