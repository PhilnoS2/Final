package com.kh.goty.member.model.service;

import com.kh.goty.member.model.vo.Member;

public interface MemberService {
	
	public Member login(Member member);
	
	public int insertMember(Member member);
}
