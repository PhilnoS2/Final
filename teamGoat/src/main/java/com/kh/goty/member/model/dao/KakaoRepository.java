package com.kh.goty.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goty.member.model.vo.KakaoMember;

@Repository
public class KakaoRepository {
	
	public int checkKakaoId(SqlSessionTemplate sqlSession, KakaoMember km) {
		return sqlSession.selectOne("memberMapper.checkKakaoId", km);
	}
	
	public int insertKakao(SqlSessionTemplate sqlSession, KakaoMember km) {
		return sqlSession.insert("memberMapper.insertKakao", km);
	}
	
}
