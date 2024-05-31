package com.kh.goty.customerService.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
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
	public String forwardQuestion(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		
		PageInfo pageInfo = Pagination.getPageInfo(questionService.selectQuestionListCount(), page, 4, 5);
		
		List<Question> questionList = questionService.selectQuestionListAll(pageInfo);
		if(!questionList.isEmpty()) {
			model.addAttribute("questionList", questionList);
			model.addAttribute("pageInfo", pageInfo);
		}
		return "customerService/question/questionMain";
	}
	
	@GetMapping("question")
	public String selectQuestion(int questionNo, Model model) {
		
		// 답변여부
		if(questionService.selectAnswer(questionNo) != null) {
			model.addAttribute("answer", "완료");
		} else {
			model.addAttribute("answer", "대기중");
		}
		
		
		Question question = questionService.selectQuestion(questionNo);
		QuestionAttach attachFile = questionService.selectQuestionAttach(questionNo);
		System.out.println(questionNo);
		System.out.println(attachFile);
		
		if(question != null) {
			model.addAttribute("question", question);
			
		}
		return "customerService/question/questionDetail";
	}
	
	@GetMapping("question/enroll")
	public String forwardQuestionEnrollForm(Model model) {
		List<QuestionCategory> categoryList = faqService.selectCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "customerService/question/questionEnrollForm"; 
	}
	
	@PostMapping("question/insert")
	public String insertQuestion(Question question, MultipartFile upfile, HttpSession session) {
		HashMap<String, Object> map = new HashMap();
		
		map.put("memberNo", question.getMemberNo());
		map.put("categoryNo", question.getCategoryNo());
		map.put("questionTitle", question.getQuestionTitle());
		map.put("questionContent", question.getQuestionContent());
		
		if(!upfile.getOriginalFilename().equals("")) {
			map.put("fileOriginName", upfile.getOriginalFilename());
			map.put("fileChangeName", saveFile(upfile, session));
			map.put("attachPath", session.getServletContext().getRealPath("resources/questionUpfiles/"));			
		}
		
		if(questionService.insertQuestion(map) > 0) {
			session.setAttribute("alertMsg", "문의글 작성 성공");
		} else {
			session.setAttribute("alertMsg", "문의글 작성 실패");
		}
		return "redirect:/questions";
	}
	
	@PostMapping("question/updateForm")
	public String forwardUpdateForm(int questionNo, Model model) {
		model.addAttribute("question", questionService.selectQuestion(questionNo));
		return "customerService/question/questionUpdateForm";
	}
	
	@PostMapping("question/update")
	public String updateQuestion(Question question) {
		
		
		questionService.updateQuestion(question);
		
		return "redirect:/question?questionNo=" + question.getQuestionNo();
	}
	
	@PostMapping("question/delete")
	public String deleteQuestion(int questionNo, HttpSession session) {
		
		if(questionService.deleteQuestion(questionNo) > 0) {
			session.setAttribute("alertMsg", "게시물 삭제 완료");
		} else {
			session.setAttribute("alertMsg", "게시물 삭제 실패");
		}
		
		return "redirect:/questions";
	}
	
	@GetMapping("questions/find")
	public String searchQuestion(@RequestParam(value="page", defaultValue="1") int page, String date, String condition, String keyword, Model model) {
		
		HashMap<String, String> map = new HashMap();
		
		map.put("date", date);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pageInfo = Pagination.getPageInfo(questionService.searchQuestionListCount(map), page, 4, 5);
		
		List<Question> searchList = questionService.searchQuestionList(map, pageInfo);
		if(!searchList.isEmpty()) {
			model.addAttribute("searchList", searchList);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("date", date);
			model.addAttribute("condition", condition);
			model.addAttribute("keyword", keyword);
		}
		System.out.println(searchList);
		
		
		return "customerService/question/questionSearchList";
	}
	
	@ResponseBody
	@GetMapping(value="question/category", produces="application/json; charset=UTF-8")
	public String selectQuestion(int category, @RequestParam(value="page", defaultValue="1") int page) {
		
		PageInfo pageInfo = Pagination.getPageInfo(questionService.selectCategoryListCount(category), page, 4, 5);
		
		List<Question> searchList = questionService.questionSearchList(category, pageInfo);
		
		return new Gson().toJson(searchList);
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
