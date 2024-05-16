package com.kh.goty.customerService.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerServiceController {

	
	@GetMapping("customer-service")
	public String forward() {
		
		return "customerService/csMain";
	}
	
	@GetMapping("questions")
	public String forwardQuestion() {
	
		return "customerService/question/questionMain";
	}
	
	@GetMapping("question/enroll")
	public String forwardInsertQuestion() {
		return "customerService/question/questionEnrollForm";
	}
	
	@GetMapping("notices")
	public String forwardNotice() {
		return "customerService/notice/noticeMain";
	}
	
	@GetMapping("notice/enroll")
	public String forwardInsertNotice() {
		return "customerService/notice/noticeEnrollForm";
	}
	
	@GetMapping("faqs")
	public String forwardFaq() {
		return "customerService/faq/faqMain";
	}
	
}
