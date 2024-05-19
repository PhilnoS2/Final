package com.kh.goty.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goty.member.model.vo.Member;

@Repository
public class KakaoRepository {
	
	public int checkKakaoId(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.checksocialId", memberId);
	}

	public Member loginKakao(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.loginKakao", memberId);
	}
	
}
