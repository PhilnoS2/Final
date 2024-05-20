package com.kh.goty.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goty.board.model.service.BoardService;
import com.kh.goty.board.model.vo.Board;
import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	@GetMapping("/insertsForm")
	public ModelAndView insertsForm(ModelAndView mv) {
		mv.setViewName("board/insertForm");
		return mv;
	}
	
	@PostMapping("/inserts")
	public ModelAndView inserts(ModelAndView mv, 
								Board board, 
								MultipartFile upFile, 
								HttpSession session) {
		
		// 첨부 파일 확인
		if(!upFile.getOriginalFilename().equals("")) {
			board.setOriginName(upFile.getOriginalFilename());
			board.setChangeName(saveFile(upFile, session));
			board.setImagePath("resources/uploadFiles/" + board.getChageName());
		}
		
		if(boardService.insert(board) > 0) {
			mv.addObject("alertMsg", "게시글 작성 성공")
			  .setViewName("redirect:all");
		} else {
			mv.addObject("errorMsg", "게시글 작성 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@GetMapping("/select/{boardNo}")
	public ModelAndView selectBoard(@PathVariable("boardNo") int boardNo, ModelAndView mv) {
		
		if(boardService.increaseCount(boardNo) > 0) {
			Board board = boardService.selectBoard(boardNo);
			mv.addObject("board",board)
			  .setViewName("board/selectBoard");
		} else {
			mv.addObject("errorMsg", "게시글을 조회하지 못했습니다.")
			.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmSS").format(new Date());
		
		int ranNum = (int)Math.random() * 90000 + 10000;
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	

	
}
