package kr.or.ddit.controller.history;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IHistoryService;
import kr.or.ddit.vo.HistoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/history")
@Controller
public class historyController {

	@Inject
	private IHistoryService service;
	
	
	// localhost//history/project/history?projectId=1 로 진입
	// 히스토리 목록 페이지 로드
    @PreAuthorize("permitAll")
    @GetMapping("/home")
    public String getProjectHistoryPage(Model model, 
                                        @RequestParam(required = false) String searchWord,
                                        HttpSession session) {
    	int projectId = (int) session.getAttribute("proNo");
    	model.addAttribute("isProjectPage", true);
    			
        model.addAttribute("projectId", projectId);
        model.addAttribute("searchWord", searchWord);
        return "history/history"; // history4.jsp 페이지로 이동
    }

    // 히스토리 목록 조회
    @PreAuthorize("permitAll")
    @PostMapping("/historyList")
    public ResponseEntity<?> getProjectHistory(
//            @RequestParam("projectId") int projectId,
    		HttpSession session,
            @RequestParam(required = false) String searchWord,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "20") int itemsPerPage,
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate) {
        
    	int projectId = (int) session.getAttribute("proNo");
        try {
        	//getProjectHistory() 실행! 프로젝트 ID: 1, 검색어: , 
            log.info("getProjectHistory() 실행! 프로젝트 ID: {}, 검색어: {}, ", projectId, searchWord);
            //getProjectHistory() 실행! 시작날짜: , 종료날짜: ,
            log.info("getProjectHistory() 실행! 시작날짜: {}, 종료날짜: {}, ", startDate, endDate);
            //getProjectHistory() 실행! 페이지: 1, 항목 수: 20
            log.info("getProjectHistory() 실행! 페이지: {}, 항목 수: {}", page, itemsPerPage);
            
            Map<String, Object> searchParams = new HashMap<>();
            
            searchParams.put("projectId", projectId);
            searchParams.put("searchWord", searchWord);
            searchParams.put("page", page);
            searchParams.put("itemsPerPage", itemsPerPage);
            searchParams.put("startDate", startDate);
            searchParams.put("endDate", endDate);
            
            //{endDate=, itemsPerPage=20, searchWord=, page=1, projectId=1, startDate=}
            log.info("searchParams : " + searchParams);

            //*******
            int totalRecords = service.getTotalRecords(searchParams);
            
            //totalRecords : 1023
            log.info("totalRecords : " + totalRecords);
            
            int totalPages = (int) Math.ceil((double) totalRecords / itemsPerPage);
            
            //totalPages : 52
            log.info("totalPages : " + totalPages);
            
            // 페이징 처리
            int startRow = (page - 1) * itemsPerPage + 1;
            int endRow = page * itemsPerPage;
            
            searchParams.put("startRow", startRow);
            searchParams.put("endRow", endRow);
            
            //searchParams(2) : {startRow=1, endDate=, itemsPerPage=20, endRow=20, searchWord=, page=1, projectId=1, startDate=2024-09-01}
            log.info("searchParams(2) : " + searchParams);
            //*******
            List<HistoryVO> historyList = service.getHistoryList(searchParams);
            
            log.info("히스토리 : " + historyList);
            
            
            Map<String, Object> response = new HashMap<>();
            response.put("historyList", historyList);
            //totalPages=52
            response.put("totalPages", totalPages);
            //currentPage=1
            response.put("currentPage", page);
            //itemsPerPage=20
            response.put("itemsPerPage", itemsPerPage);
            //totalRecords=1023
            response.put("totalRecords", totalRecords);
            
            /*
            {totalRecords=1023, historyList=[HistoryVO(historyColumn=null, historyBefore=null, historyAfter=null, pkNo=null, hisTbNm=PROJECTS
            , historyNo=1022, historyDate=2024-07-19 00:00:00.0, hisWorkNo=0, hisWorkManagerList=null, hisWorkStatus=null
            , hisWorkTitle=[1022][307][99], hisWorkContent=null, hisWorkFirst=null, hisWorkDate=null, hisWorkStartdate=null, hisWorkEnddate=null
            , hisWorkProg=0, hisWorkParentNo=0, hisWorkFileOriginName=null, hisWorkCnt=0, hisProNo=0, hisProName=ddd, hisProContent=dddd
            , hisProStartdate=2024-07-19 15:42:42.0, hisProEnddate=2024-07-31 00:00:00.0, hisProStatus=승인요청, hisProRejectReason=null
            , hisProLeader=이다예, hisProManagerList=홍길동 , hisProMemberList=이다예, 유재석, , hisProCnt=0, actionType=등록),
              HistoryVO(historyColumn=null, historyBefore=null, historyAfter=null, pkNo=null, hisTbNm=PROJECTS, historyNo=1021, historyDate=2024-07-19 00:00:00.0, hisWorkNo=0
	             , hisWorkManagerList=null, hisWorkStatus=null, hisWorkTitle=[1021][306][98], hisWorkContent=null, hisWorkFirst=null, hisWorkDate=null, hisWorkStartdate=null
	             , hisWorkEnddate=null, hisWorkProg=0, hisWorkParentNo=0, hisWorkFileOriginName=null, hisWorkCnt=0, hisProNo=0, hisProName=ddd, hisProContent=dddd
	             , hisProStartdate=2024-07-19 15:42:42.0, hisProEnddate=2024-07-31 00:00:00.0, hisProStatus=승인요청, hisProRejectReason=null, hisProLeader=이다예
	             , hisProManagerList=홍길동 , hisProMemberList=이다예, 유재석, , hisProCnt=0, actionType=등록)
             , HistoryVO(historyColumn=null, historyBefore=null
	             , historyAfter=null, pkNo=null, hisTbNm=PROJECTS, historyNo=997, historyDate=2024-07-19 00:00:00.0, hisWorkNo=0, hisWorkManagerList=null
	             , hisWorkStatus=null, hisWorkTitle=[997][282][76], hisWorkContent=null, hisWorkFirst=null, hisWorkDate=null, hisWorkStartdate=null
	             , hisWorkEnddate=null, hisWorkProg=0, hisWorkParentNo=0, hisWorkFileOriginName=null, hisWorkCnt=0, hisProNo=0, hisProName=ddd
	             , hisProContent=dddd, hisProStartdate=2024-07-19 15:42:42.0, hisProEnddate=2024-07-31 00:00:00.0, hisProStatus=승인요청, hisProRejectReason=null
	             , hisProLeader=이다예, hisProManagerList=홍길동 , hisProMemberList=이다예, 유재석, , hisProCnt=0, actionType=등록)
             , HistoryVO(historyColumn=null, historyBefore=null, historyAfter=null, pkNo=null, hisTbNm=PROJECTS, historyNo=996, historyDate=2024-07-19 00:00:00.0, hisWorkNo=0
	             , hisWorkManagerList=null, hisWorkStatus=null, hisWorkTitle=[996][281][75], hisWorkContent=null, hisWorkFirst=null, hisWorkDate=null, hisWorkStartdate=null
	             , hisWorkEnddate=null, hisWorkProg=0, hisWorkParentNo=0, hisWorkFileOriginName=null, hisWorkCnt=0, hisProNo=0, hisProName=ddd, hisProContent=dddd
	             , hisProStartdate=2024-07-19 15:42:42.0, hisProEnddate=2024-07-31 00:00:00.0, hisProStatus=승인요청, hisProRejectReason=null, hisProLeader=이다예, hisProManagerList=홍길동
              	 , hisProMemberList=이다예, 유재석, , hisProCnt=0, actionType=등록)
              , HistoryVO(historyColumn=null, historyBefore=null, historyAfter=null, pkNo=null, hisTbNm=PROJECTS
	              , historyNo=978, historyDate=2024-07-19 00:00:00.0, hisWorkNo=0, hisWorkManagerList=null, hisWorkStatus=null, hisWorkTitle=[978][263][59], hisWorkContent=null, hisWorkFirst=null
	              , hisWorkDate=null, hisWorkStartdate=null, hisWorkEnddate=null, hisWorkProg=0, hisWorkParentNo=0, hisWorkFileOriginName=null, hisWorkCnt=0, hisProNo=0, hisProName=ddd
	              , hisProContent=dddd, hisProStartdate=2024-07-19 15:42:42.0, hisProEnddate=2024-07-31 00:00:00.0, hisProStatus=승인요청, hisProRejectReason=null, hisProLeader=이다예
	              , hisProManagerList=홍길동 , hisProMemberList=이다예, 유재석, , hisProCnt=0, actionType=등록)
              , HistoryVO(historyColumn=null, historyBefore=null, historyAfter=null
	              , pkNo=null, hisTbNm=PROJECTS, historyNo=977, historyDate=2024-07-19 00:00:00.0, hisWorkNo=0, hisWorkManagerList=null, hisWorkStatus=null
	              , hisWorkTitle=[977][262][58], hisWorkContent=null, hisWorkFirst=null, hisWorkDate=null, hisWorkStartdate=null, hisWorkEnddate=null, hisWorkProg=0
	              , hisWorkParentNo=0, hisWorkFileOriginName=null, hisWorkCnt=0, hisProNo=0, hisProName=ddd, hisProContent=dddd, hisProStartdate=2024-07-19 15:42:42.0
	              , hisProEnddate=2024-07-31 00:00:00.0, hisProStatus=승인요청, hisProRejectReason=null, hisProLeader=이다예, hisProManagerList=홍길동 , hisProMemberList=이다예
	              , 유재석, , hisProCnt=0, actionType=등록)
              , HistoryVO(historyColumn=null, historyBefore=null, historyAfter=null, pkNo=null, hisTbNm=PROJECTS, historyNo=971
	              , historyDate=2024-07-19 00:00:00.0, hisWorkNo=0, hisWorkManagerList=null, hisWorkStatus=null, hisWorkTitle=[971][256], hisWorkContent=null, hisWorkFirst=null
	              , hisWorkDate=null, hisWorkStartdate=null, hisWorkEnddate=null, hisWorkProg=0, hisWorkParentNo=0, hisWorkFileOriginName=null, hisWorkCnt=0, hisProNo=0
	              , hisProName=ddd, hisProContent=dddd, hisProStartdate=2024-07-19 15:42:42.0, hisProEnddate=2024-07-31 00:00:00.0, hisProStatus=승인요청, hisProRejectReason=null
	              , hisProLeader=이다예, hisProManagerList=홍길동 , hisProMemberList=이다예, 유재석, , hisProCnt=0, actionType=등록)
              , HistoryVO(historyColumn=null, historyBefore=null
	              , historyAfter=null, pkNo=null, hisTbNm=PROJECTS, historyNo=970, historyDate=2024-07-19 00:00:00.0, hisWorkNo=0, hisWorkManagerList=null, hisWorkStatus=null
	              , hisWorkTitle=[970][255], hisWorkContent=null, hisWorkFirst=null, hisWorkDate=null, hisWorkStartdate=null, hisWorkEnddate=null, hisWorkProg=0, hisWorkParentNo=0
	              , hisWorkFileOriginName=null, hisWorkCnt=0, hisProNo=0, hisProName=ddd, hisProContent=dddd, hisProStartdate=2024-07-19 15:42:42.0, hisProEnddate=2024-07-31 00:00:00.0
	              , hisProStatus=승인요청, hisProRejectReason=null, hisProLeader=이다예, hisProManagerList=홍길동 , hisProMemberList=이다예, 유재석, , hisProCnt=0, actionType=등록)
              ...
             */
            log.info("response : " + response);

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            log.error("프로젝트 히스토리 조회 중 오류 발생", e);
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", "프로젝트 히스토리 조회 중 오류가 발생했습니다.");
            errorResponse.put("message", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
        }
    }
    
	
}
