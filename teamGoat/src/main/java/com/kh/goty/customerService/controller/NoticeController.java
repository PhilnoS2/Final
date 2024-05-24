package com.kh.goty.customerService.controller;

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
import com.kh.goty.customerService.model.service.NoticeService;
import com.kh.goty.customerService.model.vo.Notice;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoticeController {

	private final NoticeService noticeService;
	
	@GetMapping("notices")
	public String forwardNotices(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		PageInfo pageInfo = Pagination.getPageInfo(noticeService.selectNoticeListCount(), page, 5, 5);
		
		noticeService.selectNoticeListAll(pageInfo);
		
		model.addAttribute("noticeList", noticeService.selectNoticeListAll(pageInfo));
		model.addAttribute("pageInfo", pageInfo);
		
		return "customerService/notice/noticeMain";
	}
	
	@GetMapping("notice")
	public String forwardNotice(int noticeNo, Model model) {
		
		noticeService.increaseNoticeCount(noticeNo);
		
		Notice notice = noticeService.selectNotice(noticeNo);
		
		if(noticeNo > 1) {
			Notice preNotice = noticeService.selectNotice(noticeNo - 1);
			if(preNotice != null) {
				model.addAttribute("preNotice", preNotice);
			} 
		}
		
		if(noticeService.selectNotice(noticeNo + 1) != null) {
			Notice nextNotice = noticeService.selectNotice(noticeNo + 1);
			model.addAttribute("nextNotice", nextNotice);
		}
		
		
		if(noticeService.selectNotice(noticeNo) != null) {
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

		if(noticeService.noticeInsert(notice) > 0) {
			session.setAttribute("alertMsg", "공지사항 작성 성공");
		} else {
			session.setAttribute("alertMsg", "게시물 작성 실패");
		}
		return "redirect:/notices";
	}
	
	@PostMapping("notice/update/forward")
	public String updateNoticeForm(int noticeNo, Model model) {
		
		model.addAttribute(noticeService.selectNotice(noticeNo));
		
		return "customerService/notice/noticeUpdateForm";
	}
	
	@PostMapping("notice/update")
	public String updateNotice(Notice notice) {
		System.out.println(notice);
		
		noticeService.updateNotice(notice);
		
		return "redirect:/notice?noticeNo=" + notice.getNoticeNo();
	}
	
	@PostMapping("notice/delete")
	public String deleteNotice(int noticeNo, HttpSession session) {
		
		System.out.println(noticeNo);
		
		if(noticeService.deleteNotice(noticeNo) > 0) {
			session.setAttribute("alertMsg", "공지사항 삭제 성공");
		} else {
			session.setAttribute("alertMsg", "게시물 삭제 실패");
		}
		return "redirect:/notices";
	}
	
	@GetMapping("notices/find")
	public String searchNotice(@RequestParam(value="page", defaultValue="1") int page, String date, String condition, String keyword, Model model) {
		
		HashMap<String, String> map = new HashMap();
		map.put("date", date);
		map.put("condition", condition);
		map.put("keyword", keyword);
		PageInfo pageInfo = Pagination.getPageInfo(noticeService.selectSearchNoticeListCount(map), page, 5, 5);
		
		List<Notice> searchList = noticeService.noticeSearchList(map, pageInfo);
		
		if(!searchList.isEmpty()) {
			model.addAttribute("searchList", searchList);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("date", date);
			model.addAttribute("condition", condition);
			model.addAttribute("keyword", keyword);
		}  else {
			model.addAttribute("failMsg", "결과가 없습니다");
		}
		
		System.out.println(searchList);
		return "customerService/notice/noticeSearchList";
	}
	
	
	
}
