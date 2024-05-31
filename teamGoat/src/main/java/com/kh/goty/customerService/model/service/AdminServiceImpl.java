package com.kh.goty.customerService.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

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

}
