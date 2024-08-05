package kr.or.ddit.controller.dashboard;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.IUserDashService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.ProjectsVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/userDash")
public class UserDashboardController {

	@Inject
	private IUserDashService service;
	
	@GetMapping("/home")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String userDashBoardHome(Model model, HttpSession session) {
		EmployeeVO empInfo = (EmployeeVO) session.getAttribute("empInfo");
		
    	int empNo = empInfo.getEmpNo();
		
    	int allWorks = service.selectWorkCount(empNo);
    	int doneWorks = service.selectDoneWorkCount(empNo);
    	int noDoneWorks = service.selectNoDoneWorkCount(empNo);
    	int lateWorks = service.selectLateWorkCount(empNo);
    	
    	int boWriterNo = 0;
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	
    	List<BoardVO> boardList = service.selectBoardListTen(); 
    	for(int i=0; i<boardList.size(); i++) {
    		boWriterNo = boardList.get(i).getEmpNo();
    		String boWriter = service.getEmpName(boWriterNo);
    		boardList.get(i).setBoWriter(boWriter);
    		String boDate = sdf.format(boardList.get(i).getBoDate());
    		boardList.get(i).setBoDateStr(boDate);
    		
    		
    		
    	}
    	List<Integer> memberNoList = service.selectMemberList(empNo);
    	List<ProjectsVO> projectList = new ArrayList<ProjectsVO>();
    	
    	for(int i=0; i<memberNoList.size(); i++) {
    		int memberProNo = memberNoList.get(i);
    		ProjectsVO projectDetail = service.selectProject(memberProNo);
    		projectList.add(projectDetail);
    	}
    	
    		
    	model.addAttribute("allWorks",allWorks);
    	model.addAttribute("doneWorks",doneWorks);
    	model.addAttribute("noDoneWorks",noDoneWorks);
    	model.addAttribute("lateWorks",lateWorks);
    	
    	model.addAttribute("boardList",boardList);
    	model.addAttribute("projectList",projectList);
    	
    	
		return "/dashboard/dashboard_user";
	}
}
