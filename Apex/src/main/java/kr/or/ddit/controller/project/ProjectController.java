package kr.or.ddit.controller.project;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.controller.cloud.CloudController;
import kr.or.ddit.service.IEmployeeService;
import kr.or.ddit.service.IHistoryService;
import kr.or.ddit.service.IProjectService;
import kr.or.ddit.service.IWorksService;
import kr.or.ddit.vo.CloudVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.HistoryVO;
import kr.or.ddit.vo.ManagerVO;
import kr.or.ddit.vo.ProjectReportVO;
import kr.or.ddit.vo.ProjectsVO;
import kr.or.ddit.vo.WorkCommentVO;
import kr.or.ddit.vo.WorksVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/project")
@Slf4j
public class ProjectController {

	@Inject
	private IProjectService projectService;
	
	@Inject
	private IWorksService workService;
	
	@Autowired
	private IHistoryService historyService;
	
	@Inject
	private IEmployeeService employeeService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/list")
	public String projectList(Model model, @RequestParam(name="filter", required = false, defaultValue = "1") int filterStatus) {
		
		log.info("filterStatus : " + filterStatus);
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("filter", filterStatus);
		
		List<ProjectsVO> projectList = projectService.selectAllProject(paramMap);
		List<EmployeeVO> empList = workService.selectEmpList();
		
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
		
		model.addAttribute("projectList",projectList);
		model.addAttribute("selectedStatus",filterStatus);
		
		
		return "project/projectList";
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/createProject")
	public String createProject(ProjectsVO projectVO, int[] entryMember, HttpServletRequest request, RedirectAttributes rda) {
		// 먼저 프로젝트 등록
		projectService.createProject(projectVO);

		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		
		// 쿼리에서 selectKey를 사용해서 proNo에 seq_pro.nextval을 담아왔음
		paramMap.put("proNo", projectVO.getProNo());
		paramMap.put("empNo", projectVO.getProLeader());
		
		projectService.addProjectMember(paramMap);
		
		for(int i = 0; i < entryMember.length; i++) {
			paramMap.put("empNo", entryMember[i]);
			projectService.addProjectMember(paramMap);
		}
		
		// 요청을 보낸 페이지
		String requestPage = request.getHeader("Referer");
		if(requestPage == null || !requestPage.contains(request.getServerName())) {
			return "redirect:/cloud/fileManager";
			
		}
		
		rda.addFlashAttribute("create", "true");
		return "redirect:"+requestPage;
		
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/selectMyProject")
	public ResponseEntity<List<ProjectsVO>> selectMyProject(int empNo) {
		log.info("@@@@@@@@@@@@@@@@@@@@@ empNo : " + empNo);
		// 받은 empNo로 member 테이블에서 내 projectNo를 List로 가져온 후 projectNo로 또 이름을 가져와야 함
		List<Integer> proNoList = projectService.selectProNoFromMemberTable(empNo);
		
		for(int proNo : proNoList) {
			log.info("############################## 프로젝트 넘버 : " + proNo);
		}
		
		List<ProjectsVO> projectList = projectService.selectMyProject(proNoList);
		return new ResponseEntity<List<ProjectsVO>>(projectList , HttpStatus.OK);
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/selectAllMember")
	public ResponseEntity<List<EmployeeVO>> selectAllMember() {
		
		List<EmployeeVO> empList = projectService.selectAllMember();
		return new ResponseEntity<List<EmployeeVO>>(empList , HttpStatus.OK);
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/addEntryMember")
	public ResponseEntity<EmployeeVO> addEntryMember(int empNo) {
		
		EmployeeVO entryMember = projectService.addEntryMember(empNo);
		return new ResponseEntity<EmployeeVO>(entryMember , HttpStatus.OK);
	}
	
	@PostMapping("/selectProject")
	public ResponseEntity<ProjectsVO> selectProject(@RequestBody Map<String, Object> map){
		String proNoStr = map.get("proNo").toString().trim();
		int proNo = Integer.parseInt(proNoStr);
		
		ProjectsVO projectVO = projectService.selectProject(proNo);
		
		
		return new ResponseEntity<ProjectsVO>(projectVO,HttpStatus.OK);
	}
	
	@PostMapping("/approveProject")
	public ResponseEntity<String> approveProject(@RequestBody Map<String, Object> map){
		String proNoStr = map.get("proNo").toString().trim();
		int proNo = Integer.parseInt(proNoStr);
		
		
		int status = projectService.approveProject(proNo);
		if(status > 0) {
			// -------------히스토리 인서트 시작 --------------------------
			
			HistoryVO historyVO = new HistoryVO();
			ProjectsVO projectVO = projectService.selectProject(proNo);
			
			EmployeeVO leaderInfo = employeeService.getEmpByNo(projectVO.getProLeader());
			
			String leaderName = leaderInfo.getEmpName();
			projectVO.setLeaderName(leaderName);
			
			
			List<Integer> memberList = historyService.findMemberList(proNo); 
			int[] entryMember = new int[memberList.size()];
			
			for(int i=0; i<memberList.size(); i++) {
				entryMember[i] = memberList.get(i);
			}
			
			insertHistory(historyVO, projectVO, entryMember);
			// -------------히스토리 인서트 끝 --------------------------
			
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed",HttpStatus.BAD_REQUEST);
		}
		
	}
	
	@PostMapping("/companionProject")
	public ResponseEntity<String> companionProject(@RequestBody Map<String, Object> map){
		String proNoStr = map.get("proNo").toString().trim();
		String proReason = map.get("proReason").toString().trim();
		int proNo = Integer.parseInt(proNoStr);
		
		ProjectsVO proVO = new ProjectsVO();
		proVO.setProNo(proNo);
		proVO.setProRejectReason(proReason);
		
		
		int status = projectService.companionProject(proVO);
		if(status > 0) {
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed",HttpStatus.BAD_REQUEST);
		}
	}
	
	@PostMapping("/sessionInputProNo")
	public ResponseEntity<Integer> sessionInputProNo(@RequestBody Map<String, Object> map, HttpSession session){
		String proNoStr = map.get("proNo").toString();
		int proNo = Integer.parseInt(proNoStr);
		session.setAttribute("proNo", proNo);
		
		return new ResponseEntity<Integer>(proNo,HttpStatus.OK);
	}
	

	// --------------------------------- 히스토리 인서트 시작 ----------------------------------------------------------
	
	// 프로젝트 status=2 '진행중'일때만 히스토리에 insert
	private void insertHistory (HistoryVO historyVO , ProjectsVO projectVO, int[] entryMember) {
		log.info("프로젝트 등록, 수정시 히스토리에 넣기 "); 
		historyVO.setHisTbNm("PROJECTS"); // 히스토리에 '프로젝트'글 인지 '일감'글 인지 구분용 컬럼
		historyVO.setHisProNo(projectVO.getProNo());
		historyVO.setHisProName(projectVO.getProName());
		historyVO.setHisProContent(projectVO.getProContent());
		historyVO.setHisProStartdate(projectVO.getProStartdate());
		historyVO.setHisProEnddate(projectVO.getProEnddate());
		
		// 진행중, 완료 일때만 히스토리에 insert
		if(projectVO.getProStatus() == 2){
			historyVO.setHisProStatus("진행중");
			historyVO.setHisModifyType("");	// 프로젝트 등록, 수정 구분용 (등록은 "")
		}
		if(projectVO.getProStatus() == 4){
			historyVO.setHisProStatus("완료");
			historyVO.setHisModifyType("1");	// 프로젝트 등록, 수정 구분용 (수정은 "1")
		}
		
		if(projectVO.getProRejectReason() ==null || projectVO.getProRejectReason().equals("")) {
			
			historyVO.setHisProRejectReason("");
		}else {
			historyVO.setHisProRejectReason(projectVO.getProRejectReason());
		}
		
		historyVO.setHisProLeader(projectVO.getLeaderName());
		
		List<EmployeeVO> empList = projectService.selectAllMember();
		String empName = "";
		
		for (int memberNo  : entryMember) {
			for (EmployeeVO empVO : empList) {
				if(memberNo == empVO.getEmpNo()) {
					empName += empVO.getEmpName() + " ";
				}
			}
		}
		
		historyVO.setHisProMemberList(empName);
//		historyVO.setHisProManagerList(hisProManagerList);
			
		historyService.projectsInsertHistory(historyVO);	// 프로젝트 등록,수정시 히스토리에 등록
	}
	
	// --------------------------------- 히스토리 인서트 끝 ----------------------------------------------------------

	// --------------------------------- 프로젝트 완료보고서 PDF 뷰어 시작 ----------------------------------------------------------

	// 프로젝트 완료보고서 PDF 미리보기
    @RequestMapping(value ="/finishedReport", method = RequestMethod.GET)
    public String getFinishedReport(Model model, @RequestParam String proNo) {
    	
//    	ProjectReportVO projectsReportVO = projectService.getReport(proNo);	// projectsReportVO 내용 가져오기
    	ProjectReportVO projectsReport = projectService.getProjects(proNo);	// 프로젝트 내용을 projectsReportVO에 세팅
    	List<WorksVO> workList = projectService.getWorks(proNo);	// works내용을 projectsReportVO 안의 workList에 세팅
    	
    	// 구해온 workList를 worksVO에 세팅
    	for(WorksVO workVo : workList) {
    		List<ManagerVO> managerList = workService.selectManagerList(workVo.getWorkNo());
    		workVo.setManagerList(managerList);
    	}
    	
    	projectsReport.setWorkList(workList);
    	
    	log.info("/finishedReport ...projectsReport -- {} ", projectsReport);
    	model.addAttribute("projectsReport", projectsReport);
    	return "project/finishedReport";
    }
	
	// --------------------------------- 프로젝트 완료보고서 끝 ----------------------------------------------------------
	
}
