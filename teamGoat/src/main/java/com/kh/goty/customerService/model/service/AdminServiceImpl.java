package com.kh.goty.customerService.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.goty.customerService.model.repository.AdminRepository;
import com.kh.goty.customerService.model.vo.Answer;
import com.kh.goty.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

	private final AdminRepository adminRepository;
	
	@Override
	public List<Member> selectMember() {
		return adminRepository.selectMember();
	}

	@Override
	public int selectMemberList() {
		return adminRepository.selectMemberList();
	}

	@Override
	public int insertAnswer(Answer answer) {
		return adminRepository.insertAnswer(answer);
	}

	@Override
	public int updateBoard(int questionNo) {
		return adminRepository.updateBoard(questionNo);
	}

	@Override
	public List<Member> findMember(HashMap<String, String> map) {
		return adminRepository.findMember(map);
	}

	@Override
	public int SearchMemberListCount(HashMap<String, String> map) {
		return adminRepository.SearchMemberListCount(map);
	}
	
	
	@Override
	public int chekedMemberDelete(List<Integer> memberNo) {
		return adminRepository.chekedMemberDelete(memberNo);
	}

	@Override
	public int checkedMemberPointUpdate(List<Integer> memberNo, int addPoint) {
		return adminRepository.checkedMemberPointUpdate(memberNo, addPoint);
	}

	
	


}
