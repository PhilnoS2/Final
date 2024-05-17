package com.kh.goty.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goty.board.model.service.BoardService;
import com.kh.goty.board.model.vo.Board;
import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;

@RestController
@RequestMapping("/freeboards")
public class FreeBoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/all")
	public ModelAndView selectListAll(@RequestParam(value="page", defaultValue="1") int page,
									 ModelAndView mv) {
		PageInfo pageInfo = Pagination.getPageInfo(boardService.selectListCount(),
												  page,
												  5,
												  3);
		
		ArrayList<Board> listAll = (ArrayList<Board>)boardService.selectListAll(pageInfo);
		
		mv.addObject("listAll", listAll)
		  .addObject("pi", pageInfo)
		  .setViewName("board/selectListAll");
		return mv;
	}
	
}
