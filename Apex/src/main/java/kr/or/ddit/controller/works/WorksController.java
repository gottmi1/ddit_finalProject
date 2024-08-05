package kr.or.ddit.controller.works;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.IHistoryService;
import kr.or.ddit.service.IWorksService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.HistoryVO;
import kr.or.ddit.vo.ManagerVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReceiveVO;
import kr.or.ddit.vo.WorkCommentVO;
import kr.or.ddit.vo.WorksVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/works")
@Slf4j
public class WorksController {
	
	@Inject
	private IWorksService service;
	
	@Autowired
	private IHistoryService historyService;
	
	@Resource(name = "uploadPath")
	private String resourcePath;
	
	// 등록/수정 담당자 선택 시 프로젝트 넘버에 따라 가져오도록 만듬
	@PostMapping("/selectPorjectMember")
	public ResponseEntity<List<EmployeeVO>> selectProjectMember(HttpSession session) {
		
		int proNo = (int)session.getAttribute("proNo");
		
		List<EmployeeVO> empList = service.selectProjectMember(proNo);
		return new ResponseEntity<List<EmployeeVO>>(empList , HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/list")
	public String worksList(Model model,
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
            @RequestParam(required = false) String searchWord, HttpSession session,
            @RequestParam(required = false, defaultValue = "0") String workStatus) {
		
		model.addAttribute("isProjectPage", true);
		
		int proNo = (int)session.getAttribute("proNo");
		
		PaginationInfoVO<WorksVO> pagingVO = new PaginationInfoVO<WorksVO>();
		
		pagingVO.setProNo(proNo);
		
		int currentWorkStatus = Integer.parseInt(workStatus);
		pagingVO.setWorkStatus(currentWorkStatus);
		
//		if(currentPage == 1) {
//			session.setAttribute("prevWorkStatus", currentWorkStatus);
//			pagingVO.setWorkStatus(currentWorkStatus);
//		} else {
//			currentWorkStatus = (int)session.getAttribute("prevWorkStatus");
//			pagingVO.setWorkStatus(currentWorkStatus);
//		}
		
		
		if(StringUtils.isNotBlank(searchWord)) {
	    	  pagingVO.setSearchWord(searchWord);
	    	  pagingVO.setSearchType(searchType);
	    	  
	    	  model.addAttribute("searchType", searchType);
	    	  model.addAttribute("searchWord", searchWord);
	      }
		
		
		
		// 총 4가지의 필드를 설정하기 위함
		//현재 페이지를 전달 후, start/endRow, start/endPage 설정
		pagingVO.setCurrentPage(currentPage);
		// 총 게시글 수를 언ㄷ어온다
		int totalRecord = service.selectWorksCount(pagingVO);
		// 총 게시글 수가 포함된 PaginationVO객체를 넘겨 주고 1페이지에 해당하는 10개의
		pagingVO.setTotalRecord(totalRecord);
		
		// 게시글을 얻어간다.
		List<WorksVO> workList = service.list(pagingVO);
		log.info("workList-> workList : " + workList);
		
		pagingVO.setDataList(workList);
		
		model.addAttribute("pagingVO", pagingVO);
		// 페이징 끝 -----------------------------
		
		List<ManagerVO> allManagerList = service.selectAllManagerList();
		List<EmployeeVO> allEmpList = service.selectEmpList();
		
		model.addAttribute("allManagerList", allManagerList);
		model.addAttribute("allEmpList", allEmpList);
		
		
		return "/works/workList";
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/detail")
	public String worksDetail(int workNo, Model model) {
		
		model.addAttribute("isProjectPage", true);
		
		Map<String,Object> fileDetailMap = new HashMap<String, Object>();
		fileDetailMap.put("workNo", workNo);
		fileDetailMap.put("whereNo", 1);
		
		// 현재 게시물에 등록된 FileNo를 이걸로 가져와야 함;
		Integer currentFileNo = service.selectCurrentFileNo(fileDetailMap);
		
		if(currentFileNo != 0) {
			List<FileDetailVO> fileList = service.selectCurrentFileList(currentFileNo);
			model.addAttribute("fileList", fileList);
		}
		
		// 일감 디테일에 대한 부분
		WorksVO worksVO = service.selectWorksDetail(workNo);
		List<WorksVO> childWorksList = service.selectChildWorksList(workNo);
		// 담당자 리스트로 empNo를 먼저 가져온 후
		List<ManagerVO> managerList = service.selectManagerList(workNo);
		// 그걸로 employee 테이블에서 이름을 가져옴
		List<EmployeeVO> managerNameList = service.selectManagerNameList(managerList);
		
		// 하위일감 담당자 이름 가져오기
		if(childWorksList.size() > 0) {
			List<ManagerVO> childWorkManagerList = service.selectChildManagerList(childWorksList);
			List<EmployeeVO> childWorkManagerNameList = service.selectManagerNameList(childWorkManagerList);
			model.addAttribute("childWorkManagerList", childWorkManagerList);
			model.addAttribute("childWorkManagerNameList", childWorkManagerNameList);
		}
		
		model.addAttribute("worksVO", worksVO);
		model.addAttribute("childWorksList", childWorksList);
		model.addAttribute("managerNameList", managerNameList);
		model.addAttribute("managerList", managerList);
		
		List<WorkCommentVO> commentList = service.selectComment(workNo);
		List<EmployeeVO> empList = service.selectEmpList();
		
		for(WorkCommentVO commentVO : commentList) {
			String empName = "";
			String profileImg = "";
			for(EmployeeVO empVO : empList) {
				if(commentVO.getWorkCoWriter() == empVO.getEmpNo()) {
					 empName = empVO.getEmpName();
					 profileImg = empVO.getEmpProfileimg();
					 break;
				}
			}
			commentVO.setProfileImg(profileImg);
			commentVO.setEmpName(empName);
		}
		
		model.addAttribute("commentList",commentList);
		
		
		
		// ------------------------------------- 이름들 가져와서 managerNameStr에 넣어놓음 이거 사용해서 하세요
		getManagerName(managerList);
		String managerNameStr = "";
		
		for(ManagerVO managerVO : managerList) {
			managerNameStr += managerVO.getEmpName() + " ";
		}
		// ------------------------------------- 이름들 가져와서 managerNameStr에 넣어놓음 이거 사용해서 하세요
		
		return "works/workDetail";
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/insertWork")
	public String insertWorkForm(Model model) {
		model.addAttribute("isProjectPage", true);
		return "works/insertForm";
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/insertWork")
	public String insertWork(WorksVO worksVO, HistoryVO historyVO, MultipartFile[] fileList, int[] entryManager, HttpSession session, RedirectAttributes ra) throws IOException {
		int proNo = (int)session.getAttribute("proNo");
		
		worksVO.setProNo(proNo);
		
		log.info("############# worksVO" + worksVO);
		
		worksVO.setWorkStartdate(worksVO.getWorkStartdate().replace("-", ""));
		worksVO.setWorkEnddate(worksVO.getWorkEnddate().replace("-", ""));
		
		service.insertWork(worksVO);
		
		Map<String,Object> managerMap = new HashMap<String, Object>();
		managerMap.put("workNo", worksVO.getWorkNo());
		
		for(int managerNo : entryManager) {
			managerMap.put("empNo", managerNo);
			service.insertManager(managerMap);
		}
		// workNo가 필요하기 때문에 먼저 만들어야 함
		
		List<MultipartFile> validFiles = Arrays.stream(fileList)
                .filter(file -> !file.isEmpty())
                .collect(Collectors.toList());
		
		if(validFiles.size() > 0) {
			createFile(fileList,worksVO.getWorkNo(), historyVO); // 히스토리에도 첨부파일 추가
		}
		
		
		//------------------------history insert 히스토리 시작----------------------------------
		
		historyVO.setHisModifyType(""); // 일감 등록, 수정 구분용 (등록은 "")
		insertHistory(historyVO,worksVO,entryManager);
		ra.addFlashAttribute("message", "등록이 완료되었습니다.");
		//------------------------history insert 히스토리 끝----------------------------------
		
		return "redirect:/works/detail?workNo=" + worksVO.getWorkNo();
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/modifyWork")
	public String modifyWorkForm(Model model, int workNo) {
		
		model.addAttribute("isProjectPage", true);
		
		WorksVO worksVO = service.selectWorksDetail(workNo);
		List<ManagerVO> managerList = service.selectManagerList(workNo);
		List<EmployeeVO> empList = service.selectEmpList();
		
		for(ManagerVO mamagerVO : managerList) {
			String empName = "";
			for(EmployeeVO empVO : empList) {
				if(mamagerVO.getEmpNo() == empVO.getEmpNo()) {
					 empName = empVO.getEmpName();
					 break;
				}
			}
			mamagerVO.setEmpName(empName);
		}
		
		model.addAttribute("status","u");
		model.addAttribute("workVO",worksVO);
		model.addAttribute("managerList",managerList);
		
		return "works/insertForm";
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/modifyWork")
	public String modifyWork(WorksVO worksVO, HistoryVO historyVO, MultipartFile[] fileList, int[] entryManager, HttpSession session) throws IOException {
		// 임시 프로젝트 번호
		int proNo = (int) session.getAttribute("proNo");
		worksVO.setProNo(proNo);
		log.info("worksVO : " + worksVO);
		
		// 수정할 때 이전 파일을 삭제하려면
		// workNo로 해당 Filse를 가져온 뒤, 그 Filse의 FilseNo로 File-detail들을 찾아서 삭제하면 된다.
		deleteFile(worksVO.getWorkNo());
		
		worksVO.setWorkStartdate(worksVO.getWorkStartdate().replace("-", ""));
		worksVO.setWorkEnddate(worksVO.getWorkEnddate().replace("-", ""));
		
		List<MultipartFile> validFiles = Arrays.stream(fileList)
                .filter(file -> !file.isEmpty())
                .collect(Collectors.toList());
		
		if(validFiles.size() > 0) {
			createFile(fileList,worksVO.getWorkNo(), historyVO);  // 히스토리에도 첨부파일 추가
		}
		try {
			
			service.modifyWork(worksVO);
			
		} catch (Exception e) {
		}
		
        
		// 이전 담당자 비움
		service.deleteManager(worksVO.getWorkNo());
		
		// 담당자 추가
		Map<String,Object> managerMap = new HashMap<String, Object>();
		managerMap.put("workNo", worksVO.getWorkNo());
		
		for(int managerNo : entryManager) {
			managerMap.put("empNo", managerNo);
			service.insertManager(managerMap);
		}
		
		// --------------------------------- 히스토리 인서트 시작 --------------------------------

		historyVO.setHisModifyType("1"); // 일감 등록, 수정 구분용 (수정은 "1")
		insertHistory(historyVO, worksVO, entryManager);
  		
		// --------------------------------- 히스토리 인서트 끝 --------------------------------
		
		return "redirect:/works/detail?workNo=" + worksVO.getWorkNo();
	}

	// 이름 가져오기
	private List<ManagerVO> getManagerName(List<ManagerVO> managerList) {
		
		List<EmployeeVO> empList = service.selectEmpList();
		String empName = "";
		
		for (ManagerVO managerVO : managerList) {
			for (EmployeeVO empVO : empList) {
				if(managerVO.getEmpNo() == empVO.getEmpNo()) {
					empName = empVO.getEmpName();
				}
			}
			managerVO.setEmpName(empName);
		}
		
		return managerList;
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/insertchildWork")
	public String insertChildWorkForm(Model model ,int workNo) {
		
		model.addAttribute("parentWorkNo",workNo);
		return "works/insertForm";
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/addComment")
	public String addComment(WorkCommentVO commentVO, Integer parentNo) {
		
		service.addComment(commentVO);
		return "redirect:/works/detail?workNo=" + commentVO.getWorkNo();
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/modifyComment")
	public String modifyComment(WorkCommentVO commentVO) {
		log.info("commentVO : " + commentVO);
		
		service.modifyComment(commentVO);
		return "redirect:/works/detail?workNo=" + commentVO.getWorkNo();
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/deleteComment")
	public String deleteComment(WorkCommentVO commentVO) {
		log.info("commentVO : " + commentVO);
		
		service.deleteComment(commentVO);
		return "redirect:/works/detail?workNo=" + commentVO.getWorkNo();
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/deleteWork")
	public String deleteWork(int workNo) {
		
		List<WorkCommentVO> commentVO = service.selectComment(workNo);
		
		// 담당자 삭제
		service.deleteManager(workNo);
		// 파일 삭제
		deleteFile(workNo);
		// 댓글 삭제
		if(commentVO.size() != 0 || commentVO != null) {
			service.realDeleteComment(workNo);
		}
		// 일감 삭제
		service.deleteWork(workNo);
		
		return "redirect:/works/list";
	}
	
	
	
    // ---------------------------------------------- 파일 삭제 -------------------------------------------------------------
	private void deleteFile(int workNo) {
		
		HashMap<String, Object> filesFindMap = new HashMap<String, Object>();
		filesFindMap.put("whereNo", 1);
		filesFindMap.put("wherePk", workNo);
		
		FilesVO filesVO = service.selectFiles(filesFindMap);
		// 로 파일즈를 가져와서
		if(filesVO != null) {
			service.deleteFile(filesVO.getFileNo());
			// 로 파일들 삭제하고
			service.deleteFiles(filesVO.getFileNo());
			// 로 파일즈도 삭제
		}
	}
	// ---------------------------------------------- 파일 삭제 끝 -------------------------------------------------------------
	
	// ---------------------------------------------- 파일 생성 -------------------------------------------------------------
	private void createFile(MultipartFile[] fileList, int workNo, HistoryVO historyVO) throws IOException {
		// files를 먼저 만들어야 fileDetail을 포함할 수 있음
		FilesVO filesVO = new FilesVO();
		filesVO.setFileWhereNo(1);
		filesVO.setFileWherePk(workNo);
		
		service.insertNewFiles(filesVO);
		
		// uuid 생성
		UUID uuid = UUID.randomUUID();		
		
		// 업로드 경로에 폴더 있는지 확인하고 없으면 만듬
		File tempFile = new File(resourcePath);
		
		if (!tempFile.exists()) {
			tempFile.mkdirs();
		}
		
		List<FileDetailVO> fileDetailVOList = new ArrayList<FileDetailVO>();
		
		for(int i = 0; i < fileList.length; i++) {
			log.info("####################" + i + " 번째 파일  : " + fileList[i].getOriginalFilename());
			
			FileDetailVO fileVO = new FileDetailVO(fileList[i]);
			
			fileDetailVOList.add(fileVO);
		}
		
		for(FileDetailVO fileDetailVO : fileDetailVOList) {
			String savedName = uuid.toString() + "_" + fileDetailVO.getFileOriginName();
			String fileUrl = resourcePath + '/' + savedName;
			
			// 파일 copy
			File target = new File(fileUrl);
			FileCopyUtils.copy(fileDetailVO.getItem().getBytes(), target);
			// 파일 카피한 후, 저장된 파일의 팬시사이즈를 가져와서 vo에 저장
			long size = target.length();
			String fancySize = FileUtils.byteCountToDisplaySize(size);
			
			fileDetailVO.setFileFancysize(fancySize);
			fileDetailVO.setFileSaveName(savedName);
			fileDetailVO.setFileUrl(fileUrl);
			fileDetailVO.setFileNo(filesVO.getFileNo());
			
			service.insertWorkFile(fileDetailVO);
			// --------------------------------- 히스토리 인서트 시작 ----------------------------------------------------------
			historyVO.setHisWorkFileOriginName(fileDetailVO.getFileOriginName());
			// --------------------------------- 히스토리 인서트 끝 ----------------------------------------------------------
			
		}
		
	}
	// ---------------------------------------------- 파일 생성 끝 -------------------------------------------------------------

	
	// ---------------------------------------------- 파일 다운로드 -------------------------------------------------------------
	@PostMapping("/downloadFile")
	public ResponseEntity<InputStreamResource> downloadChatFile(@RequestParam String fileName,
			@RequestParam String originalFileName) throws FileNotFoundException{
		File file = new File(resourcePath +"/"+ fileName);
		FileInputStream fileInputStream = new FileInputStream(file);
        InputStreamResource resource = new InputStreamResource(fileInputStream);
        return ResponseEntity.ok()
        		.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + originalFileName)
        		.contentType(MediaType.APPLICATION_OCTET_STREAM)
        		.contentLength(file.length())
        		.body(resource);
	}
	// ---------------------------------------------- 파일 다운로드 끝 -------------------------------------------------------------

	
	// --------------------------------- 히스토리 인서트 시작 ----------------------------------------------------------
	
	// 일감 등록, 수정시 히스토리에 insert
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
		
		List<EmployeeVO> empList = service.selectEmpList();
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
	
	// --------------------------------- 히스토리 인서트 끝 ----------------------------------------------------------
}
