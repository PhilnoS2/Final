package com.kh.goty.customerService.model.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.goty.customerService.model.vo.Answer;
import com.kh.goty.member.model.vo.Member;

@Mapper			

public interface AdminRepository {
	
	List<Member> selectMember();
	
	int selectMemberList();
	
	int insertAnswer(Answer answer);
	
	int updateBoard(int questionNo);
	
	int SearchMemberListCount(HashMap<String, String> map);

	List<Member> findMember(HashMap<String, String> map);
	
	int chekedMemberDelete(List<Integer> memberNo);
	
	int checkedMemberPointUpdate(@Param("memberNo") List<Integer> memberNo, @Param("addPoint") int addPoint);

}
