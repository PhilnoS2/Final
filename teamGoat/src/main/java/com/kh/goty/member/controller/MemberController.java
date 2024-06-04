package com.kh.goty.member.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Properties;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goty.board.model.vo.ResponseData;
import com.kh.goty.common.template.RdTemplates;
import com.kh.goty.member.model.service.MemberService;
import com.kh.goty.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@PropertySource("classpath:key.properties")
@Slf4j
@RestController
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
	private final Environment env;
	
	private final MemberService memberService;
		
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/login")
	public ModelAndView loginForm(ModelAndView mv,
								  HttpServletResponse response) {
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		
		mv.addObject("kakao_client_id", env.getProperty("kakao_client_id"))
		  .addObject("naver_client_id", env.getProperty("naver_client_id"))
		  .addObject("state", state)
		  .setViewName("member/loginForm");
		
		return mv;
	}
	
	@PostMapping("/login")
	public ModelAndView login(Member member,
							  HttpSession session,
							  ModelAndView mv,
							  HttpServletRequest req,
							  HttpServletResponse res) {
		try {
			Member loginMember = memberService.login(member);
			
			// 임시코드발급상태확인
			if(loginMember != null 
			   && loginMember.getEmptyCodeYn().equals("Y")
			   && loginMember.getMemberPwd().equals(member.getMemberPwd())) {
				mv.addObject("loginMember", loginMember).setViewName("member/updatePwdForm");
				return mv;
			}
		
			if(loginMember != null 
					&& bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
				
				session.setAttribute("loginMember", loginMember);
				session.setAttribute("alertMsg", "로그인 성공");
				String uri = "";
						
				// 쿠키에서 확인하기
				Cookie[] cookies = req.getCookies();
				if(cookies != null){
			        for (Cookie c : cookies) {
			        	String name = c.getName();   // 쿠키 이름 가져오기
			        	String value = c.getValue(); // 쿠키 값 가져오기
						
			            if (name.equals("reqUri")) {
			            	uri = value;
			            }
			        }
			    }
				
				Cookie cookie = new Cookie("reqUri", "");
				cookie.setMaxAge(0);
				cookie.setPath("/");
				res.addCookie(cookie); 
				
				if(!uri.equals("")) {
					mv.setViewName("redirect:/"+uri);
				} else {
					mv.setViewName("redirect:/");
				}
				
			} else {
				mv.addObject("errorMsg", "로그인 실패했습니다.").setViewName("common/errorPage");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.").setViewName("common/errorPage");
			return mv;
		}
		return mv;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) {
		session.removeAttribute("loginMember");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@GetMapping("/enrollForm")
	public ModelAndView enrollForm(ModelAndView mv) {
		mv.setViewName("member/enrollForm");
		return mv;
	}
	
	@PostMapping("/insert")
	public ModelAndView insertMember(Member member, 
									 ModelAndView mv, 
									 HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		member.setStatus("GT");
		try {
			if(memberService.insertMember(member) > 0) {
				session.setAttribute("alertMsg", "회원가입 성공");
				mv.setViewName("redirect:/");
			} else {
				mv.addObject("errorMsg", "회원가입 실패")
				  .setViewName("common/errorPage");
			}		
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.").setViewName("common/errorPage");
			return mv;
		}
		
		return mv;
	}
	
	@GetMapping("/idCheck")
	public String idCheck(String checkId) {
		return memberService.idCheck(checkId) > 0 ? "YD": "ND";
	}
	
	@GetMapping("/emailCheck")
	public String emailCheck(String checkEmail) {
		return memberService.emailCheck(checkEmail) > 0 ? "YD": "ND";
	}
	
	@GetMapping("/phoneCheck")
	public String phoneCheck(String checkPhone) {
		return memberService.phoneCheck(checkPhone) > 0 ? "YD": "ND";
	}
	
	@GetMapping("/findIdForm")
	public ModelAndView findId(ModelAndView mv) {
		mv.setViewName("member/findId");
		return mv;
	}
	
	@PostMapping("/findId")
	public ModelAndView findId(Member member, ModelAndView mv, HttpSession session) {
		try {
			String findId = memberService.findId(member);
			
			if(findId != null) {
				session.setAttribute("findId", findId);
				mv.setViewName("member/loginForm");
				
			} else {
				mv.addObject("errorMsg", "아이디 찾기 실패했습니다.").setViewName("common/errorPage");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.").setViewName("common/errorPage");
			return mv;
		}
		
		return mv;
	}
	
	@GetMapping("/findPwdForm")
	public ModelAndView findPwd(ModelAndView mv) {
		mv.setViewName("member/findPwd");
		return mv;
	}
	
	@PostMapping("/findPwd")
	public ModelAndView findPwd(Member member, ModelAndView mv, HttpSession session)  {
		
		if(memberService.findPwd(member) > 0) { // 입력한회원 존재함
		
			try {
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
				message.setTo(to);
				sender.send(message);
				
				member.setMemberPwd(sb.toString());
				if(memberService.updatePwd(member) > 0) {
					session.setAttribute("alertMsg", "임시 코드가 이메일로 발송되었습니다.");
				} else {
					mv.addObject("errorMsg", "비밀번호 변경 실패").setViewName("common/errorPage");
				}
				
			} catch (Exception e) {
				 e.printStackTrace();
				 mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.").setViewName("common/errorPage");
				 return mv;
			}
			
		} else {
			session.setAttribute("alertMsg", "회원 정보가 존재하지 않습니다.");
		}
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	@PostMapping("/changePwd")
	public ModelAndView updatePwd(ModelAndView mv, Member member, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		try{
			
			if(memberService.changePwd(member) > 0) {
				session.setAttribute("alertMsg", "비밀번호 변경이 완료되었습니다.");
				mv.setViewName("redirect:login");			
			} else {
				mv.addObject("errorMsg", "비밀번호 변경이 실패했습니다.").setViewName("common/errorPage");
			}
		} catch (Exception e) {
			 e.printStackTrace();
			 mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.").setViewName("common/errorPage");
			 return mv;
		}
		return mv;
		
  }
	
  @GetMapping("/mypage")
  public ModelAndView mypage(ModelAndView mv, HttpSession session) {
	  mv.setViewName("member/mypage");
	  return mv;
  }
  
  @GetMapping("/updateForm/{memberNo}")
  public ModelAndView updateForm(@PathVariable("memberNo") int memberNo, 
		  						 ModelAndView mv) {
	  Member member = null;
	  try {
		  member = memberService.findUpdateMember(memberNo);
		  
		  if(member != null) {
			  mv.addObject("member", member).setViewName("member/updateForm");
		  } else {
			  mv.addObject("errorMsg", "회원의 정보가 존재하지 않습니다.").setViewName("common/errorPage");
		  }
		  
	  } catch (Exception e) {
		  e.printStackTrace();
		  mv.addObject("errorMsg", "서버 오류, 관리자에게 문의하세요.").setViewName("common/errorPage");
		  return mv;
	  }
	  return mv;
  }
 
  @PostMapping("/update")
  public ModelAndView updateMember(Member member, ModelAndView mv, HttpSession session) {
	  try {
		  if(memberService.updateMember(member) > 0) {
			  session.setAttribute("alertMsg", "정보 수정이 성공했습니다.");
			  session.removeAttribute("loginMember");
			  mv.setViewName("redirect:login");
		  } else {
			  mv.addObject("errorMsg", "정보 수정에 실패했습니다.").setViewName("common/errorPage");
		  }
	  }catch (Exception e) {
		e.printStackTrace();
		mv.addObject("errorMsg", "서버 오류, 관리자에게 문의하세요.").setViewName("common/errorPage");
		return mv;
	  }  
	  return mv;
  }
  
 @PatchMapping("/{memberNo}")
 public ResponseEntity<ResponseData> deleteMember(@PathVariable("memberNo") int memberNo) {
	 
	  int result = 0;
	  ResponseData rd = null;
	  
	  try {
		  result = memberService.deleteMember(memberNo);
		  rd = RdTemplates.getRd("회원 탈퇴 성공", "299", "회원 탈퇴 성공");
	  }
	  catch(Exception e) {
		  // 서버쪽 오류
		  rd = RdTemplates.getRd("서버쪽에 문제가 생겼습니다.", "600", "서버 오류");
	  }
	  
	  return new ResponseEntity<ResponseData>(rd, RdTemplates.getHeader(), HttpStatus.OK);
	 
 }
	

 @DeleteMapping("/{memberNo}")
 public ResponseEntity<ResponseData> deleteSocialMember(@PathVariable("memberNo") int memberNo) {
	 
	  int result = 0;
	  ResponseData rd = null;
	  
	  try {
		  result = memberService.deleteSocialMember(memberNo);
		  rd = RdTemplates.getRd("회원 탈퇴 성공", "299", "소셜 회원 탈퇴 성공");
	  }
	  catch(Exception e) {
		  // 서버쪽 오류
		  rd = RdTemplates.getRd("서버쪽에 문제가 생겼습니다.", "600", "서버 오류");
	  }

	  return new ResponseEntity<ResponseData>(rd, RdTemplates.getHeader(), HttpStatus.OK);
	 
 }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
