package com.kh.goty.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.goty.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	
	public Member login(Member member);
	
	public int insertMember(Member member);
	
	public int idCheck(String checkId);
	
	public String findId(Member member);
	
	public int phoneCheck(Member memeber);
	
	public int findPwd(Member member);
	
	public int updatePwd(Member member);
	
	public int emailCheck(String checkEmail);
	
	public int changePwd(Member member);
	
	public int phoneCheck(String checkPhone);
	
	public Member findUpdateMember(int memberNo);
	
	public int updateMember(Member member);
	
	
}
