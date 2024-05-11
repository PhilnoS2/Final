package com.kh.goty.member.controller;

import java.util.Properties;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
@PropertySource("classpath:key.properties")
public class MemberController {
	
	@Autowired
	Environment env;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@GetMapping("loginForm.member")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@PostMapping("login.member")
	public ModelAndView login(Member member, HttpSession session, ModelAndView mv) {
		Member loginMember = memberService.login(member);
		
		// 임시코드발급상태확인
		if(loginMember.getEmptyCodeYN().equals("Y")) {
			mv.addObject("loginMember", loginMember).setViewName("member/updatePwdForm");
			return mv;
		}
		
		if(loginMember != null && bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("alertMsg", "로그인 성공");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "로그인 실패했습니다.").setViewName("common/errorPage");
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
	
	@GetMapping("findIdForm.member")
	public String findId() {
		return "member/findId";
	}
	
	@PostMapping("findId.member")
	public ModelAndView findId(Member member, ModelAndView mv, HttpSession session) {
		String findId = memberService.findId(member);
		
		if( findId != null) {
			session.setAttribute("findId", findId);
			mv.setViewName("member/loginForm");
			
		} else {
			mv.addObject("errorMsg", "아이디 찾기 실패했습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@GetMapping("findPwdForm.member")
	public String findPwd() {
		return "member/findPwd";
	}
	
	@PostMapping("findPwd.member")
	public ModelAndView findPwd(Member member, ModelAndView mv, HttpSession session)  {
		if(memberService.findPwd(member) > 0) { // 입력한회원 존재함
			JavaMailSenderImpl sender;
			
			JavaMailSenderImpl impl = new JavaMailSenderImpl();
			// - 계정 설정
			impl.setHost("smtp.gmail.com");
			impl.setPort(587);
			impl.setUsername(env.getProperty("email"));
			impl.setPassword(env.getProperty("password"));
			
			// - 옵션 설정
			Properties prop = new Properties();
			prop.put("mail.smtp.starttls.enable", true);
			prop.put("mail.smtp.auth", true);
			
			impl.setJavaMailProperties(prop);
			sender = impl;
			
			SimpleMailMessage message = new SimpleMailMessage();
			
			//코드 생성
			 StringBuilder sb = new StringBuilder();
			    Random rd = new Random();

			    for(int i=0;i < 8;i++){
			        if(rd.nextBoolean()){
			            sb.append(rd.nextInt(10));
			        }else {
			            sb.append((char)(rd.nextInt(26)+65));
			        }
			    }
			
			message.setSubject("안녕하세요. goty 비밀번호 찾기 이메일입니다.");
			message.setText("임시 비밀번호 : "+ sb);

			String[] to = { member.getEmail() };
			member.setMemberPwd(sb.toString());
			
			if(memberService.updatePwd(member) > 0) {
				message.setTo(to);
				sender.send(message);
				session.setAttribute("alertMsg", "임시 코드가 이메일로 발송되었습니다.");
			} else {
				mv.addObject("errorMsg", "비밀번호 변경 실패").setViewName("common/errorPage");
			}
			
		} else {
			session.setAttribute("alertMsg", "회원 정보가 존재하지 않습니다.");
		}
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	@PostMapping("updatePwd.member")
	public ModelAndView updatePwd(ModelAndView mv, Member member, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		
		if(memberService.updatePwd(member) > 0) {
			session.setAttribute("alertMsg", "비밀번호 변경이 완료되었습니다.");
			mv.setViewName("redirect:loginForm.member");			
		} else {
			mv.addObject("errorMsg", "비밀번호 변경이 실패했습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
