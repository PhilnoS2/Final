package com.kh.goty.customerService.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.goty.customerService.model.service.FaqService;
import com.kh.goty.customerService.model.service.QuestionService;
import com.kh.goty.customerService.model.vo.Question;
import com.kh.goty.customerService.model.vo.QuestionAttach;
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
	public String insertQuestion(Question question, MultipartFile upfile, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			QuestionAttach questionAttach = new QuestionAttach();
			questionAttach.setFileOriginName(upfile.getOriginalFilename());
			questionAttach.setFileChangeName(saveFile(upfile, session));
			questionAttach.setAttachPath(session.getServletContext().getRealPath("resources/questionUpfiles/"));
			questionService.insertQuestion(question, questionAttach);
		} else {
			questionService.insertQuestion(question, null);
		}
		return "";
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int randomNum = (int)(Math.random() * 90000) + 10000;
		
		StringBuilder sb = new StringBuilder();
		sb.append(currentTime).append(randomNum).append(ext);
		String changeName = sb.toString();
		
		String savePath = session.getServletContext().getRealPath("resources/questionUpfiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return "resources/questionUpfiles/" + changeName;
	}
	
}
