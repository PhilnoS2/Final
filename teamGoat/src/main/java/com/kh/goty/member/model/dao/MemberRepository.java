package com.kh.goty.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goty.member.model.vo.Member;

@Repository
public class MemberRepository {
	
	public Member login(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.login", member);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
}
