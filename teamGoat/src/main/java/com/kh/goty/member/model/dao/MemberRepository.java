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
	
	public String findId(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.findId", member);
	}
	
	public int phoneCheck(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.phoneCheck", member);
	}
	
	public int findPwd(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.findPwd", member);
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updatePwd", member);
	}

	public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		return sqlSession.selectOne("memberMapper.emailCheck", checkEmail);
	}

	public int changePwd(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.changePwd", member);
	}
	
	public int phoneCheck(SqlSessionTemplate sqlSession, String checkPhone) {
		return sqlSession.selectOne("memberMapper.phoneCheck", checkPhone);
	}
	
	public Member findUpdateMember(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("memberMapper.findUpdateMember", memberNo);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMember", member);
	}
	
	
}
