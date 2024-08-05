package kr.or.ddit.controller.kanban;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
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

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IEmployeeService;
import kr.or.ddit.service.IHistoryService;
import kr.or.ddit.service.IKanbanService;
import kr.or.ddit.service.IWorksService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.HistoryVO;
import kr.or.ddit.vo.ManagerVO;
import kr.or.ddit.vo.WorksVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/kanban")
public class KanbanController {
	
	@Inject
	private IKanbanService service;
	
	@Inject
	private IWorksService workService;
	
	@Autowired
	private IHistoryService historyService;

	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/home")
	public String kanban(Model model, HttpSession session) {
		int proNo = (int) session.getAttribute("proNo");
//		int proNo = Integer.parseInt(proNoStr);
		model.addAttribute("isProjectPage", true);
		
		
		List<WorksVO> workList = service.workListOfKanban(proNo);
		for(int i=0; i<workList.size(); i++) {
			if(workList.get(i).getWorkFirst().equals("1") ) { // 
				workList.get(i).setWorkFirstName("낮음");
			}else if(workList.get(i).getWorkFirst().equals("2")) {
				workList.get(i).setWorkFirstName("중간");
			}else {
				workList.get(i).setWorkFirstName("높음");
			}
		}
		
		for(int i =0; i<workList.size(); i++) {
			workList.get(i).setManagerCount(workList.get(i).getManagerList().size());
			log.info("@@@@@@@@@@@@@@@@@@@@@@@"+workList.get(i).getManagerCount());
		}
		
		String startDate;
		String endDate;
		
		List<WorksVO> toDoList   = new ArrayList<WorksVO>();
		List<WorksVO> goingList  = new ArrayList<WorksVO>();
		List<WorksVO> doneList   = new ArrayList<WorksVO>();
		List<WorksVO> issueList  = new ArrayList<WorksVO>();
		
		for(int i=0; i<workList.size(); i++) {
			if(workList.get(i).getWorkStatus() == 1) {	// 할일
				toDoList.add(workList.get(i));
			}else if(workList.get(i).getWorkStatus() == 2) {	// 진행중 
				goingList.add(workList.get(i));
			}else if(workList.get(i).getWorkStatus() == 3) {	// 완료
				doneList.add(workList.get(i));
			}else if(workList.get(i).getWorkStatus() == 4) {	// 이슈발생
				issueList.add(workList.get(i));
			}
			
			
			startDate = workList.get(i).getWorkStartdate();
			endDate = workList.get(i).getWorkEnddate();
			
			startDate = startDate.substring(0, 4) + "." + startDate.substring(4, 6) + "." + startDate.substring(6, 8);
			endDate = endDate.substring(0, 4) + "." + endDate.substring(4, 6) + "." + endDate.substring(6, 8);
			
			workList.get(i).setWorkStartdate(startDate);
			workList.get(i).setWorkEnddate(endDate);
			
		}
		
		
		
		
		
		model.addAttribute("workList",workList);
		model.addAttribute("toDoList",toDoList);
		model.addAttribute("goingList",goingList);
		model.addAttribute("doneList",doneList);
		model.addAttribute("issueList",issueList);
		model.addAttribute("proNo",proNo);
		
		return "kanban/kanban";
	}
	
	
	
	@PostMapping("/updateStatus.do")
	public ResponseEntity<ServiceResult> updateStatusOfKanban(@RequestBody Map<String, Object> myData){
		String workNoStr = myData.get("workNo").toString();
		String workStatusStr = myData.get("workStatus").toString();
		
		int workNo = Integer.parseInt(workNoStr);
		int workStatus = Integer.parseInt(workStatusStr);
		
		log.info("######## "+workNo);
		log.info("######## "+workStatus);
		
		WorksVO worksVO = workService.selectWorksDetail(workNo);
		worksVO.setWorkNo(workNo);
		worksVO.setWorkStatus(workStatus);
		
		
		
		HistoryVO historyVO = new HistoryVO();
		historyVO.setHisModifyType("1");
		
		List<ManagerVO> managerList =  workService.selectManagerList(workNo);
		int[] entryManager = new int[managerList.size()];
		for(int i=0; i<managerList.size(); i++) {
			entryManager[i] =managerList.get(i).getEmpNo();
		}
		
		
				
		insertHistory(historyVO, worksVO, entryManager);
		
		
		ServiceResult result = null;
		
		
		result = service.updateStatusOfKanban(worksVO);
		
		
		
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	private void insertHistory (HistoryVO historyVO , WorksVO worksVO, int[] entryManager) {
		
		log.info("일감 등록, 수정시 히스토리에 넣기 : " + worksVO.getWorkDate()); 
		historyVO.setHisTbNm("WORKS");		// 히스토리에 '프로젝트'글 인지 '일감'글 인지 구분용 컬럼
		historyVO.setHisWorkNo(worksVO.getWorkNo());
		historyVO.setHisProNo(worksVO.getProNo());
		
		// 상태 번호별 값 히스토리에 insert
		if(worksVO.getWorkStatus() == 1) {
			historyVO.setHisWorkStatus("할일");
		}
		if(worksVO.getWorkStatus() == 2) {
			historyVO.setHisWorkStatus("진행중");
		}
		if(worksVO.getWorkStatus() == 3) {
			historyVO.setHisWorkStatus("완료");
		}
		if(worksVO.getWorkStatus() == 4) {
			historyVO.setHisWorkStatus("이슈발생");
		}
		
		historyVO.setHisWorkTitle(worksVO.getWorkTitle());
		historyVO.setHisWorkContent(worksVO.getWorkContent());
		
		// 우선순위 번호별 히스토리에 insert
		if(worksVO.getWorkFirst().equals("1")) {
			historyVO.setHisWorkFirst("낮음");
		}
		if(worksVO.getWorkFirst().equals("2")) {
			historyVO.setHisWorkFirst("보통");
		}
		if(worksVO.getWorkFirst().equals("3")) {
			historyVO.setHisWorkFirst("높음");
		}
		
		historyVO.setHisWorkStartdate(worksVO.getWorkStartdate());
		historyVO.setHisWorkEnddate(worksVO.getWorkEnddate());
		historyVO.setHisWorkProg(worksVO.getWorkProg());
		historyVO.setHisWorkParentNo(worksVO.getWorkParentNo());
		
		List<EmployeeVO> empList = workService.selectEmpList();
		String empName = "";
		
		for (int managerNo  : entryManager) {
			for (EmployeeVO empVO : empList) {
				if(managerNo == empVO.getEmpNo()) {
					empName += empVO.getEmpName() + " ";
				}
			}
		}
		
		historyVO.setHisWorkManagerList(empName);
			
		historyService.worksInsertHistory(historyVO);	// 일감 등록,수정시 히스토리에 등록
	}
	
	
	
	
}
