package kr.or.ddit.controller.email;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.IMailService;
import kr.or.ddit.service.IWorksService;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.MailVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReceiveVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/email")
public class EmailController {
	
	@Inject
	private IMailService service;
	
	@Inject 
	private IWorksService workServie;
	
	@Resource(name = "uploadPath")
	private String resourcePath;
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/home")
	public String emailInbox(Model model,
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage ,
			HttpSession session) {
		session.setAttribute("proNo", null);
		
		// empNo
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
    	
		// 사용할 pagingVO
		PaginationInfoVO<ReceiveVO> pagingVO = new PaginationInfoVO<ReceiveVO>();
		
		// empNo로 필터링해와야 함
		pagingVO.setEmpNo(empNo);
		
		pagingVO.setCurrentPage(currentPage);
		
		int totalRecord = service.selectReceiveCount(pagingVO);

		pagingVO.setTotalRecord(totalRecord);
		
		Map<String,Object> pagingMap = new HashMap<String,Object>();
		
		pagingMap.put("pagingVO",pagingVO);
		pagingMap.put("empNo",empNo);
		// 기본 값을 위한 receiveCategory
		pagingMap.put("mailMenu",1);
		
		List<ReceiveVO> receiveInbox = service.receivelist(pagingMap);
		log.info("ReceiveInbox-> RecevieInbox : " + receiveInbox);
	
		getReceiveSenderName(receiveInbox);
		for(ReceiveVO recVO : receiveInbox) {
			MailVO mailVO = service.getMailFromMailNo(recVO.getMailNo());
			recVO.setMailVO(mailVO);
		}
		
		pagingVO.setDataList(receiveInbox);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "email/inbox";
	}
	
	
	@GetMapping("/asyncPaging")
	public ResponseEntity<?> asyncPagination(int selectedPage, int selectedMenu) {
		
		// empNo
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
    	
    	// 응답으로 내보낼 Map
    	Map<String, Object> listMap = new HashMap<String, Object>();
    	
    	PaginationInfoVO<ReceiveVO> pagingVO = new PaginationInfoVO<ReceiveVO>();
		
		pagingVO.setEmpNo(empNo);
		
		pagingVO.setCurrentPage(selectedPage);
		pagingVO.setMailMenu(selectedMenu);
		
		List<MailVO> mailList = new ArrayList<MailVO>();
		
		int totalRecord = service.selectAsyncReceivePaging(pagingVO);
		// 총 게시글 수가 포함된 PaginationVO객체를 넘겨 주고 1페이지에 해당하는 10개의
		pagingVO.setTotalRecord(totalRecord);
		
		// 게시글을 얻어간다.
		Map<String,Object> pagingMap = new HashMap<String,Object>();
		
		pagingMap.put("pagingVO",pagingVO);
		pagingMap.put("empNo",empNo);
		pagingMap.put("mailMenu",selectedMenu);
		
		// 기본 값을 위한 receiveCategory
		if(selectedMenu == 1 || selectedMenu == 3 || selectedMenu == 5) {
			List<ReceiveVO> receiveInbox = service.receivelist(pagingMap);
			log.info("ReceiveInbox-> RecevieInbox : " + receiveInbox);
		
			getReceiveSenderName(receiveInbox);
			for(ReceiveVO recVO : receiveInbox) {
				MailVO mailVO = service.getMailFromMailNo(recVO.getMailNo());
				recVO.setMailVO(mailVO);
			}
			
			pagingVO.setDataList(receiveInbox);
		} 
		
		if(selectedMenu == 2) {
			pagingVO.setSendCategory(1);
			
			List<ReceiveVO> receiveList = new ArrayList<ReceiveVO>();
			
			receiveList = service.getMySendMail(pagingVO);
    		
    		for(ReceiveVO recVO : receiveList) {
    			MailVO mailVO = service.getMailFromMailNo(recVO.getMailNo());
    			recVO.setMailVO(mailVO);
    		}
    		getReceiverName(receiveList);
    		
    		totalRecord = service.selectAsyncSendPaging(pagingVO);
    		
    		pagingVO.setTotalRecord(totalRecord);
    		
    		pagingVO.setDataList(receiveList);
		}
		
		if(selectedMenu == 4) {
			pagingVO.setSendCategory(2);
			
			PaginationInfoVO<MailVO> pagingMailVO = new PaginationInfoVO<MailVO>();
			
			mailList = service.getSaveMailList(pagingVO);
			
			totalRecord = service.selectAsyncSendPaging(pagingVO);
    		
    		pagingVO.setTotalRecord(totalRecord);
    		
    		pagingMailVO.setDataList(mailList);
    		
    		listMap.put("pagingMailVO",pagingMailVO);
		}
    	
		
		
		listMap.put("selectedPage", selectedPage);
    	listMap.put("selectedMenu", selectedMenu);
    	listMap.put("pagingVO", pagingVO);
    	
    	
    	
		return new ResponseEntity<Map<String, Object>>(listMap,HttpStatus.OK);
	}
	
	
	
	
	
