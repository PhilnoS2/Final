package com.kh.goty.customerService.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.goty.member.model.vo.Member;

@Mapper			

public interface AdminRepository {
	
	List<Member> selectMember();
	
	int selectMemberList();
}
