package com.kh.goty.customerService.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
import com.kh.goty.customerService.model.service.AdminService;
import com.kh.goty.customerService.model.service.QuestionService;
import com.kh.goty.customerService.model.vo.Question;
import com.kh.goty.member.model.vo.Member;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class AdminController {

	private final AdminService adminService;
	private final QuestionService questionService;							
	
	@GetMapping("admin")
	public String forwardAdmin(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		
		PageInfo pageInfo = Pagination.getPageInfo(adminService.selectMemberList(), page, 10, 10);
		
		List<Member> memberList = adminService.selectMember();
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageInfo", pageInfo);
		return "admin/adminMain";
	}
	
	@GetMapping("management/board")
	public String forwardManagementBoard(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		
		PageInfo pageInfo = Pagination.getPageInfo(questionService.selectQuestionListCount(), page, 10, 5);
		
		List<Question> questionList = questionService.selectQuestionListAll(pageInfo);
		if(!questionList.isEmpty()) {
			model.addAttribute("questionList", questionList);
			model.addAttribute("pageInfo", pageInfo);
		}
		
		return "admin/managementBoard";
	}
}
