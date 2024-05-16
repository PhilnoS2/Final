package com.kh.goty.member.model.service;

import com.kh.goty.member.model.vo.Member;

public interface MemberService {
	
	public Member login(Member member);
	
	public int insertMember(Member member);
	
	public int idCheck(String checkId);

	public int emailCheck(String checkEmail);
	
	public int phoneCheck(String checkPhone);
	
	public String findId(Member member);

	public int phoneCheck(Member member);

	public int findPwd(Member member);

	public int updatePwd(Member member);

	public int changePwd(Member member);

	public Member findUpdateMember(int memberNo);

	public int updateMember(Member member);


	 
}
