package com.kh.goty.customerService.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goty.customerService.model.vo.Notice;
import com.kh.goty.customerService.model.vo.QuestionCategory;

@Repository
public class CustomerServiceRepository {

	public int noticeInsert(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.insert("noticeMapper.noticeInsert", notice);
	}
	
	public int selectNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectNoticeListCount");
	}
	
	public List<Notice> selectNoticeListAll(SqlSessionTemplate sqlSession, RowBounds rowBounds){
		
		return sqlSession.selectList("noticeMapper.selectNoticeListAll", null, rowBounds);
	}
	
	public List<QuestionCategory> selectCategoryList(SqlSessionTemplate sqlSession){
		return sqlSession.selectList("faqMapper.selectCategoryList");
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	public int increaseNoticeCount(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.increaseNoticeCount", noticeNo);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.update("noticeMapper.updateNotice", notice);
	}
}
