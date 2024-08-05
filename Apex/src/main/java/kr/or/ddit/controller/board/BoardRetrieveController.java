package kr.or.ddit.controller.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.security.Principal;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardCommentVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardRetrieveController {

	@Inject
	private IBoardService boardService;

	@Resource(name = "uploadPath")
	private String resourcePath;

	/// list
	/// list?page=1
	/// list?page=

	// 자유게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String boardList(Model model,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord ,
			HttpSession session) {
		log.info("boardList()  실행");

		session.setAttribute("proNo", null);
		
		PaginationInfoVO<BoardVO> pagingVO = new PaginationInfoVO<BoardVO>();

		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);

			// 검색후 목록 페이지로 이동할때 검색된 내용을 적용시키기 위한 데이터 전달
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
 		}

		// 총 4가지의 필드를 설정하기 위함
		// 현재 페이지를 전달 후, start/endRow, start/endPage 설정
		pagingVO.setCurrentPage(currentPage);
		// 총 게시글 수를 언ㄷ어온다
		int totalRecord = boardService.selectBoardCount(pagingVO);
		// 총 게시글 수가 포함된 PaginationVO객체를 넘겨 주고 1페이지에 해당하는 10개의
		pagingVO.setTotalRecord(totalRecord);

		// 게시글을 얻어간다.
		List<BoardVO> boardList = boardService.selectBoardlist(pagingVO);
//		for (BoardVO v : boardList) {
//			// 토큰 값을 만드는 작업을 실행 
//			
//			String token = v.getBoNo() +"_"+ v.getBoWriter()+"_"+System.currentTimeMillis();
//			token = 암호화모듈(token);
//			
//			v.setToken(token);  // ---->  hidden 
//			
//			
//		}
		
		
		
		log.info("boardList->boardList : " + boardList);

		pagingVO.setDataList(boardList);

		model.addAttribute("pagingVO", pagingVO);
		return "board/list";
	}

	// 자유게시글 상세
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/detail")
	public String boardDetail(int boNo, Model model, Principal principal) {
		log.info("boardDetail()실행 -> boNo : " + boNo);

		// 로그인 안되어있을 시
		if (principal == null) {
			return "redirect:/login";
		}

		BoardVO boardVO = boardService.boardDetail(boNo);
		List<EmployeeVO> empList = boardService.selectEmpList();

		String empBoardName = "";
		String boardProfileImg = "";
		for (EmployeeVO empVO : empList) {
			if (boardVO.getEmpNo() == empVO.getEmpNo()) {
				empBoardName = empVO.getEmpName();
				boardProfileImg = empVO.getEmpProfileimg();
				break;
			}
		}
		boardVO.setEmpName(empBoardName);
		boardVO.setProfileImg(boardProfileImg);

		log.info("boardDetail->boardVO : " + boardVO);
		/*
		 * BoardVO(boNo=0, empNo=0, boTitle=경제대통령, boContent=<p>ㅁㄴㅁㅁㄴㅁㄴ</p> , boHit=38,
		 * boDate=null, boModdate=Sat Jul 06 12:13:26 KST 2024, boDelyn=null,
		 * boWriter=null, rnum=0, delBoardNo=null, boFiles=null, fileNo=0,
		 * fileDetailList=null,
		 * 
		 * boFile=FilesVO(fileNo=0, fileRegdate=null, fileWhereNo=0, fileWherePk=0,
		 * fileList=[ FileDetailVO(item=null, fileDetailNo=0, fileNo=0, fileSaveName=null, fileOriginName=다운로드 (1).jpg, fileFancysize=null, fileSize=10103, fileUrl=null, fileMime=image/jpeg)
		 * 	FileDetailVO(item=null, fileDetailNo=0, fileNo=0, fileSaveName=null, fileOriginName=다운로드 (1).jpg, fileFancysize=null, fileSize=10103, fileUrl=null, fileMime=image/jpeg),
		 *  FileDetailVO(item=null, fileDetailNo=0, fileNo=0, fileSaveName=null, fileOriginName=다운로드 (1).jpg, fileFancysize=null, fileSize=10103, fileUrl=null, fileMime=image/jpeg) ] , fileDetailVO=null))
		 */

		List<BoardCommentVO> boardCommentList = boardService.selectComment(boardVO.getBoNo());
		log.info("!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!boardCommentList : " + boardCommentList);

		for (BoardCommentVO commentVO : boardCommentList) {
			String empName = "";
			String profileImg = "";
			for (EmployeeVO empVO : empList) {
				if (commentVO.getEmpNo() == empVO.getEmpNo()) {
					empName = empVO.getEmpName();
					profileImg = empVO.getEmpProfileimg();
					break;
				}
			}
			commentVO.setEmpName(empName);
			commentVO.setProfileImg(profileImg);
		}

		model.addAttribute("board", boardVO);
		model.addAttribute("boardCommentList", boardCommentList);

		return "board/detail";
	}

	// 자유게시판 상세 내 파일 다운로드
	@PostMapping("/downloadFile")
	public ResponseEntity<InputStreamResource> downloadCBoardFile(@RequestParam String fileName,
			@RequestParam String originalFileName) throws FileNotFoundException {

		File file = new File(resourcePath + "/" + fileName);
		FileInputStream fileInputStream = new FileInputStream(file);
		InputStreamResource resource = new InputStreamResource(fileInputStream);
		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + originalFileName)
				.contentType(MediaType.APPLICATION_OCTET_STREAM).contentLength(file.length()).body(resource);
	}

}
