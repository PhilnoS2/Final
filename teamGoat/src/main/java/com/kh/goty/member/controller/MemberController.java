package com.kh.goty.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goty.member.model.service.MemberService;
import com.kh.goty.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@GetMapping(value="loginForm.member")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@PostMapping("login.member")
	public ModelAndView login(Member member, HttpSession session, ModelAndView mv) {
		Member loginMember = memberService.login(member);
		System.out.println(loginMember);
		
		if(loginMember != null && bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("alertMsg", "로그인 성공");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "로그인 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@GetMapping("logout.member")
	public String logout(HttpSession session) {
		session.removeAttribute("loginMember");
		return "redirect:/";
	}
	
	@GetMapping("enrollForm.member")
	public String enrollForm() {
		return "member/enrollForm";
	}
	
	@PostMapping("insert.member")
	public ModelAndView insertMember(Member member, 
									 ModelAndView mv, 
									 HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		
		if(memberService.insertMember(member) > 0) {
			session.setAttribute("alertMsg", "회원가입 성공");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "회원가입 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("idCheck.member")
	public String idCheck(String checkId) {
		return memberService.idChekc(checkId) > 0? "YD": "ND";
	}
	
}
