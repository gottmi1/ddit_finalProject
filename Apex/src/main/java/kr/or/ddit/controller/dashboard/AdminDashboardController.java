package kr.or.ddit.controller.dashboard;

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
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IAdminDashService;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.ManagerVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminDashboardController {

	@Inject
	private IAdminDashService service;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/dashboard_admin_project")
	public String DashboardProject(Model model, HttpSession session, @RequestParam(required = false) String dashStatus) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();		
    	
		model.addAttribute("isDashboardPage", true);
		
		getProjectCnt(model);
		getProjectCompetionOverTimeToModel(model);
		
		return "dashboard/dashboard_admin_project";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/dashboard_admin_work")
	public String DashboardWork(Model model, HttpSession session, @RequestParam(required = false) String dashStatus) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();		
		
		model.addAttribute("isDashboardPage", true);
    		
		getWorkCnt(model);
		getWorkCompetionOverTimeToModel(model);
		return "dashboard/dashboard_admin_work";
	}
	
	
	private void getProjectCnt(Model model) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("default", 1);
		
		// 총 프로젝트 개수 가져오기
		int totalProjectCount = service.getTotalProjectCount(paramMap);
		model.addAttribute("totalProjectCount", totalProjectCount);
		
		// 완료된 프로젝트 개수 가져오기
		paramMap.put("projectStatus", 4);
		int completedProjectCount = service.countProjectByStatus(paramMap);
		model.addAttribute("completedProjectCount", completedProjectCount);		
		
		
		// 승인대기중 프로젝트 개수 가져오기
		paramMap.put("projectStatus", 1);
		int waitingProejctCount = service.countProjectByStatus(paramMap);
		model.addAttribute("waitingProejctCount", waitingProejctCount);
		
		// 진행중인 프로젝트 개수 가져오기
		paramMap.put("projectStatus", 2);
		int ongoingProejctCount = service.countProjectByStatus(paramMap);
		model.addAttribute("ongoingProejctCount", ongoingProejctCount);

		// 반려중인 프로젝트 개수 가져오기
		paramMap.put("projectStatus", 3);
		int returnProejctCount = service.countProjectByStatus(paramMap);
		model.addAttribute("ongoingProejctCount", ongoingProejctCount);
		
		// 막대 차트
		int[] barChartArr = {1,2,3};
		Map<String, Integer> barChartStatus = new HashMap<>();
		for(int status : barChartArr) {
			paramMap.put("projectStatus", status);
			barChartStatus.put("status" + status, service.countProjectByStatus(paramMap));
		}
		model.addAttribute("pendingWorksByStatus", barChartStatus);
		
		// 상태별 작업 개수(도넛차트)
		Map<String, Integer> workStatusData = new HashMap<>();
		workStatusData.put("completed", completedProjectCount);
		workStatusData.put("wating", waitingProejctCount);
		workStatusData.put("ongoing", ongoingProejctCount);
		model.addAttribute("workStatusData", workStatusData);
//		
//		// 프로젝트 별 진척률 가져와야 함
//        List<ManagerVO> worksByAssignee = service.getProjectByAssignee(paramMap);
//        model.addAttribute("worksByAssigneeData", worksByAssignee);
	}
	
	private void getProjectCompetionOverTimeToModel(Model model) {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		// 시간 경과에 따른 작업 완료 수 가져오기
		Map<String, List<Object>> projectCompletionOverTime = service.getProjectCompletionOverTime(paramMap);
		model.addAttribute("workCompletionOverTime", projectCompletionOverTime);
	}
	
	private void getWorkCnt(Model model) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("default", 1);
		
		// 총 작업 개수
		int totalWorkCount = service.getTotalWorkCount(paramMap);
		model.addAttribute("totalWorkCount", totalWorkCount);
		
		// 완료된 작업 개수
		paramMap.put("workStatus", 1);
		int completedWorkCount = service.countWorkByStatus(paramMap);
		model.addAttribute("completedWorkCount", completedWorkCount);		
		
		
		// 미완료 작업 개수
		paramMap.put("workStatus", 2);
		int notCompletedCount = service.countWorkByStatus(paramMap);
		model.addAttribute("notCompletedCount", notCompletedCount);
		
		// 마감일 지난 작업
		paramMap.put("workStatus", 0);
		int overWorkCount = service.countOverTimeWork(paramMap);
		model.addAttribute("overWorkCount", overWorkCount);
		
		// 막대 차트
		int[] barChartArr = {1,2,4};
		Map<String, Integer> barChartStatus = new HashMap<>();
		for(int status : barChartArr) {
			paramMap.put("workStatus", status);
			barChartStatus.put("status" + status, service.notCompleteWorkDetail(paramMap));
		}
		model.addAttribute("pendingWorksByStatus", barChartStatus);
		
		// 상태별 작업 개수(도넛차트)
		Map<String, Integer> workStatusData = new HashMap<>();
		// 총
		workStatusData.put("total", totalWorkCount);
		// 완료
		workStatusData.put("completed", completedWorkCount);
		// 미완료
		workStatusData.put("notCompleted", notCompletedCount);
		// 시간 지난거
		workStatusData.put("over", overWorkCount);
		
		model.addAttribute("workStatusData", workStatusData);
		
        List<ManagerVO> worksByAssignee = service.getWorkByAssignee(paramMap);
        model.addAttribute("worksByAssigneeData", worksByAssignee);
	}
	
	private void getWorkCompetionOverTimeToModel(Model model) {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		// 시간 경과에 따른 작업 완료 수 가져오기
		Map<String, List<Object>> workCompletionOverTime = service.getWorkCompletionOverTime(paramMap);
		model.addAttribute("workCompletionOverTime", workCompletionOverTime);
	}
	
}
