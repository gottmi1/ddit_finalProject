package kr.or.ddit.controller.report;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IReportService;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.ReportCommentVO;
import kr.or.ddit.vo.ReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/report")
public class ReportInsertController {

	// 의존성 주입
	@Inject
	public IReportService reportService;
	
	// 게시글 등록 폼
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String registerReportForm(Model model,HttpSession session) {
		log.info("registerReportForm() 실행");
		int proNo = (int) session.getAttribute("proNo");
		model.addAttribute("proNo",proNo);
		model.addAttribute("isProjectPage", true);
		return "report/form";
	}
	
	// 게시글 등록(기능)
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertReport(HttpServletRequest req, RedirectAttributes ra, ReportVO reportVO, Model model, MultipartFile[] fileList)
			throws Exception {

		log.info("insertReport->reportVO : " + reportVO);

		String goPage = "";

		Map<String, String> errors = new HashMap<String, String>();
		if (StringUtils.isBlank(reportVO.getReportTitle())) {
			errors.put("reportTitle", "제목을 입력해주세요!!");
		}
		
		if (StringUtils.isBlank(reportVO.getReportContent())) {
			errors.put("reportContent", "내용을 입력해주세요!!");
		}
		
		List<MultipartFile> validFiles = Arrays.stream(fileList)
                .filter(file -> !file.isEmpty())
                .collect(Collectors.toList());
		
		if(validFiles.size() > 0) {
//			createFile(fileList,boardVO.getBoNo());
			reportService.insertReport(req, reportVO);
		}

		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("reportVO", reportVO);
			goPage = "report/form";
		} else {
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			EmployeeVO employeeVO = user.getEmployeeVO();

			if (employeeVO != null) {
				reportVO.setEmpNo(employeeVO.getEmpNo());
				ServiceResult result = reportService.insertReport(req, reportVO);
				if (result.equals(ServiceResult.OK)) {
					goPage = "redirect:/report/detail?reportNo=" + reportVO.getReportNo();
				} else {
					model.addAttribute("reportVO", reportVO);
					model.addAttribute("msg", "서버에러입니다. 다시 시도해주세요");
					goPage = "report/form";
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
	@PreAuthorize("permitAll")
	@PostMapping("/addComment")
	public String addComment(ReportCommentVO commentVO) {
		
		reportService.addComment(commentVO);
		return "redirect:/report/detail?reportNo=" + commentVO.getReportNo();
	}
}
