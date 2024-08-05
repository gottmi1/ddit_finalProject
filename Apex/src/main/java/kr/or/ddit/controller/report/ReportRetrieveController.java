package kr.or.ddit.controller.report;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IReportService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReportCommentVO;
import kr.or.ddit.vo.ReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/report")
public class ReportRetrieveController {

	@Inject
	private IReportService reportService;

	@Resource(name = "uploadPath")
	private String resourcePath;

	// 메뉴이름이 프로젝트일때만 프로젝트 gnb를 보여준다
	@RequestMapping("/project/{projectId}")
	public String viewProject(@PathVariable String projectId, Model model) {
		model.addAttribute("isProjectPage", true);
		
		return "projectView";
	}
	
	// 일일업무보고 목록 조회
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/list")
	public String reportList(Model model,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currntPage,
//			@RequestParam(name = "pno", required = true) int pno,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			HttpSession session) {
		
		model.addAttribute("isProjectPage", true);
		int pno = (int) session.getAttribute("proNo");
		
		ReportVO reportVO = new ReportVO();
		reportVO.setProNo(pno);
		PaginationInfoVO<ReportVO> pagingVO = new PaginationInfoVO<ReportVO>();

		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);

			// 검색후 목록 페이지로 이동할때 검색된 내용을 적용시키기 위한 데이터 전달
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		pagingVO.setSearchVO(reportVO);


		// 총 4가지의 필드를 설정하기 위함
		// 현재 페이지를 전달 후, start/endRow, start/endPage 설정
		pagingVO.setCurrentPage(currntPage);
		// 총 게시글 수를 언ㄷ어온다
		int totalRecord = reportService.selectReportCount(pagingVO);
		// 총 게시글 수가 포함된 PaginationVO객체를 넘겨 주고 1페이지에 해당하는 10개의
		pagingVO.setTotalRecord(totalRecord);

		// 게시글을 얻어간다.
		List<ReportVO> reportList = reportService.selectReportList(pagingVO);
		log.info("reportList->reportList : " + reportList);

		pagingVO.setDataList(reportList);

		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("proNo",pno);
		return "report/list";
	}

	// 일일업무보고 상세
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/detail")
	public String reportDetail(int reportNo, Model model, Principal principal) {
		log.info("reportDetail()실행 -> reportNo : " + reportNo);
		model.addAttribute("isProjectPage", true);
		// 로그인 안되어있을 시
		if (principal == null) {
			return "redirect:/login";
		}

		ReportVO reportVO = reportService.reportDetail(reportNo);
		List<EmployeeVO> empList = reportService.selectEmpList();

		String empReportName = "";
		String reportProfileImg = "";
		for (EmployeeVO empVO : empList) {
			if (reportVO.getEmpNo() == empVO.getEmpNo()) {
				empReportName = empVO.getEmpName();
				reportProfileImg = empVO.getEmpProfileimg();
				break;
			}
		}
		reportVO.setEmpName(empReportName);
		reportVO.setProfileImg(reportProfileImg);

		log.info("reportDetail->reportVO : " + reportVO);

		List<ReportCommentVO> reportCommentList = reportService.selectComment(reportVO.getReportNo());
		log.info("!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!reportCommentList : " + reportCommentList);

		for (ReportCommentVO commentVO : reportCommentList) {
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

		model.addAttribute("report", reportVO);
		model.addAttribute("reportCommentList", reportCommentList);

		return "report/detail";
	}

	// 일일업무보고 상세 내 파일 다운로드
	@PostMapping("/downloadFile")
	public ResponseEntity<InputStreamResource> downloadCReportFile(@RequestParam String fileName,
			@RequestParam String originalFileName) throws FileNotFoundException {

		File file = new File(resourcePath + "/" + fileName);
		FileInputStream fileInputStream = new FileInputStream(file);
		InputStreamResource resource = new InputStreamResource(fileInputStream);
		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + originalFileName)
				.contentType(MediaType.APPLICATION_OCTET_STREAM).contentLength(file.length()).body(resource);
	}

}
