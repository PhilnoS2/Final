package com.kh.goty.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goty.board.model.service.BoardService;
import com.kh.goty.board.model.vo.Board;
import com.kh.goty.board.model.vo.Reply;
import com.kh.goty.board.model.vo.Report;
import com.kh.goty.board.model.vo.ResponseData;
import com.kh.goty.common.model.vo.PageInfo;
import com.kh.goty.common.template.Pagination;
import com.kh.goty.common.template.RdTemplates;
import com.kh.goty.member.model.vo.Member;

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
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
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

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.")
			  .setViewName("common/errorPage");
			return mv;
		}
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
		try {
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
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.")
			  .setViewName("common/errorPage");
			return mv;
		}
		
		return mv;
	}
	
	@GetMapping("/select/{boardNo}")
	public ModelAndView selectBoard(@PathVariable("boardNo") int boardNo,
									ModelAndView mv) {
		try {
			if(boardService.increaseCount(boardNo) > 0) {
				Board board = boardService.selectBoard(boardNo);
				mv.addObject("board",board)
				  .setViewName("board/selectBoard");
			} else {
				mv.addObject("errorMsg", "게시글을 조회하지 못했습니다.")
				.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.")
			  .setViewName("common/errorPage");
			return mv;
		}
		return mv;
	}
	
	
	@GetMapping("/category")
	public ModelAndView selectCategory(@RequestParam("categoryNo") int categoryNo,
									   @RequestParam(value="page", defaultValue="1") int page,
									   ModelAndView mv) {
		
		try {
			
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
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.")
			  .setViewName("common/errorPage");
			return mv;
		}

		return mv;
	}
	
	
	
	@GetMapping("/search")
	public ModelAndView searchBoards(@RequestParam("condition") String condition,
									 @RequestParam("keyword") String keyword,
									 @RequestParam(value="page", defaultValue="1") int page,
									 ModelAndView mv) {
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("condition", condition);
			map.put("keyword", keyword);
			map.put("categoryNo", 0);
			
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
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.")
			  .setViewName("common/errorPage");
			return mv;
		}
		
		return mv;
	}
	
	@GetMapping("/update/{boardNo}")
	public ModelAndView updateBoardForm(@PathVariable("boardNo") int boardNo,
								       ModelAndView mv,
								       HttpSession session) {
		
		try {
			Member member = (Member)session.getAttribute("loginMember");
			
			Board board = boardService.updateBoardForm(boardNo);
			
			if(board != null) {
				
				if(member.getMemberNo() != board.getMemberNo()) {
					mv.addObject("errorMsg", "올바른 접근이 아닙니다.")
					  .setViewName("common/errorPage");
					return mv;
				}
				
				mv.addObject("board", board)
				  .setViewName("board/updateForm");
			} else {
				mv.addObject("errorMsg", "게시글을 찾을 수 없습니다.")
				  .setViewName("common/errorPage");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.")
			  .setViewName("common/errorPage");
			return mv;
		}
		return mv;
	}
	
	@PostMapping("/update")
	public ModelAndView updateBoard(Board board,
									ModelAndView mv,
									MultipartFile upFile, 
									HttpSession session) {
		try{
			// 첨부 파일 확인
			if(!upFile.getOriginalFilename().equals("")) {
				board.setOriginName(upFile.getOriginalFilename());
				board.setChangeName(saveFile(upFile, session));
				board.setImagePath("resources/uploadFiles/" + board.getChageName());
			}
			
			if(boardService.updateBoard(board) > 0) {
				// log.info("board = {}", board);
				mv.addObject("alertMsg", "게시글 수정에 성공했습니다.")
				  .setViewName("redirect:select/"+board.getFreeBoardNo());
			} else {
				mv.addObject("errorMsg", "게시글 수정에 실패했습니다.")
				  .setViewName("common/errorPage");
			}

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("errorMsg", "서버 오류, 관리자에게 문의 하세요.")
			  .setViewName("common/errorPage");
			return mv;
		}
		
		return mv;
	}
	
	
	 @PostMapping("reply")
	 public ResponseEntity<ResponseData> save(@RequestBody Reply reply){
		  
		  ResponseData rd = null;
		  int result = 0;
		  Object data = null;
		  String rCode = "";
		  String message = ""; 
		  
		  try {
			  result = boardService.save(reply);
			  if(result > 0) {
				  data = result;
				  rCode = "299";
				  message =  "댓글 작성 성공!";
			  } else {
				  data = "댓글 찾기 실패 ";
				  rCode = "598";
				  message = "댓글을 찾지 못했습니다.";
			  }
			  
		  } catch(Exception e) {
			  e.printStackTrace();
			  rd = RdTemplates.getRd("서버쪽에 문제가 생겼습니다.", "599", "서버 오류, 빠르게 조치 하겠습니다."); 
		  }
		  
		  rd = RdTemplates.getRd(data, rCode, message);

		  return new ResponseEntity<ResponseData>(rd, RdTemplates.getHeader(), HttpStatus.OK);
	  }
	
	 
	@GetMapping("/replyList")
	public ResponseEntity<ResponseData> replyList(@RequestParam("boardNo") int boardNo,
												  @RequestParam("page") int page) {
		
		ResponseData rd = null;
		String rCode = "";
		String message = "";
		int count = 0;
		Map<String, Object> map = null;		
		List<Reply> replies = null;
			
		try {
			count = boardService.replyCount(boardNo);
			PageInfo pi = Pagination.getPageInfo(count,
												 page,
												 3,
												 3);
			
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			if(count > 0) {
				replies = boardService.findAllReply(boardNo,rowBounds);
				map =  new HashMap<String, Object>();
				map.put("pi", pi);
				map.put("replies", replies);
				rCode = "299";
				message =  "성공성공!";
			} else {
				rCode = "298";
				message = "댓글이 존재하지 않습니다.";
			}
			  
			rd = RdTemplates.getRd(map, rCode, message); 
		  } catch(Exception e) {
			  e.printStackTrace();
			  rd = RdTemplates.getRd("서버쪽에 문제가 생겼습니다.", "599", "서버 오류, 빠르게 조치 하겠습니다."); 
		  }	 
		  
		return new ResponseEntity<ResponseData>(rd, RdTemplates.getHeader(), HttpStatus.OK);
	}
	
	
	@PostMapping("/report")
	public ResponseEntity<ResponseData> reportReply(@RequestBody Report report) {
		ResponseData rd = null;
		String rCode = "";
		String message = "";
		String result = "";
		
		try {
			if(boardService.insertReport(report) > 0) {
			  result = "댓글신고성공";
			  rCode = "299";
			  message =  "댓글 신고에 성공했습니다.";
			} else {
			  result = "댓글신고실패";
			  rCode = "297";
			  message =  "댓글 신고에 실패했습니다.";
			}
			rd = RdTemplates.getRd(result, rCode, message); 
			
		} catch(Exception e) {
			e.printStackTrace();
			rd = RdTemplates.getRd("서버쪽에 문제가 생겼습니다.", "599", "서버 오류, 빠르게 조치 하겠습니다."); 
		}
		  	
		return new ResponseEntity<ResponseData>(rd, RdTemplates.getHeader(), HttpStatus.OK);
	}
	
	
	@PutMapping("/delete/{boardNo}")
	public ResponseEntity<ResponseData> deleteBoard(@PathVariable("boardNo") int boardNo){
		ResponseData rd = null;
		String rCode = "";
		String message = "";
		String result = "";
		
		try {
			if(boardService.deleteBoard(boardNo)> 0) {
				 result = "게시글 삭제 성공";
				 rCode = "299";
				 message =  "게시글 삭제에 성공했습니다.";
			} else {
				 result = "게시글 삭제 실패";
				 rCode = "297";
				 message =  "게시글 삭제에 실패했습니다.";
			}
			rd = RdTemplates.getRd(result, rCode, message); 
			
		} catch(Exception e) {
			e.printStackTrace();
			rd = RdTemplates.getRd("서버쪽에 문제가 생겼습니다.", "599", "빠르게 조치 하겠습니다."); 
		}
		
		return new ResponseEntity<ResponseData>(rd, RdTemplates.getHeader(), HttpStatus.OK);
	}
	
	@PutMapping("/deleteReply/{replyNo}")
	public ResponseEntity<ResponseData> deleteReply(@PathVariable("replyNo") int replyNo){
		ResponseData rd = null;
		String rCode = "";
		String message = "";
		String result = "";
		
		try {
			if(boardService.deleteReply(replyNo)> 0) {
				 result = "댓글 삭제 성공";
				 rCode = "299";
				 message =  "댓글 삭제에 성공했습니다.";
			} else {
				 result = "댓글 삭제 실패";
				 rCode = "297";
				 message =  "댓글 삭제에 실패했습니다.";
			}
			rd = RdTemplates.getRd(result, rCode, message); 
			
		} catch(Exception e) {
			e.printStackTrace();
			rd = RdTemplates.getRd("서버쪽에 문제가 생겼습니다.", "599", "빠르게 조치 하겠습니다."); 
		}
		
		return new ResponseEntity<ResponseData>(rd, RdTemplates.getHeader(), HttpStatus.OK);
	}
	
	
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ExceptionHandler
	public ResponseEntity<ResponseData> illegalExHandler(IOException ex){
		ResponseData rd = null;
		Object data = null;
		String rCode = "";
		String message = "";

		// 어떤 예외인지에 따라 반환해주는 값 변경
		ex.printStackTrace();
		log.info("err = {}", ex);
		
		data = "illegal_input";
		rCode = "590";
		message = "올바른 입력이 아닙니다.";
		
		rd = RdTemplates.getRd(data, rCode, message); 
		
		return new ResponseEntity<ResponseData>(rd, RdTemplates.getHeader(), HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmSS").format(new Date());
		
		int ranNum = ((int)Math.random() * 90000) + 10000;
		
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
