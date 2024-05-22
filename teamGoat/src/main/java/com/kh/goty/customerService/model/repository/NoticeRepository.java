package com.kh.goty.customerService.model.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.customerService.model.vo.Notice;

@Mapper
public interface NoticeRepository {

	int noticeInsert(Notice notice);

	int selectNoticeListCount();

	int increaseNoticeCount(int noticeNo);

	int deleteNotice(int noticeNo);

	int updateNotice(Notice notice);

	Notice selectNotice(int noticeNo);

	List<Notice> selectNoticeListAll(RowBounds rowbounds);
	
	int selectSearchNoticeListCount(HashMap<String, String> map);

	List<Notice> noticeSearchList(HashMap<String, String> map, RowBounds rowBounds);
}
