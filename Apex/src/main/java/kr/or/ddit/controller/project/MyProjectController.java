package kr.or.ddit.controller.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.IMyProjectService;
import kr.or.ddit.service.IProjectService;
import kr.or.ddit.service.IWorksService;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.ManagerVO;
import kr.or.ddit.vo.ProjectReportVO;
import kr.or.ddit.vo.ProjectsVO;
import kr.or.ddit.vo.WorksVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyProjectController {

	@Inject
	private IProjectService projectService;
	
	@Inject
	private IWorksService workService;
	
	@Inject
	private IMyProjectService myProjectService;
	
	// 등록/수정 담당자 선택 시 프로젝트 넘버에 따라 가져오도록 만듬
	@PostMapping("/selectMyProjectList")
	public ResponseEntity<List<ProjectsVO>> selectProjectList(HttpSession session) {
		// empNo
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int empNo = user.getEmployeeVO().getEmpNo();
		
		List<ProjectsVO> projectList = new ArrayList<ProjectsVO>();
		Map<String,Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("empNo", empNo);
		paramMap.put("status", 5);

		projectList = myProjectService.selectMyProject(paramMap);
		return new ResponseEntity<List<ProjectsVO>>(projectList , HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/myProject")
	public String myProjectList(Model model, @RequestParam(name="filter", required = false, defaultValue = "0") int currentFilter) {
		
		// empNo
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
    	
		List<ProjectsVO> projectList = new ArrayList<ProjectsVO>();
		Map<String,Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("empNo", empNo);
		
		paramMap.put("status", currentFilter);
		projectList = myProjectService.selectMyProject(paramMap);
			 
		List<EmployeeVO> empList = workService.selectEmpList();
		
		// 이름/프사 넣기
		for(ProjectsVO proejctVO : projectList) {
			String leaderName = "";
			String profileImg = "";
			for(EmployeeVO empVO : empList) {
				if(proejctVO.getProLeader() == empVO.getEmpNo()) {
					leaderName = empVO.getEmpName();
					 profileImg = empVO.getEmpProfileimg();
					 break;
				}
			}
			proejctVO.setLeaderProfileimg(profileImg);
			proejctVO.setLeaderName(leaderName);
		}
		// 해당 프로젝트의 일감 카운트와 완료된(WORK_PROG가 100인)일감의 카운트를 비교하여 완료상태인지 )
		for(ProjectsVO proejctVO : projectList) {
			
			int workSize = myProjectService.selectWorkCnt(proejctVO.getProNo());
			int completeWorkCnt = myProjectService.selectCompleteWorkCnt(proejctVO.getProNo());
			
			if(completeWorkCnt != 0 && workSize == completeWorkCnt) {
				proejctVO.setProjectComplete(true);
			}
		}
		
		model.addAttribute("selectedStatus", currentFilter);
		model.addAttribute("projectList",projectList);
		
		return "project/myProject";
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/myProject/modifyProject")
	public String modifyProject(ProjectsVO projectVO, RedirectAttributes rda) {
		log.info("projectVO" + projectVO);
		
		myProjectService.modifyProject(projectVO);
		
		rda.addFlashAttribute("msg","u");
		
		
		return "redirect:/myProject";
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/myProject/completeProject")
	public String completeProject(ProjectsVO projectVO , RedirectAttributes rda) {
		log.info("projectVO" + projectVO);
		
		myProjectService.completeProject(projectVO);
		rda.addFlashAttribute("msg","c");
		
		return "redirect:/myProject";
	}
	
	// --------------------------------- 프로젝트 완료보고서 PDF 뷰어 시작 ----------------------------------------------------------

		// 프로젝트 완료보고서 PDF 미리보기
	    @RequestMapping(value ="/finishedReport", method = RequestMethod.GET)
	    public String getFinishedReport(Model model, @RequestParam String proNo) {
	    	
//	    	ProjectReportVO projectsReportVO = projectService.getReport(proNo);	// projectsReportVO 내용 가져오기
	    	ProjectReportVO projectsReport = projectService.getProjects(proNo);	// 프로젝트 내용을 projectsReportVO에 세팅
	    	List<WorksVO> workList = projectService.getWorks(proNo);	// works내용을 projectsReportVO 안의 workList에 세팅
	    	
	    	// 구해온 workList를 worksVO에 세팅
	    	for(WorksVO workVo : workList) {
	    		List<ManagerVO> managerList = workService.selectManagerList(workVo.getWorkNo());
	    		workVo.setManagerList(managerList);
	    	}
	    	
	    	projectsReport.setWorkList(workList);
	    	
	    	log.info("## finishedReport ...projectsReport -- {} ", projectsReport);
	    	model.addAttribute("projectsReport", projectsReport);
	    	return "project/finishedReport";
	    }
		
		// --------------------------------- 프로젝트 완료보고서 끝 ----------------------------------------------------------
		
	
}
