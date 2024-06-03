package com.kh.goty.customerService.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
import com.kh.goty.customerService.model.service.CustomerService;
import com.kh.goty.customerService.model.service.FaqService;
import com.kh.goty.customerService.model.service.NoticeService;
import com.kh.goty.customerService.model.vo.Faq;
import com.kh.goty.customerService.model.vo.Notice;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CustomerServiceController {

	private final CustomerService customerService;
	private final NoticeService noticeService;
	private final FaqService faqService;
	
	@GetMapping("customer-service")
	public String forward(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		PageInfo pageInfo = Pagination.getPageInfo(noticeService.selectNoticeListCount(), page, 5, 5);
		
		model.addAttribute("noticeList", noticeService.selectNoticeListAll(pageInfo));
		
		model.addAttribute("faqList", faqService.selectMainPageFaqList());
		
		return "customerService/csMain";
	}
	
}
