package com.kh.goty.customerService.model.service;

import java.util.List;
import java.util.Map;

import com.kh.goty.customerService.model.vo.Answer;
import com.kh.goty.member.model.vo.Member;

public interface AdminService {

	List<Member> selectMember();
	
	int selectMemberList();
	
	int insertAnswer(Answer answer);

	int updateBoard(int questionNo);

}
