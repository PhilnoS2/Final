package com.kh.goty.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

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
		
		KakaoMember km = kakaoService.getUserInfo(accessToken);
		km.setAccessToken(accessToken);
		
		// km 가지고 db id 조회/ 없으면 table에 insert /있으면 로그인
		if(kakaoService.checkKakaoId(km) > 0) {
			km.setStatus("KM");
			session.setAttribute("loginMember", km);
			session.setAttribute("alertMsg", "로그인 성공");
			mv.setViewName("redirect:/");
		} else {
			if(kakaoService.insertKakao(km) > 0) {
				session.setAttribute("alertMsg", "카카오 아이디로 회원가입 성공!");
				mv.setViewName("redirect:/");
			}
		}		
		return mv;
	}
	
	@GetMapping("/kakaologout")
	public ModelAndView kakaologout(HttpSession session, ModelAndView mv) throws IOException, ParseException {
		KakaoMember km = (KakaoMember)session.getAttribute("loginMember");
		
		String logoutUrl = "https://kapi.kakao.com/v1/user/logout";
		
		URL url = new URL(logoutUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Authorization", "Bearer " + km.getAccessToken());

		BufferedReader br
			= new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseData = br.readLine();
		
		System.out.println(responseData);
		
		//JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
		
		session.removeAttribute("loginMember");
		session.setAttribute("alertMsg", "로그아웃합니다.");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	
	
	@GetMapping("/naverlogin")
	public ModelAndView naverlogin(String state, String code, HttpSession session, ModelAndView mv) throws IOException, ParseException {
		// log.info("state={}", state);
		// log.info("code={}", code);
		
		String accessToken = naverService.getToken(code, state);
		NaverMember nm = naverService.getUserInfo(accessToken);
		
		//System.out.println(nm);	
		
		if(naverService.checkNaverId(nm) > 0) {
			nm.setStatus("NM");
			session.setAttribute("loginMember", nm);
			session.setAttribute("alertMsg", "로그인 성공!");
			mv.setViewName("redirect:/");
		} else {
			if(naverService.insertNaver(nm) > 0) {
				session.setAttribute("alertMsg", "네이버 아이디로 회원가입 성공!");
				mv.setViewName("redirect:/");
			}
		}
		
		return mv;
	}
	
	
	@GetMapping("/naverlogout")
	public ModelAndView naverlogout(HttpSession session, ModelAndView mv) {
		// 로그아웃 요청
		session.removeAttribute("loginMember");
		session.setAttribute("alertMsg", "로그아웃합니다.");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	
}
