package kr.or.ddit.controller.report;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IReportService;
import kr.or.ddit.vo.ReportCommentVO;
import kr.or.ddit.vo.ReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/report")
public class ReportModifyController {

	// 의존성 주입
	@Inject
	private IReportService reportService;
	
	// 게시글 수정 폼(화면)
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/updateReport", method = RequestMethod.GET)
	public String reportModifyForm(int reportNo, Model model, HttpSession session) {
		int proNo = (int) session.getAttribute("proNo");
		log.info("reportModifyForm() 실행");
		ReportVO reportVO = reportService.reportDetail(reportNo);
		model.addAttribute("report", reportVO);
		model.addAttribute("status", "u");
		model.addAttribute("proNo",proNo);
		model.addAttribute("isProjectPage", true);
		return "report/form";
	}

	// 게시글 수정(기능)
	@RequestMapping(value = "/updateReport", method = RequestMethod.POST)
	public String reportModify(HttpServletRequest req, ReportVO reportVO, Model model, RedirectAttributes ra) {
		String goPage = "";

		ServiceResult result = reportService.updateReport(req, reportVO);
		if (result == ServiceResult.OK) {
			ra.addFlashAttribute("message", "게시글 수정 완료!!");
			goPage = "redirect:/report/detail?reportNo=" + reportVO.getReportNo();
		} else {
			model.addAttribute("status", "u");
			model.addAttribute("report", reportVO);
			model.addAttribute("message", "수정에 실패하였습니다.");
			goPage = "report/updateReport";
		}
		return goPage;
	}
	
	// 게시글 삭제(기능)
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/deleteReport", method = RequestMethod.POST)
	public String reportDelete(HttpServletRequest req, int reportNo, Model model) {
		String goPage = "";

		ServiceResult result = reportService.deleteReport(req, reportNo);
		if (result == ServiceResult.OK) {// 삭제 성공
			goPage = "redirect:/report/list";
		} else {// 삭제 실패
			goPage = "redirect:/report/detail?reportNo=" + reportNo;
		}
		return goPage;
	}
	
	// 게시글 내 댓글/답글 수정
	@PreAuthorize("permitAll")
	@PostMapping("/modifyComment")
	public String modifyComment(ReportCommentVO commentVO) {
		log.info("commentVO : " + commentVO);

		reportService.modifyComment(commentVO);
		return "redirect:/report/detail?reportNo=" + commentVO.getReportNo();
	}

	// 게시글 내 댓글/답글 삭제
	@PreAuthorize("permitAll")
	@PostMapping("/deleteComment")
	public String deleteComment(ReportCommentVO commentVO) {
		log.info("commentVO : " + commentVO);

		reportService.deleteComment(commentVO);
		return "redirect:/report/detail?reportNo=" + commentVO.getReportNo();
	}
}
