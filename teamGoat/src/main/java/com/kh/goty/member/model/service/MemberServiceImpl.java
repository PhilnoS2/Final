package com.kh.goty.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goty.member.model.dao.MemberRepository;
import com.kh.goty.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Member login(Member member) {
		return memberRepository.login(sqlSession, member);
	}

	@Override
	public int insertMember(Member member) {
		return memberRepository.insertMember(sqlSession, member);
	}

	@Override
	public int idChekc(String checkId) {
		return memberRepository.idCheck(sqlSession, checkId);
	}

	@Override
	public String findId(Member member) {
		return memberRepository.findId(sqlSession, member);
	}

	@Override
	public int phoneCheck(Member memeber) {
		return memberRepository.phoneCheck(sqlSession, memeber);
	}

	@Override
	public int findPwd(Member member) {
		return memberRepository.findPwd(sqlSession, member);
	}

	@Override
	public int updatePwd(Member member) {
		return memberRepository.updatePwd(sqlSession, member);
	}

	@Override
	public int emailCheck(String checkEmail) {
		return memberRepository.emailCheck(sqlSession, checkEmail);
	}
	
}
