package com.kh.goty.member.model.service;

import java.io.IOException;

import org.json.simple.parser.ParseException;

import com.kh.goty.member.model.vo.Member;

public interface SocialMemberService {
	
	String getToken(String code) throws IOException, ParseException;
	
	Member getUserInfoKakao(String accessToken) throws IOException, ParseException;
	
	int checkKakaoId(String memberId);
	
	Member loginKakao(String memberId);
	
	
	
	String getToken(String code, String state) throws IOException, ParseException;
	
	Member getUserInfoNaver(String accessToken) throws IOException, ParseException;
	
	int checkNaverId(String memberId);
	
	Member loginNaver(String memberId);
}