	@PreAuthorize("permitAll")
	@PostMapping("/menuChange")
	public ResponseEntity<Map<String, Object>> menuChange(@RequestBody Map<String,Object> map,
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage) {
		// 현재 empNo를 가져오기 위함.
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
    	
    	
    	// 사용할 페이징 VO / 기본설정
    	PaginationInfoVO<ReceiveVO> pagingVO = new PaginationInfoVO<ReceiveVO>();
    	pagingVO.setCurrentPage(currentPage);
    	pagingVO.setEmpNo(empNo);
    	
    	
    	List<MailVO> mailList = new ArrayList<MailVO>();
    	List<ReceiveVO> receiveList = new ArrayList<ReceiveVO>();
    	ReceiveVO receiveVO = new ReceiveVO();
    	
    	// 실제로 보낼 Map
    	Map<String, Object> listMap = new HashMap<String, Object>();
    	
    	int sendCategory = 0;
    	if(map.get("sendCategory") != null) {
    		// 받은메일 : receive 1 - mailMenu : 1
    		// 보낸 메일 : send 1 - mailMenu : 2
    		// 중요메일 : receive 2 - mailMenu : 3
    		// 임시보관 : send 2 - mailMenu : 4
    		// 휴지통 : recevie 3 - mailMenu : 5
    		
    		sendCategory = Integer.parseInt(map.get("sendCategory").toString());
    		
    		int selectedMenu;
    		
    		if(sendCategory == 1) {
    			selectedMenu = 2;
    		}else {
    			selectedMenu = 4;
    		}
    		
    		
    		
    		// 보낸 메일함/임시보관함일 때 mail 보기
			receiveVO.setMailSender(empNo);
			// MAIL.MAIL_SEND_CATEGORY로 임시로 사용할 예정.
			receiveVO.setSendCategory(sendCategory);
			
			pagingVO.setSendCategory(sendCategory);
			pagingVO.setMailMenu(selectedMenu);
			
			
			if(sendCategory== 1) {
				receiveList = service.getMySendMail(pagingVO);
	    		
	    		for(ReceiveVO recVO : receiveList) {
	    			MailVO mailVO = service.getMailFromMailNo(recVO.getMailNo());
	    			recVO.setMailVO(mailVO);
	    		}
	    		getReceiverName(receiveList);
	    		
	    		int totalRecord = service.selectAsyncSendPaging(pagingVO);
	    		
	    		pagingVO.setTotalRecord(totalRecord);
	    		
	    		pagingVO.setDataList(receiveList);
			}
			else 
			{
				PaginationInfoVO<MailVO> pagingMailVO = new PaginationInfoVO<MailVO>();
//				pagingMailVO.setCurrentPage(currentPage);
//				pagingMailVO.setEmpNo(empNo);
				
				mailList = service.getSaveMailList(pagingVO);
				
				int totalRecord = service.selectAsyncSendPaging(pagingVO);
	    		
	    		pagingVO.setTotalRecord(totalRecord);
	    		
	    		pagingMailVO.setDataList(mailList);
	    		
	    		listMap.put("pagingMailVO",pagingMailVO);
			}
    	}

    	
    	
    	int receiveCategory = 0;
    	if(map.get("receiveCategory") != null) {
    		
    		receiveCategory = Integer.parseInt(map.get("receiveCategory").toString());
    		
    		// 받은메일 : receive 1
    		// 보낸 메일 : send 1
    		// 중요메일 : receive 2
    		// 임시보관 : send 2
    		// 휴지통 : recevie 3
    		
    		int selectedMenu;
    		
    		if(receiveCategory == 1) {
    			selectedMenu = 1;
    		}else if(receiveCategory == 2) {
    			selectedMenu = 3;
    		}else {
    			selectedMenu = 5;
    		}
    		
    		// 보낸 메일함/임시보관함일 때 mail 보기 , 페이징 추가되면 필요 없어짐.
			receiveVO.setReceiveEmp(empNo);
			receiveVO.setReceiveCategory(receiveCategory);
			
			// 페이징 해올 receiveCategory는 이놈임
			pagingVO.setReceiveCategory(receiveCategory);
			
    		receiveList = service.filterReceiveMail(pagingVO);
    		
    		for(ReceiveVO recVO : receiveList) {
    			MailVO mailVO = service.getMailFromMailNo(recVO.getMailNo());
    			recVO.setMailVO(mailVO);
    		}
    		getReceiveSenderName(receiveList);
    		// receiverList만들기 끝
    		
    		pagingVO.setMailMenu(selectedMenu);
    		
    		// count 얻어오기 receive와 mail테이블에서 각각 얻어오기 때문에 값이 유동적임.
    		
    		int totalRecord = service.selectAsyncReceivePaging(pagingVO);
    		
    		pagingVO.setTotalRecord(totalRecord);
    		
    		pagingVO.setDataList(receiveList);
    	}
    	
    	
    	listMap.put("receiveList", receiveList);
    	listMap.put("mailList", mailList);
    	listMap.put("pagingVO",pagingVO);
    	
    	return new ResponseEntity<Map<String, Object>>(listMap , HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	@PostMapping("/detail")
	public ResponseEntity<Map<String, List<?>>> getMailDetail(@RequestBody Map<String, Object> map, Model model) {
		
		Map<String, List<?>> response = new HashMap<>();
		
		int mailNo = Integer.parseInt(map.get("id").toString());
	    log.info("getMailDetail() - mailNo: " + mailNo);
	    
	    Map<String,Object> fileDetailMap = new HashMap<String, Object>();
		fileDetailMap.put("wherePK", mailNo);
		fileDetailMap.put("whereNo", 4);
		
		// 현재 게시물에 등록된 FileNo를 이걸로 가져와야 함;
		Integer currentFileNo = service.selectFilesByMailNo(fileDetailMap);
		
		List<FileDetailVO> fileList = new ArrayList<FileDetailVO>();
		if(currentFileNo != 0) {
			fileList = service.selectCurrentFileList(currentFileNo);
		}
	    
	    int targetStatus = Integer.parseInt(map.get("targetStatus").toString());
	    
	    MailVO mailVO = service.getMailFromMailNo(mailNo);
	    
	    if (mailVO == null) {
	        log.error("MailVO not found for mailNo: " + mailNo);
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }
	    
	    ReceiveVO receiveVO = service.getReceiveFormMailNo(mailNo);
	    if (receiveVO == null) {
	        log.error("ReceiveVO not found for mailNo: " + mailNo);
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }

	    List<ReceiveVO> receiveList = new ArrayList<>();
	    receiveList.add(receiveVO);
	    getReceiveSenderName(receiveList);

	    receiveVO.setMailVO(mailVO);
	    if(targetStatus != 2 && targetStatus != 4) {
	    	service.updateMailReceiveRead(receiveVO);
	    }
	    
	    response.put("receiveList", receiveList);
	    response.put("fileList", fileList);

	    return new ResponseEntity<Map<String, List<?>>>(response, HttpStatus.OK);
	}
	
	
	
	// 읽음처리 완료 함
	@PostMapping("/allRead")
	public ResponseEntity<Map<String, Object>> allRead(
			@RequestBody Map<String,Object> paramMap
			) {
		
		List<Integer> emailNoList = (List<Integer>) paramMap.get("emailNoList");
		int receiveCategory = (int) paramMap.get("receiveCategory");
		int selectedMenu = (int) paramMap.get("selectedMenu");
		int selectedPage = (int) paramMap.get("selectedPage");
		
		
		log.info("emailNoList : " + emailNoList); 
		log.info("receiveCategory : " + receiveCategory);
		log.info("selectedMenu : " + selectedMenu);
		log.info("selectedPage : " + selectedPage);
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
    	
    	// 사용할 페이징 VO / 기본설정
    	PaginationInfoVO<ReceiveVO> pagingVO = new PaginationInfoVO<ReceiveVO>();
    	pagingVO.setCurrentPage(selectedPage);
    	pagingVO.setEmpNo(empNo);
		pagingVO.setMailMenu(selectedMenu);
		pagingVO.setReceiveCategory(receiveCategory);
    	
		List<ReceiveVO> receiveList = new ArrayList<>();
		ReceiveVO receiveVO = new ReceiveVO();
		
		// 읽음 처리
		for(int mailNo : emailNoList) {
			service.readAllMail(mailNo);
		}
		// 보낸 메일함/임시보관함일 때 mail 보기
		receiveVO.setReceiveEmp(empNo);
		receiveVO.setReceiveCategory(receiveCategory);
		
		receiveList = service.filterReceiveMail(pagingVO);
		
		int totalRecord = service.selectAsyncReceivePaging(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		for(ReceiveVO recVO : receiveList) {
			MailVO mailVO = service.getMailFromMailNo(recVO.getMailNo());
			recVO.setMailVO(mailVO);
		}
		
		getReceiveSenderName(receiveList);
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		pagingVO.setDataList(receiveList);
		
		listMap.put("receiveList", receiveList);
		listMap.put("pagingVO", pagingVO);
		
		return new ResponseEntity<Map<String, Object>>(listMap , HttpStatus.OK);
	}
	
	
	
	
	
	
	// 휴지통으로 보내기
	@PostMapping("/allTrash")
	public ResponseEntity<Map<String, Object>> allTrash(@RequestBody Map<String,Object> paramMap) {
		
		List<Integer> emailNoList = (List<Integer>) paramMap.get("emailNoList");
		int receiveCategory = (int) paramMap.get("receiveCategory");
		int selectedMenu = (int) paramMap.get("selectedMenu");
		int selectedPage = (int) paramMap.get("selectedPage");
		
		log.info("emailNoList : " + emailNoList); 
		log.info("receiveCategory : " + receiveCategory);
		log.info("selectedMenu : " + selectedMenu);
		log.info("selectedPage : " + selectedPage);
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
    	
    	// 사용할 페이징 VO / 기본설정
    	PaginationInfoVO<ReceiveVO> pagingVO = new PaginationInfoVO<ReceiveVO>();
    	pagingVO.setCurrentPage(selectedPage);
    	pagingVO.setEmpNo(empNo);
		pagingVO.setMailMenu(selectedMenu);
		pagingVO.setReceiveCategory(receiveCategory);
    	
		List<ReceiveVO> receiveList = new ArrayList<>();
		ReceiveVO receiveVO = new ReceiveVO();
		
		// 휴지통으로 보내기
		for(int mailNo : emailNoList) {
			service.trashAllMail(mailNo);
		}
		
		// 보낸 메일함/임시보관함일 때 mail 보기
		receiveVO.setReceiveEmp(empNo);
		receiveVO.setReceiveCategory(receiveCategory);
		
		receiveList = service.filterReceiveMail(pagingVO);
		
		int totalRecord = service.selectAsyncReceivePaging(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		for(ReceiveVO recVO : receiveList) {
			MailVO mailVO = service.getMailFromMailNo(recVO.getMailNo());
			recVO.setMailVO(mailVO);
		}
		
		getReceiveSenderName(receiveList);
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		pagingVO.setDataList(receiveList);
		
		listMap.put("receiveList", receiveList);
		listMap.put("pagingVO", pagingVO);
		
		return new ResponseEntity<Map<String, Object>>(listMap , HttpStatus.OK);
	}
	
	
	@PostMapping("/trashClean")
	public ResponseEntity<?> trashClean() {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
		
		service.allTrashClean(empNo);
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 중요메일함으로
	@PostMapping("/allImportant")
	public ResponseEntity<Map<String, Object>> allImportant(@RequestBody Map<String,Object> paramMap) {
		
		List<Integer> emailNoList = (List<Integer>) paramMap.get("emailNoList");
		int receiveCategory = (int) paramMap.get("receiveCategory");
		int selectedMenu = (int) paramMap.get("selectedMenu");
		int selectedPage = (int) paramMap.get("selectedPage");
		
		log.info("emailNoList : " + emailNoList); 
		log.info("receiveCategory : " + receiveCategory);
		log.info("selectedMenu : " + selectedMenu);
		log.info("selectedPage : " + selectedPage);
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
    	
    	// 사용할 페이징 VO / 기본설정
    	PaginationInfoVO<ReceiveVO> pagingVO = new PaginationInfoVO<ReceiveVO>();
    	pagingVO.setCurrentPage(selectedPage);
    	pagingVO.setEmpNo(empNo);
		pagingVO.setMailMenu(selectedMenu);
		pagingVO.setReceiveCategory(receiveCategory);
    	
		List<ReceiveVO> receiveList = new ArrayList<>();
		ReceiveVO receiveVO = new ReceiveVO();
		
		// 중요메일함으로
		for(int mailNo : emailNoList) {
			service.checkImportantAllMail(mailNo);
		}
		
		
		// 보낸 메일함/임시보관함일 때 mail 보기
		receiveVO.setReceiveEmp(empNo);
		receiveVO.setReceiveCategory(receiveCategory);
		
		receiveList = service.filterReceiveMail(pagingVO);
		
		int totalRecord = service.selectAsyncReceivePaging(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		for(ReceiveVO recVO : receiveList) {
			MailVO mailVO = service.getMailFromMailNo(recVO.getMailNo());
			recVO.setMailVO(mailVO);
		}
		
		getReceiveSenderName(receiveList);
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		pagingVO.setDataList(receiveList);
		
		listMap.put("receiveList", receiveList);
		listMap.put("pagingVO", pagingVO);
		
		return new ResponseEntity<Map<String, Object>>(listMap , HttpStatus.OK);
	}
	
	// 중요 메일 해제
	@PostMapping("/clearImpotant")
	public ResponseEntity<Map<String, Object>> clearImpotant(@RequestBody Map<String,Object> paramMap) {
		
		List<Integer> emailNoList = (List<Integer>) paramMap.get("emailNoList");
		int receiveCategory = (int) paramMap.get("receiveCategory");
		int selectedMenu = (int) paramMap.get("selectedMenu");
		int selectedPage = (int) paramMap.get("selectedPage");
		
		log.info("emailNoList : " + emailNoList); 
		log.info("receiveCategory : " + receiveCategory);
		log.info("selectedMenu : " + selectedMenu);
		log.info("selectedPage : " + selectedPage);
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
    	
    	// 사용할 페이징 VO / 기본설정
    	PaginationInfoVO<ReceiveVO> pagingVO = new PaginationInfoVO<ReceiveVO>();
    	pagingVO.setCurrentPage(selectedPage);
    	pagingVO.setEmpNo(empNo);
		pagingVO.setMailMenu(selectedMenu);
		pagingVO.setReceiveCategory(receiveCategory);
    	
		List<ReceiveVO> receiveList = new ArrayList<>();
		ReceiveVO receiveVO = new ReceiveVO();
		
		// 중요메일 해제
		for(int mailNo : emailNoList) {
			service.clearImportantAllMail(mailNo);
		}
		
		// 보낸 메일함/임시보관함일 때 mail 보기
		receiveVO.setReceiveEmp(empNo);
		receiveVO.setReceiveCategory(receiveCategory);
		
		receiveList = service.filterReceiveMail(pagingVO);
		
		int totalRecord = service.selectAsyncReceivePaging(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		for(ReceiveVO recVO : receiveList) {
			MailVO mailVO = service.getMailFromMailNo(recVO.getMailNo());
			recVO.setMailVO(mailVO);
		}
		
		getReceiveSenderName(receiveList);
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		pagingVO.setDataList(receiveList);
		
		listMap.put("receiveList", receiveList);
		listMap.put("pagingVO", pagingVO);
		
		return new ResponseEntity<Map<String, Object>>(listMap , HttpStatus.OK);
	}
	
	
	
	@PostMapping("/deleteSendMail")
	public ResponseEntity<Map<String, Object>> deleteSendMail(@RequestBody Map<String,Object> paramMap) {
		
		List<Integer> emailNoList = (List<Integer>) paramMap.get("emailNoList");
		int sendCategory = (int) paramMap.get("sendCategory");
		int selectedMenu = (int) paramMap.get("selectedMenu");
		int selectedPage = (int) paramMap.get("selectedPage");
		
		log.info("emailNoList : " + emailNoList); 
		log.info("sendCategory : " + sendCategory);
		log.info("selectedMenu : " + selectedMenu);
		log.info("selectedPage : " + selectedPage);
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
    	
    	// 사용할 페이징 VO / 기본설정
    	PaginationInfoVO<ReceiveVO> pagingVO = new PaginationInfoVO<ReceiveVO>();
    	pagingVO.setCurrentPage(selectedPage);
    	pagingVO.setEmpNo(empNo);
		pagingVO.setMailMenu(selectedMenu);
		pagingVO.setSendCategory(sendCategory);
    	
		List<ReceiveVO> receiveList = new ArrayList<>();
		ReceiveVO receiveVO = new ReceiveVO();
		
		for(int mailNo : emailNoList) {
			if(sendCategory == 2) {
				service.deleteSaveMail(mailNo);
				pagingVO.setCurrentPage(selectedPage);
			} else {
				service.deleteSendMail(mailNo);
			}
		}
		receiveVO.setMailSender(empNo);
		receiveVO.setSendCategory(sendCategory);
		
		receiveList = service.getMySendMail(pagingVO);
		
		int totalRecord = service.selectAsyncReceivePaging(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		for(ReceiveVO recVO : receiveList) {
			MailVO mailVO = service.getMailFromMailNo(recVO.getMailNo());
			recVO.setMailVO(mailVO);
		}
		
		getReceiverName(receiveList);
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		pagingVO.setDataList(receiveList);
		
		listMap.put("receiveList", receiveList);
		listMap.put("pagingVO", pagingVO);
		
		return new ResponseEntity<Map<String, Object>>(listMap , HttpStatus.OK);
	}
	
	
	
	
	
	
	// 이메일 보내기
	@PostMapping("/send")
	public String sendMail(
			@RequestParam(value = "mailFiles",required = false) MultipartFile[] mailFiles, HttpSession session,
			MailVO mailVO, RedirectAttributes rda) throws IOException {
		
		// 만약 mailNo가 있다면
		if(mailVO.getMailNo() != 0) {
			service.deleteSaveMail(mailVO.getMailNo());
		}
		
		log.info("length : " + mailVO.getMailArr().length);

		EmployeeVO empInfo = (EmployeeVO)session.getAttribute("empInfo");
		// 리시브 기본값 설정
		ReceiveVO receiveVO = new ReceiveVO();
		receiveVO.setReceiveRead(1);
		receiveVO.setReceiveCategory(1);
		receiveVO.setMailSender(empInfo.getEmpNo());
		
		// 메일 기본값 설정
		mailVO.setMailSendCategory(1);
		mailVO.setMailSender(empInfo.getEmpNo());
		
		for(int i = 0; i < mailVO.getMailArr().length; i++) {
			mailVO.setMailReceiver(mailVO.getMailArr()[i]);
			receiveVO.setReceiveEmp(mailVO.getMailArr()[i]);
			service.sendMail(mailVO);
			receiveVO.setMailNo(mailVO.getMailNo());
			
			service.insertReceive(receiveVO);
			receiveVO.setMailVO(mailVO);
		}
		
		List<MultipartFile> validFiles = Arrays.stream(mailFiles)
                .filter(file -> !file.isEmpty())
                .collect(Collectors.toList());
		
		if(validFiles.size() > 0) {
			createFile(mailFiles, mailVO.getMailNo());
		}
		
		rda.addFlashAttribute("msg","메일 전송이 완료되었습니다.");
		return "redirect:/email/home";
	}
	
	// 임시보관
	@PostMapping("/saveSendMail")
	public String saveSendMail(HttpSession session,
			MailVO mailVO, RedirectAttributes rda) {
		
		EmployeeVO empInfo = (EmployeeVO)session.getAttribute("empInfo");
		
		// 메일 기본값 설정
		mailVO.setMailSendCategory(2);
		mailVO.setMailSender(empInfo.getEmpNo());
		
		String receiverNoList = "";
		if(mailVO.getMailArr().length != 0) {
			for(Integer receiverNo : mailVO.getMailArr()) {
				receiverNoList += receiverNo + " ";
			}
		}
		
		log.info("mailVO : " + mailVO);
		
		mailVO.setMailReceiverList(receiverNoList);
		
		service.saveTempMail(mailVO);
		
		return "redirect:/email/home";
	}
	
	
	
	// 파일 다운로드
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
	
	
	
	
	// List<ReceiveVO>를 받아 mailSender에 해당하는 empName이 추가 된 List<ReceiveVO>로 리턴하는 함수
	private List<ReceiveVO> getReceiveSenderName(List<ReceiveVO> receiveList) {
		
		List<EmployeeVO> empList = workServie.selectEmpList();
		String empName = "";
		String profileImg = "";
		
		for (ReceiveVO recVO : receiveList) {
			for (EmployeeVO empVO : empList) {
				if(recVO.getMailSender() == empVO.getEmpNo()) {
					empName = empVO.getEmpName();
					profileImg = empVO.getEmpProfileimg();
				}
			}
			recVO.setEmpName(empName);
			recVO.setEmpProfileimg(profileImg);
		}
		
		return receiveList;
	}
	
	private List<ReceiveVO> getReceiverName(List<ReceiveVO> receiveList) {
		List<EmployeeVO> empList = workServie.selectEmpList();
		String empName = "";
		String profileImg = "";
		
		for (ReceiveVO recVO : receiveList) {
			for (EmployeeVO empVO : empList) {
				if(recVO.getReceiveEmp() == empVO.getEmpNo()) {
					empName = empVO.getEmpName();
					profileImg = empVO.getEmpProfileimg();
				}
			}
			recVO.setEmpName(empName);
			recVO.setEmpProfileimg(profileImg);
		}
		
		return receiveList;
	}
	
	
	
	// 이메일용 사원 불러오기
	@PreAuthorize("permitAll")
	@PostMapping("/selectAllMember")
	public ResponseEntity<List<EmployeeVO>> selectAllMember() {
		
		List<EmployeeVO> empList = service.selectAllMember();
		return new ResponseEntity<List<EmployeeVO>>(empList , HttpStatus.OK);
	}
	
	// 파일 만드는 놈입니다.
	private void createFile(MultipartFile[] fileList, int mailNo) throws IOException {
		// files를 먼저 만들어야 fileDetail을 포함할 수 있음
		FilesVO filesVO = new FilesVO();
		filesVO.setFileWhereNo(4);
		filesVO.setFileWherePk(mailNo);
		
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
			
			service.insertMailFile(fileDetailVO);
		}
	}
}
