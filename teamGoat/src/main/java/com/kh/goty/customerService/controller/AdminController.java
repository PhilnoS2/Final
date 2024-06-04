package com.kh.goty.customerService.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
import com.kh.goty.customerService.model.service.AdminService;
import com.kh.goty.customerService.model.service.QuestionService;
import com.kh.goty.customerService.model.vo.Answer;
import com.kh.goty.customerService.model.vo.Question;
import com.kh.goty.customerService.model.vo.QuestionAttach;
import com.kh.goty.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor
@Slf4j
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
	
	@GetMapping("admin/member/find")
	public String findMember(@RequestParam(value="page", defaultValue="1") int page, String condition, String keyword, Model model) {
		
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
	
		PageInfo pageInfo = Pagination.getPageInfo(adminService.SearchMemberListCount(map), page, 10, 5);
		
		model.addAttribute("searchMemberList", adminService.findMember(map));
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/searchMemberList";
	}
	
	@GetMapping("management/boards")
	public String forwardManagementBoard(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		
		PageInfo pageInfo = Pagination.getPageInfo(questionService.selectQuestionListCount(), page, 10, 5);
		
		List<Question> questionList = questionService.selectQuestionListAll(pageInfo);
		if(!questionList.isEmpty()) {
			model.addAttribute("questionList", questionList);
			model.addAttribute("pageInfo", pageInfo);
		}
		
		return "admin/managementBoard";
	}
	
	@GetMapping("management/board")
	public String selectBoard(int boardNo, Model model) {
		
		int questionNo = boardNo;
		
		Question question = questionService.selectQuestion(questionNo);		
		
		model.addAttribute("question", question);
		
		QuestionAttach attach = questionService.selectQuestionAttach(questionNo);
		model.addAttribute("attach", attach);
		
		return "admin/answerEnrollForm";
	}
	
	@PostMapping("admin/answer/insert")
	public String insertAnswer(int questionNo, int memberNo, Answer answer, HttpSession session) {
		
		answer.setQuestionNo(questionNo);
		answer.setMemberNo(memberNo);
		
		
		if(adminService.insertAnswer(answer) > 0) {
			adminService.updateBoard(questionNo);
			session.setAttribute("alertMsg", "답변 작성 성공");
		};
		
		return "redirect:/management/boards";
	}
	
	@PostMapping(value="admin/member/delete")
	public String deleteMember(@RequestParam("memberNo") List<Integer> memberNo, HttpSession session) {
		
		if(adminService.chekedMemberDelete(memberNo) > 0) {
			session.setAttribute("alertMsg", "선택 회원 탈퇴 성공!");
		} else {
			session.setAttribute("alertMsg", "선택 회원 탈퇴 실패");
		}
		return "redirect:/admin";
	}
	
	@PostMapping(value="admin/member/update/point")
	public String updateMemberPoint (@RequestParam("memberNo") List<Integer> memberNo, String point, HttpSession session) {
		
		int addPoint = Integer.parseInt(point);
		if(adminService.checkedMemberPointUpdate(memberNo, addPoint) > 0) {
			session.setAttribute("alertMsg", "선택한 회원에게 적립금 부여 성공!");
		} else {
			session.setAttribute("alertMsg", "선택한 회원에게 적립금 부여 실패");
		}
		
		return "redirect:/admin";
	}
	
	
	
}
