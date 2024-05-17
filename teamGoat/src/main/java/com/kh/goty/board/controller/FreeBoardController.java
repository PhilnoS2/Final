package com.kh.goty.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goty.board.model.service.BoardService;

@RestController
@RequestMapping("/freeboards")
public class FreeBoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/all")
	public ModelAndView selectListAll(ModelAndView mv) {
		//ArrayList listAll = boardService.selectListAll();
		
		mv.setViewName("board/selectListAll");
		
		return mv;
	}
	
}
