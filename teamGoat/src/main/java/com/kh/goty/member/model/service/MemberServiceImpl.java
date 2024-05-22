package com.kh.goty.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.goty.member.model.dao.MemberMapper;
import com.kh.goty.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper memberMapper;

	@Override
	public Member login(Member member) {
		return memberMapper.login(member);
	}

	@Override
	public int insertMember(Member member) {
		return memberMapper.insertMember(member);
	}

	@Override
	public int idCheck(String checkId) {
		return memberMapper.idCheck(checkId);
	}

	@Override
	public int emailCheck(String checkEmail) {
		return memberMapper.emailCheck(checkEmail);
	}

	@Override
	public int phoneCheck(String checkPhone) {
		return memberMapper.phoneCheck(checkPhone);
	}

	@Override
	public String findId(Member member) {
		return memberMapper.findId(member);
	}

	@Override
	public int phoneCheck(Member member) {
		return memberMapper.phoneCheck(member);
	}

	@Override
	public int findPwd(Member member) {
		return memberMapper.findPwd(member);
	}

	@Override
	public int updatePwd(Member member) {
		return memberMapper.updatePwd(member);
	}

	@Override
	public int changePwd(Member member) {
		return memberMapper.changePwd(member);
	}

	@Override
	public Member findUpdateMember(int memberNo) {
		return memberMapper.findUpdateMember(memberNo);
	}

	@Override
	public int updateMember(Member member) {
		return memberMapper.updateMember(member);
	}
	
}	
	
	

	/*
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
	public int idCheck(String checkId) {
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

	@Override
	public int changePwd(Member member) {
		return memberRepository.changePwd(sqlSession, member);
	}

	@Override
	public int phoneCheck(String checkPhone) {
		return memberRepository.phoneCheck(sqlSession, checkPhone);
	}

	@Override
	public Member findUpdateMember(int memberNo) {
		return memberRepository.findUpdateMember(sqlSession, memberNo);
	}

	@Override
	public int updateMember(Member member) {
		return memberRepository.updateMember(sqlSession, member);
	}
	*/

