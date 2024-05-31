package com.kh.goty.customerService.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.goty.customerService.model.vo.Answer;
import com.kh.goty.member.model.vo.Member;

@Mapper			

public interface AdminRepository {
	
	List<Member> selectMember();
	
	int selectMemberList();
	
	int insertAnswer(Answer answer);
	
	int updateBoard(int questionNo);
	
}
