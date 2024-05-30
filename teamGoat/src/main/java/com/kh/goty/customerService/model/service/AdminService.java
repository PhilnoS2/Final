package com.kh.goty.customerService.model.service;

import java.util.List;

import com.kh.goty.member.model.vo.Member;

public interface AdminService {

	List<Member> selectMember();
	
	int selectMemberList();
	
}
