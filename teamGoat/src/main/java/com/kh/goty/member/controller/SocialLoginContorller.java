package com.kh.goty.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goty.member.model.service.KakaoService;
import com.kh.goty.member.model.service.NaverService;
import com.kh.goty.member.model.vo.KakaoMember;
import com.kh.goty.member.model.vo.NaverMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class SocialLoginContorller {
	
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private NaverService naverService;
	
	@GetMapping("/kakaologin")
	public ModelAndView kakaologin(String code, HttpSession session, ModelAndView mv) throws IOException, ParseException {
		// log.info("code={}", code);
		
		String accessToken = kakaoService.getToken(code);
		
		KakaoMember sm = kakaoService.getUserInfo(accessToken);
		
		System.out.println(sm);
		mv.setViewName("redirect:member/login");
		return mv;
	}
	
	@GetMapping("/naverlogin")
	public ModelAndView naverlogin(String state, String code, HttpSession session, ModelAndView mv) throws IOException, ParseException {
		// log.info("state={}", state);
		// log.info("code={}", code);
		
		String accessToken = naverService.getToken(code, state);
		
		NaverMember nm = naverService.getUserInfo(accessToken);
		
		System.out.println(nm);
		mv.setViewName("redirect:member/login");
		return mv;
	}
	
	
}
