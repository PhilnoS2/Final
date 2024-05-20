package com.kh.goty.customerService.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
import com.kh.goty.customerService.model.service.CustomerService;
import com.kh.goty.customerService.model.vo.Notice;
import com.kh.goty.customerService.model.vo.QuestionCategory;

@Controller
public class CustomerServiceController {

	@Autowired
	private CustomerService customerService;
	
	@GetMapping("admin")
	public String forwardAdmin() {
		return "admin/adminMain";
	}
	
	@GetMapping("management/board")
	public String forwardManagementBoard() {
		return "admin/managementBoard";
	}
	
	@GetMapping("customer-service")
	public String forward() {
		
		return "customerService/csMain";
	}
	
	@GetMapping("questions")
	public String forwardQuestion() {
	
		return "customerService/question/questionMain";
	}
	
	@GetMapping("notices")
	public String forwardNotice(@RequestParam(value="page", defaultValue="1") int page) {
		PageInfo pageInfo = Pagination.getPageInfo(customerService.selectNoticeListCount(), page, 5, 5);
		
		List<Notice> noticeList = customerService.selectNoticeListAll(pageInfo);
		
		System.out.println(noticeList);
		
		
		return "customerService/notice/noticeMain";
	}
	
	@GetMapping("notice/enroll")
	public String forwardNoticeEnrollForm() {
		return "customerService/notice/noticeEnrollForm";
	}
	
	@PostMapping("notice/insert")
	public String noticeInsert(Notice notice, HttpSession session) {

		if(customerService.noticeInsert(notice) > 0) {
			session.setAttribute("alertMsg", "공지사항 작성 성공");
		} else {
			session.setAttribute("alertMsg", "게시물 작성 실패");
		}
		return "redirect:/notices";
	}
	
	@GetMapping("faqs")
	public String forwardFaq() {
		return "customerService/faq/faqMain";
	}
	
	@GetMapping("faq/enroll")
	public String forwardFaqEnrollForm() {
		
		List<QuestionCategory> list = customerService.selectCategoryList();
		System.out.println(list);
		return "customerService/faq/faqEnrollForm";
	}
	
}
