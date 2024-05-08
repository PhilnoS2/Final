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
	
}
