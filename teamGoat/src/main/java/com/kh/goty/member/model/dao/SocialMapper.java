package com.kh.goty.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.goty.member.model.vo.Member;

@Mapper
public interface SocialMapper {
	
	int checkSocial(String memberId);
	
	Member loginKakao(String memberId);
	
	Member loginNaver(String memberId);
	
}
