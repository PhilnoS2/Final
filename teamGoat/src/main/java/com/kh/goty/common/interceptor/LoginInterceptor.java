package com.kh.goty.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends  HandlerInterceptorAdapter {

	/*
	 * interceptor(정확히 HandlerIntercepter) 
	 * 
	 * Handler가 호출되기 전, 실행된 후 가로채서 실행할 내용을 작성 가능
	 * 
	 * preHandler(전 처리)  : 핸들러 호출 전 낚아챔
	 * postHandler(후 처리) : 요청 처리 후 낚아챔
	 * 
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// true 반환 => 기존 요청 호출대로 Handler를 정상 수행 ==> Controller에 있는 메소드 호출
		// false 반환 =>  handler호출 안함
		
		HttpSession session = request.getSession();		
		if(session.getAttribute("loginMember") != null) {
			return true;
		} else {
			session.setAttribute("alertMsg", "로그인 부탁드립니다.");
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;
		}
		
	}
	
	
	
}
