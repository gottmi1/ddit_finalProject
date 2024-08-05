package kr.or.ddit.controller.dashboard;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IDashboardService;
import kr.or.ddit.service.IMyProjectService;
import kr.or.ddit.service.IWorksService;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.ManagerVO;
import kr.or.ddit.vo.ProjectsVO;
import kr.or.ddit.vo.WorksVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DashboardController {
	
	@Inject
	private IDashboardService dashboardService;
	
	@Inject
	private IMyProjectService myProjectService;
	
	
	// 메뉴이름이 대시보드일때만 대시보드 gnb를 보여준다
	@RequestMapping("/dashboard/{projectId}")
	public String viewDashboard(@PathVariable String projectId, Model model) {
		model.addAttribute("isDashboardPage", true);
		
		return "dashboardView";
	}
		
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/dashboard")
	public String DashboardMain(Model model, HttpSession session, @RequestParam(required = false) String dashStatus) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();		
		
    	// 관리자만 상단 gnb 보이게
    	if(empNo == 1) {
    		model.addAttribute("isDashboardPage", true);
    	}
    		
		int proNo = 0;
		if(session.getAttribute("proNo") != null) {
			proNo = (int)session.getAttribute("proNo");
		} else {
			proNo = dashboardService.selectFirstProjectFromEmpNo(empNo);
		}
		
		boolean hasProjects = proNo != 0;
		
		model.addAttribute("hasProjects", hasProjects);
		
		getWorkCountsToModel(model,proNo);
		getWorkCompetionOverTimeToModel(model,proNo);
		
		if(empNo == 1) {
			return "redirect:/dashboard_admin_project";
		}
			
		
		return "redirect:/userDash/home";
	}
	
	private void getWorkCountsToModel(Model model, int proNo) {
		log.info("#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ prjectNumber : " + proNo);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("proNo", proNo);
		
		// 총 작업 개수 가져오기
		int totalWorksCount = dashboardService.getTotalWorksCount(paramMap);
		model.addAttribute("totalWorksCount", totalWorksCount);
		
		// 미완료된 작업 개수 가져오기
		List<Integer> pendingStatuses = Arrays.asList(1, 2, 4);
		paramMap.put("statusArr", pendingStatuses);
		int pendingWorksCount = dashboardService.countWorksByMultipleStatus(paramMap);
		model.addAttribute("pendingWorksCount", pendingWorksCount);
		
		// 완료된 작업 개수 가져오기
		paramMap.put("status", 3);
		int completedWorksCount = dashboardService.countWorksByStatus(paramMap);
		model.addAttribute("completedWorksCount", completedWorksCount);
		
		// 마감일이 지난 작업 개수 가져오기
		int overdueWorksCount = dashboardService.countOverdueWorks(paramMap);
		model.addAttribute("overdueWorksCount", overdueWorksCount);
		
		// chart - 각 상태별 미완료 작업 수 가져오기
		Map<String, Integer> pendingWorksByStatus = new HashMap<>();
		for(int status : pendingStatuses) {
			paramMap.put("status", status);
			pendingWorksByStatus.put("status" + status, dashboardService.countWorksByStatus(paramMap));
		}
		model.addAttribute("pendingWorksByStatus", pendingWorksByStatus);
		
		// 상태별 작업 개수(도넛차트)
		Map<String, Integer> workStatusData = new HashMap<>();
		workStatusData.put("completed", completedWorksCount);
		workStatusData.put("pending", pendingWorksCount);
		workStatusData.put("overdue", overdueWorksCount);
		model.addAttribute("workStatusData", workStatusData);
		
		// 담당자별 예정된 작업 수 가져오기
        List<ManagerVO> worksByAssignee = dashboardService.getWorksByAssignee(paramMap);
        model.addAttribute("worksByAssigneeData", worksByAssignee);
	}
	
	private void getWorkCompetionOverTimeToModel(Model model,int proNo) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("proNo", proNo);
		
		// 시간 경과에 따른 작업 완료 수 가져오기
		Map<String, List<Object>> workCompletionOverTime = dashboardService.getWorkCompletionOverTime(paramMap);
		model.addAttribute("workCompletionOverTime", workCompletionOverTime);
	}
	
	
	
	
	
	
	
	// 프로젝트 내부 통계 탭 대시보드
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/project/dashboard")
	public String projectDashboard(Model model, HttpSession session) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();		
		
		int proNo = 0;
		if(session.getAttribute("proNo") != null) {
			proNo = (int)session.getAttribute("proNo");
		} else {
			proNo = dashboardService.selectFirstProjectFromEmpNo(empNo);
		}
		
		model.addAttribute("isProjectPage", true);
		
		boolean hasProjects = proNo != 0;
		
		model.addAttribute("hasProjects", hasProjects);
		
		getWorkCountsToModel(model,proNo);
		getWorkCompetionOverTimeToModel(model,proNo);
		return "dashboard/dashboard";
	}
}
