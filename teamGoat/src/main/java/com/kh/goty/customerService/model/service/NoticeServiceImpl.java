package com.kh.goty.customerService.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.customerService.model.repository.NoticeRepository;
import com.kh.goty.customerService.model.vo.Notice;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	
	private final NoticeRepository noticeRepository;
	
	@Override
	public int noticeInsert(Notice notice) {
		return noticeRepository.noticeInsert(notice);
	}

	@Override
	public int selectNoticeListCount() {
		return noticeRepository.selectNoticeListCount();
	}

	@Override
	public int increaseNoticeCount(int noticeNo) {
		return noticeRepository.increaseNoticeCount(noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return noticeRepository.deleteNotice(noticeNo);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeRepository.updateNotice(notice);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return noticeRepository.selectNotice(noticeNo);
	}

	@Override
	public List<Notice> selectNoticeListAll(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		
		return noticeRepository.selectNoticeListAll(rowBounds);
	}
	@Override
	public int selectSearchNoticeListCount(HashMap<String, String> map) {
		return noticeRepository.selectSearchNoticeListCount(map);
	}

	@Override
	public List<Notice> noticeSearchList(HashMap<String, String> map, PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		
		return noticeRepository.noticeSearchList(map, rowBounds);
	}


	
	
}
