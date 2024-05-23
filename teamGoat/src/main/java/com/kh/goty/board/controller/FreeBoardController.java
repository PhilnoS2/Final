package com.kh.goty.board.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goty.board.model.service.BoardService;
import com.kh.goty.board.model.vo.Board;
import com.kh.goty.board.model.vo.Reply;
import com.kh.goty.board.model.vo.ResponseData;
import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


/*
전체조회 -> freeboard
검색 -> freeboard/검색어/검색조건
하나조회 -> freeboard/보드넘버
*/

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/freeboards")
public class FreeBoardController {
	
	//@Autowired
	//private BoardService boardService;
	private final BoardService boardService;

	@GetMapping("/all")
	public ModelAndView selectListAll(@RequestParam(value="page", defaultValue="1") int page,
									 ModelAndView mv) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 동적sql 조건
		map.put("categoryNo", 0);
		
		PageInfo pageInfo = 
				Pagination.getPageInfo(boardService.selectListCount(map),
												  page,
												  5,
												  3);
		
		ArrayList<Board> listAll =
				(ArrayList<Board>)boardService.selectListAll(pageInfo, map);
		
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
	public ModelAndView selectBoard(@PathVariable("boardNo") int boardNo,
									ModelAndView mv) {
		
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
	
	
	@GetMapping("/category")
	public ModelAndView selectCategory(@RequestParam("categoryNo") int categoryNo,
									   @RequestParam(value="page", defaultValue="1") int page,
									   ModelAndView mv) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		
		PageInfo pageInfo = 
				Pagination.getPageInfo(boardService.selectListCount(map),
												  page,
												  5,
												  3);
		ArrayList<Board> listAll = (ArrayList<Board>)boardService.selectListAll(pageInfo, map);
		
		mv.addObject("listAll", listAll)
		  .addObject("pi", pageInfo)
		  .addObject("categoryNo", categoryNo)
		  .setViewName("board/selectListAll");
		
		return mv;
	}
	
	
	
	@GetMapping("/search")
	public ModelAndView searchBoards(@RequestParam("condition") String condition,
									@RequestParam("keyword") String keyword,
									@RequestParam(value="page", defaultValue="1") int page,
									ModelAndView mv) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		// 서치 데이터 페이지네이션하기
		PageInfo pageInfo = 
				Pagination.getPageInfo(boardService.selectListCount(map),
												  page,
												  5,
												  3);

		ArrayList<Board> listAll =
				(ArrayList<Board>)boardService.selectListAll(pageInfo, map);
		
		mv.addObject("listAll", listAll)
		  .addObject("pi", pageInfo)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("board/selectListAll");
		return mv;
	}
	
	@GetMapping("/update/{boardNo}")
	public ModelAndView updateBoardForm(@PathVariable("boardNo") int boardNo,
								ModelAndView mv) {
		Board board = boardService.updateBoardForm(boardNo);
		
		if(board != null) {
			log.info("board = {}", board);
			mv.addObject("board", board)
			  .setViewName("board/updateForm");
		} else {
			mv.addObject("errorMsg", "게시글을 찾을 수 없습니다.")
			  .setViewName("common/errorPage");
		}
		return mv;
	}
	
	@PostMapping("/update")
	public ModelAndView updateBoard(Board board,
									ModelAndView mv,
									MultipartFile upFile, 
									HttpSession session) {
		
		// 첨부 파일 확인
		if(!upFile.getOriginalFilename().equals("")) {
			board.setOriginName(upFile.getOriginalFilename());
			board.setChangeName(saveFile(upFile, session));
			board.setImagePath("resources/uploadFiles/" + board.getChageName());
		}
		
		// log.info("board = {}", board);
		
		if(boardService.updateBoard(board) > 0) {
			mv.addObject("alertMsg", "게시글 수정에 성공했습니다.")
			  .setViewName("redirect:select/"+board.getFreeBoardNo());
		} else {
			mv.addObject("errorMsg", "게시글 수정에 실패했습니다.")
			  .setViewName("common/errorPage");
		}

		return mv;
	}
	
	
	 @PostMapping("review")
	  public ResponseEntity<ResponseData> save(@RequestBody Reply reply){
		  log.info("reply = {}", reply);
		  ResponseData rd = null;
		  int result = 0;
		  
		  try {
			  result = boardService.save(reply);
		  } catch(Exception e) {
			  rd = ResponseData.builder()
					  		   .data("서버쪽에 문제가 생겼습니다.")
					  		   .responseCode("599")
					  		   .message("미안;")
					  		   .build();
		  }
		  // System.out.println(result);
		  
		  HttpHeaders headers = new HttpHeaders();
		  headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		  rd = ResponseData.builder()
				           .data("댓글 달기 성공")
				           .responseCode("299")
				           .message("성공성공!")
				           .build();
		  
		  return new ResponseEntity<ResponseData>(rd, headers, HttpStatus.OK);
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
