package com.kh.goty.customerService.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
import com.kh.goty.customerService.model.service.CustomerService;
import com.kh.goty.customerService.model.vo.Faq;
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
	public String forwardNotices(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		PageInfo pageInfo = Pagination.getPageInfo(customerService.selectNoticeListCount(), page, 5, 5);
		
		customerService.selectNoticeListAll(pageInfo);
		
		model.addAttribute("noticeList", customerService.selectNoticeListAll(pageInfo));
		model.addAttribute("pageInfo", pageInfo);
		
		return "customerService/notice/noticeMain";
	}
	
	@GetMapping("notice")
	public String forwardNotice(int noticeNo, Model model) {
		
		customerService.increaseNoticeCount(noticeNo);
		
		Notice notice = customerService.selectNotice(noticeNo);
		
		if(noticeNo > 1) {
			Notice preNotice = customerService.selectNotice(noticeNo - 1);
			if(preNotice != null) {
				model.addAttribute("preNotice", preNotice);
			} 
		}
		
		if(customerService.selectNotice(noticeNo + 1) != null) {
			Notice nextNotice = customerService.selectNotice(noticeNo + 1);
			model.addAttribute("nextNotice", nextNotice);
		}
		
		
		if(customerService.selectNotice(noticeNo) != null) {
			model.addAttribute("notice", notice);
		}
		return "customerService/notice/noticeDetail";
	}
	
	@GetMapping("notice/enroll")
	public String forwardNoticeEnrollForm() {
		return "customerService/notice/noticeEnrollForm";
	}
	
	@PostMapping("notice/insert")
	public String insertNotice(Notice notice, HttpSession session) {

		if(customerService.noticeInsert(notice) > 0) {
			session.setAttribute("alertMsg", "공지사항 작성 성공");
		} else {
			session.setAttribute("alertMsg", "게시물 작성 실패");
		}
		return "redirect:/notices";
	}
	
	@PostMapping("notice/update/forward")
	public String updateNoticeForm(int noticeNo, Model model) {
		
		model.addAttribute(customerService.selectNotice(noticeNo));
		
		return "customerService/notice/noticeUpdateForm";
	}
	
	@PostMapping("notice/update")
	public String updateNotice(Notice notice) {
		System.out.println(notice);
		
		customerService.updateNotice(notice);
		
		return "redirect:/notice?noticeNo=" + notice.getNoticeNo();
	}
	
	@PostMapping("notice/delete")
	public String deleteNotice(int noticeNo, HttpSession session) {
		
		System.out.println(noticeNo);
		
		if(customerService.deleteNotice(noticeNo) > 0) {
			session.setAttribute("alertMsg", "공지사항 삭제 성공");
		} else {
			session.setAttribute("alertMsg", "게시물 삭제 실패");
		}
		return "redirect:/notices";
	}
	
	@GetMapping("notices/find")
	public String searchNotice(@RequestParam(value="page", defaultValue="1") int page, String date, String condition, String keyword, Model model) {
	
		PageInfo pageInfo = Pagination.getPageInfo(customerService.selectNoticeListCount(), page, 5, 5);
		
		HashMap<String, String> map = new HashMap();
		map.put("date", date);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		List<Notice> searchList = customerService.noticeSearchList(map, pageInfo);
		
		if(!searchList.isEmpty()) {
			model.addAttribute("searchList", searchList);
		} 
		return "customerService/notice/noticeSearchList";
	}
	
	@GetMapping("faqs")
	public String forwardFaq(Model model) {
		
		List<Faq> faqList = customerService.selectFaqList();
		model.addAttribute("faqList", faqList);
		return "customerService/faq/faqMain";
	}
	
	@GetMapping("faq/enroll")
	public String forwardFaqEnrollForm(Model model) {
		
		List<QuestionCategory> categoryList = customerService.selectCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "customerService/faq/faqEnrollForm";
	}
	
	@PostMapping("faq/insert")
	public String insertFaq(Faq faq) {
		
		customerService.insertFaq(faq);
		
		return "redirect:/faqs";
	}
	
	@ResponseBody
	@GetMapping(value="faq/category", produces="application/json; charset=UTF-8")
	public String selectFaq(int category) {
		
		List<Faq> searchList = customerService.faqSearchList(category);
		System.out.println(searchList);
		
		return new Gson().toJson(searchList);
	}
	
	
	
}
