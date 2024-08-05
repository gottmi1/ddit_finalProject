package kr.or.ddit.controller.board;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardCommentVO;
import kr.or.ddit.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardModifyController {

	// 의존성 주입
	@Inject
	private IBoardService boardService;

	// 게시글 수정 폼(화면)
	@RequestMapping(value = "/updateBoard", method = RequestMethod.GET)
	public String boardModifyForm(int boNo, Model model) {
		log.info("boardModifyForm() 실행");
		BoardVO boardVO = boardService.boardDetail(boNo);
		model.addAttribute("board", boardVO);
		model.addAttribute("status", "u");
		return "board/updateForm";
	}

	// 게시글 수정(기능)
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	public String boardModify(HttpServletRequest req, BoardVO boardVO, Model model, RedirectAttributes ra) {
		/*
		BoardVO(boNo=38, empNo=0, boTitle=1112, boContent=<p>222233</p>
		, boHit=0, boDate=null, boModdate=null, boDelyn=null, empName=null, profileImg=null, boWriter=null, boardCommentList=null, boardCommentCount=0, rnum=0, delBoardNo=null, 
		boFiles=[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@efda424], 
		fileNo=0, fileDetailList=[FileDetailVO(item=org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@efda424, fileDetailNo=0, fileNo=0, fileSaveName=null, fileOriginName=face.jpg, fileFancysize=null, fileSize=45987, fileUrl=null, fileMime=image/jpeg, imgUrl=null)], boFile=null)
		 */
		log.info("boardModify->boardVO : " + boardVO);
		
		
//		String token = boardVO.getToken();
//		
//		token = 복호화모듈(token); 
		
		
		
		String goPage = "";

		ServiceResult result = boardService.updateBoard(req, boardVO);
		if (result == ServiceResult.OK) {
			ra.addFlashAttribute("message", "게시글 수정 완료!!");
			goPage = "redirect:/board/detail?boNo=" + boardVO.getBoNo();
		} else {
			model.addAttribute("status", "u");
			model.addAttribute("board", boardVO);
			model.addAttribute("message", "수정에 실패하였습니다.");
			goPage = "board/updateBoard";
		}
		return goPage;
	}
	
	// 게시글 삭제(기능)
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.POST)
	public String boardDelete(HttpServletRequest req, int boNo, Model model) {
		String goPage = "";

		ServiceResult result = boardService.deleteBoard(req, boNo);
		if (result == ServiceResult.OK) {// 삭제 성공
			goPage = "redirect:/board/list";
		} else {// 삭제 실패
			goPage = "redirect:/board/detail?boNo=" + boNo;
		}
		return goPage;
	}
	
	
	
	// 게시글 내 댓글/답글 수정
	@PostMapping("/modifyComment")
	public String modifyComment(BoardCommentVO commentVO) {
		log.info("commentVO : " + commentVO);

		boardService.modifyComment(commentVO);
		return "redirect:/board/detail?boNo=" + commentVO.getBoNo();
	}

	// 게시글 내 댓글/답글 삭제
	@PostMapping("/deleteComment")
	public String deleteComment(BoardCommentVO commentVO) {
		log.info("commentVO : " + commentVO);

		boardService.deleteComment(commentVO);
		return "redirect:/board/detail?boNo=" + commentVO.getBoNo();
	}
}
