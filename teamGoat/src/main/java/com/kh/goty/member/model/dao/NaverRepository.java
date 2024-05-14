package com.kh.goty.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goty.member.model.vo.NaverMember;

@Repository
public class NaverRepository {
	
	public int checkNaverId(SqlSessionTemplate sqlSession, NaverMember nm) {
		return sqlSession.selectOne("memberMapper.checkNaverId", nm);
	}
	
	public int insertNaver(SqlSessionTemplate sqlSession, NaverMember nm) {
		return sqlSession.insert("memberMapper.insertNaver", nm);
	}
	
	
}
