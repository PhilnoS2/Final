package com.kh.goty.customerService.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.goty.customerService.model.service.FaqService;
import com.kh.goty.customerService.model.vo.Faq;
import com.kh.goty.customerService.model.vo.QuestionCategory;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FaqController {

	private final FaqService faqService;
	
	@GetMapping("faqs")
	public String forwardFaq(Model model) {
		
		List<Faq> faqList = faqService.selectFaqList();
		model.addAttribute("faqList", faqList);
		return "customerService/faq/faqMain";
	}
	
	@GetMapping("faq/enroll")
	public String forwardFaqEnrollForm(Model model) {
		
		List<QuestionCategory> categoryList = faqService.selectCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "customerService/faq/faqEnrollForm";
	}
	
	@PostMapping("faq/insert")
	public String insertFaq(Faq faq) {
		
		faqService.insertFaq(faq);
		
		return "redirect:/faqs";
	}
	
	@ResponseBody
	@GetMapping(value="faq/category", produces="application/json; charset=UTF-8")
	public String selectFaq(int category) {
		
		List<Faq> searchList = faqService.faqSearchList(category);
		return new Gson().toJson(searchList);
	}
	
	
}
