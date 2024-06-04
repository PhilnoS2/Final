package com.kh.goty.customerService.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.goty.customerService.model.vo.Answer;
import com.kh.goty.member.model.vo.Member;

public interface AdminService {

	List<Member> selectMember();
	
	int selectMemberList();
	
	int insertAnswer(Answer answer);

	int updateBoard(int questionNo);

	int SearchMemberListCount(HashMap<String, String> map);

	List<Member> findMember(HashMap<String, String> map);
	
	int chekedMemberDelete(List<Integer> memberNo);
	
	int checkedMemberPointUpdate(List<Integer> memberNo, int addPoint);

}
