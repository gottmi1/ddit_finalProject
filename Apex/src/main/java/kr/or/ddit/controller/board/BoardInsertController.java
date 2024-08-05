package kr.or.ddit.controller.board;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardCommentVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardInsertController {

	// 의존성 주입
	@Inject
	public IBoardService boardService;
	
	// 게시글 등록 폼
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String registerBoardForm() {
		log.info("registerBoardForm() 실행");
		return "board/form";
	}
	
	// 게시글 등록(기능)
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertBoard(HttpServletRequest req, RedirectAttributes ra, BoardVO boardVO, Model model, MultipartFile[] fileList)
			throws Exception {

		log.info("insertBoard->boardVO : " + boardVO);

		String goPage = "";

		Map<String, String> errors = new HashMap<String, String>();
		if (StringUtils.isBlank(boardVO.getBoTitle())) {
			errors.put("boTitle", "제목을 입력해주세요!!");
		}
		
		if (StringUtils.isBlank(boardVO.getBoContent())) {
			errors.put("boContent", "내용을 입력해주세요!!");
		}
		
		List<MultipartFile> validFiles = Arrays.stream(fileList)
                .filter(file -> !file.isEmpty())
                .collect(Collectors.toList());
		
		if(validFiles.size() > 0) {
//			createFile(fileList,boardVO.getBoNo());
			boardService.insertBoard(req, boardVO);
		}

		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("boardVO", boardVO);
			goPage = "board/form";
		} else {
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			EmployeeVO employeeVO = user.getEmployeeVO();

			if (employeeVO != null) {
				boardVO.setEmpNo(employeeVO.getEmpNo());
				ServiceResult result = boardService.insertBoard(req, boardVO);
				if (result.equals(ServiceResult.OK)) {
					goPage = "redirect:/board/detail?boNo=" + boardVO.getBoNo();
				} else {
					model.addAttribute("boardVO", boardVO);
					model.addAttribute("msg", "서버에러입니다. 다시 시도해주세요");
					goPage = "board/form";
				}
			} else {
				ra.addFlashAttribute("message", "로그인 후에 사용가능합니다.");
				goPage = "redirect:/login/loginForm";
			}
		}
		return goPage;
	}

	/*
	 * 요청URI : /board/insert 요청파라미터 : {boNo=26,empNo=1,boCoContent=fasd} 요청방식 : post
	 * 
	 * required=false => 선택
	 */
	

	// 댓글/답글 등록
	@PostMapping("/addComment")
	public String addComment(BoardCommentVO commentVO) {
		
		boardService.addComment(commentVO);
		return "redirect:/board/detail?boNo=" + commentVO.getBoNo();
	}
}
