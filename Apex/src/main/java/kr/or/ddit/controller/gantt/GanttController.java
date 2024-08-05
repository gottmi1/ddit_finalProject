package kr.or.ddit.controller.gantt;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.IGanttService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.ManagerVO;
import kr.or.ddit.vo.MembersVO;
import kr.or.ddit.vo.WorksVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/gantt")
public class GanttController {

	@Inject
	private IGanttService ganttService;
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String ganttChart(
			HttpSession session,
			Model model) {
		log.info(" ## ganttChart() 실행!");
		model.addAttribute("isProjectPage", true);
		
		int proNo = (int) session.getAttribute("proNo");
		
		String proName = ganttService.findProName(proNo);
		

	    // 모델에 게시글 목록을 추가
	    model.addAttribute("proNo", proNo);
	    model.addAttribute("proName",proName);
	    
	    
		return "gantt/gantt";
	}
	
	@PostMapping("/workList.do")
	public ResponseEntity<List<WorksVO>> workListGantt(@RequestBody Map<String, Object> map){
		String proNoStr =  map.get("proNo").toString();
		int proNo = Integer.parseInt(proNoStr);
		
		List<WorksVO> workList = ganttService.workListByProNo(proNo);
		
		return new ResponseEntity<List<WorksVO>>(workList,HttpStatus.OK);
	}
	
	@PostMapping("/workDetail.do")
	public ResponseEntity<WorksVO> workDetailGantt(@RequestBody Map<String, Object> map){
		String workNoStr =  map.get("workNo").toString();
		int workNo = Integer.parseInt(workNoStr);
		
		WorksVO workDetail = ganttService.workDetailByWorkNo(workNo);
		
		List<ManagerVO> findManager=  ganttService.findManager(workNo);
		workDetail.setManagerList(findManager);
		
		List<EmployeeVO> managerDetailList= ganttService.findManagerDetail(workNo);
		workDetail.setManagerDetail(managerDetailList);
		
		
		return new ResponseEntity<WorksVO>(workDetail,HttpStatus.OK);
	}
	
		
		
	
	
}
