package kr.or.ddit.controller.adnotice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.IAdnoticeService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/adnotice")
public class AdNoticeRetrieveController {

	@Inject
	private IAdnoticeService adnoticeService;

	@RequestMapping(value = "/list")
	public String boardList(Model model,
            @RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
//            @RequestParam(name = "pno", required = true) int pno,
            @RequestParam(required = false, defaultValue = "title") String searchType,
            @RequestParam(required = false) String searchWord,
            HttpSession session) {
        log.info("noticeList() 실행");
        int pno = (int) session.getAttribute("proNo");

        PaginationInfoVO<NoticeVO> pagingVO = new PaginationInfoVO<NoticeVO>();
        
        if(StringUtils.isNotBlank(searchWord)) {
	    	  pagingVO.setSearchWord(searchWord);
	    	  pagingVO.setSearchType(searchType);
	    	  
	    	  model.addAttribute("searchType", searchType);
	    	  model.addAttribute("searchWord", searchWord);
	      }

        // 현재 공지사항 게시판 목록은 프로젝트 내에서 존재하는 공지사항이기 때문에,
        // 프로젝트 번호를 가지고 들어옵니다. 들어온 프로젝트 번호를 searchVO에 해당하는 가변 T 객체 타입으로 셋팅하고
        // 프로젝트 번호에 해당하는 게시판 목록 카운트와 게시판 목록 데이터를 가져올 수 있도록 셋팅합니다.
        NoticeVO noticeVO = new NoticeVO();
        noticeVO.setProjectNo(pno);
        pagingVO.setSearchVO(noticeVO);

        // no와 일치하는 프로젝트 번호에 대한 팀장을 조회해서 가져온다.
        String leader = adnoticeService.getProjectLeader(noticeVO.getProjectNo());

        // 총 4가지의 필드를 설정하기 위함
        // 현재 페이지를 전달 후, start/endRow, start/endPage 설정
        pagingVO.setCurrentPage(currentPage);

        // 총 게시글 수를 얻어온다
        int totalRecord = adnoticeService.selectNoticeCount(pagingVO);

        // 총 게시글 수가 포함된 PaginationVO 객체를 넘겨주고 1페이지에 해당하는 10개의
        pagingVO.setTotalRecord(totalRecord);

        // 게시글을 얻어간다.
        List<NoticeVO> noticeList = adnoticeService.list(pagingVO);
        log.info("noticeList -> noticeList : " + noticeList);

        pagingVO.setDataList(noticeList);

        model.addAttribute("leader", leader);
        model.addAttribute("pno", pno);
        model.addAttribute("pagingVO", pagingVO);
        model.addAttribute("isProjectPage", true);
        return "adnotice/list";  
	}

	// 자유게시판 상세보기
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String noticeDetail(int noticeNo, Model model) {
		log.info("noticeDetail()실행");
		NoticeVO noticeVO = adnoticeService.selectNotice(noticeNo);
		
		// 1. project_no를 이용하여 프로젝트 정보를 가져온다.
		String leader = adnoticeService.getProjectLeader(noticeVO.getProjectNo());
		// no와 일치하는 프로젝트 번호에 대한 팀장을 조회해서 가져온다.
		
		EmployeeVO empVO = adnoticeService.getEmployeeByEmpNo(noticeVO.getEmpNo());
		model.addAttribute("leader", leader);
		model.addAttribute("notice", noticeVO);
		model.addAttribute("empVO",empVO);
		model.addAttribute("isProjectPage", true);

		return "adnotice/detail";
	}
	

}
