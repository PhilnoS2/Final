package com.kh.goty.customerService.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.goty.customerService.model.service.FaqService;
import com.kh.goty.customerService.model.service.QuestionService;
import com.kh.goty.customerService.model.vo.Question;
import com.kh.goty.customerService.model.vo.QuestionCategory;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class QuestionController {

	private final QuestionService questionService;
	private final FaqService faqService;
	
	@GetMapping("questions")
	public String forwardQuestion() {
		return "customerService/question/questionMain";
	}
	
	@GetMapping("question/enroll")
	public String forwardQuestionEnrollForm(Model model) {
		List<QuestionCategory> categoryList = faqService.selectCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "customerService/question/questionEnrollForm"; 
	}
	
	@PostMapping("question/insert")
	public String insertQuestion(Question question, MultipartFile upfile) {
		
		System.out.println(question);
		System.out.println(upfile);
		if(!upfile.getOriginalFilename().equals("")) {
			
		}
		
		return "";
	}
	
	
}
