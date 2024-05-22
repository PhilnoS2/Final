package com.kh.goty.customerService.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.goty.customerService.model.service.QuestionService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class QuestionController {

	private final QuestionService questionService;
	
	@GetMapping("questions")
	public String forwardQuestion() {
	
		return "customerService/question/questionMain";
	}
}
