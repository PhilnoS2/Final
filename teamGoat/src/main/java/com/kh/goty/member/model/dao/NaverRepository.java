package com.kh.goty.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goty.member.model.vo.Member;

@Repository
public class NaverRepository {
	
	public int checkNaverId(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.checksocialId", memberId);
	}

	public Member loginNaver(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.loginNaver", memberId);
	}
}
