package kr.or.ddit.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IEmployeeService;
import kr.or.ddit.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/employee")
@Controller
public class EmployeeController {
	
	@Inject
	private IEmployeeService service;
	
	@PostMapping("/keyupSearchEmp")
	public ResponseEntity<List<EmployeeVO>> keyupSearchEmp(@RequestBody Map<String, Object> empNameObj){
		
		
		String empName = empNameObj.get("empNameData").toString();
		log.info("##### empName : "+empName);
		
		List<EmployeeVO> empList = service.keyupSearchEmpList(empName);
		
		
		return new ResponseEntity<List<EmployeeVO>>(empList,HttpStatus.OK); 
	}
	
	// 관리자 - 사원 목록 조회 
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value = "/empList.do", method = RequestMethod.GET)
	public String empList(Model model, @RequestParam(required = false) String searchWord) {
		try {
			log.info(" ## empList() 실행!");
			log.info(" ## 검색어: " + searchWord);
			// 검색 조건 설정
			Map<String, Object> searchParams = new HashMap<>();
			
			if(StringUtils.isNotBlank(searchWord)) {
				//searchParams.put("searchType", searchType);
				searchParams.put("searchWord", searchWord);
				
				// 검색 후, 목록 페이지로 이동할 때 검색된 내용을 적용시키기 위한 데이터 전달
				//model.addAttribute("searchType", searchType);
				model.addAttribute("searchWord", searchWord);
			}
			// 전체 게시글 목록을 얻어온다.
			List<EmployeeVO> dataList = service.empList(searchParams);
			log.info(" ## 검색 결과: " + dataList.size() + "건");
			
			model.addAttribute("dataList", dataList);
//			return "employee/emp_admin";
			return "employee/emp_admin";
			
		} catch (Exception e) {
			log.error(" ## empList() 실행 중 오류 발생", e);
	        throw new RuntimeException("검색 중 오류가 발생했습니다.", e);
		}
	}
	
	// 관리자 - 사원 상세보기
//	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/empDetail.do", method = RequestMethod.GET)
	public ResponseEntity<EmployeeVO> getEmpDetail(@RequestParam(value = "empNo", required = false) Integer empNo, Model model) {
		log.info(" ## getEmpDetail() 실행!... empNo = {}", empNo);
		
		// 예외 던지기
		if (empNo == null) {
            throw new IllegalArgumentException(" ## empNo 파라미터 없습니다. 예외 던짐!");
        }
		
		EmployeeVO employee = service.getEmpByNo(empNo);
		model.addAttribute("status", "detail");	// 상세보기 상태로 들어갔는지 flag 필요
		
		return new ResponseEntity<>(employee, HttpStatus.OK);
	}
	
	// 관리자 - 사원 수정 기능
//	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@PreAuthorize("permitAll")
	@RequestMapping(value = "/empUpdate.do", method = RequestMethod.POST)
	public ResponseEntity<?> empModify(HttpServletRequest req, RedirectAttributes ra,
										EmployeeVO employeeVO, Model model) {
		
		
		// empOutdate 값 검증 및 처리
//	    if (employeeVO.getEmpOutdate() != null) {
//	        String empOutdate = employeeVO.getEmpOutdate().trim();
//	        if (empOutdate.isEmpty() || ",".equals(empOutdate)) {
//	            employeeVO.setEmpOutdate(null);
//	        }
//	    }
		
		log.info(" ## empModify() 실행!... empOutdate = |{}|", employeeVO.getEmpOutdate());
		// 퇴직처리
	    if (employeeVO.getEmpOutdate() != null && !"".equals(employeeVO.getEmpOutdate().trim())) {
	        employeeVO.setEmpFireyn("Y");
	    }else {
	    	employeeVO.setEmpFireyn("N");
	    }
	    
	    log.info(" ## empModify() 실행!... employeeVO = {}", employeeVO);
	    
		try {
			ServiceResult result = service.updateEmp(req, employeeVO); 
			if (result.equals(ServiceResult.OK)) { // 수정 성공
//				return new ResponseEntity<>(employeeVO.getEmpName(),"님의 정보 수정을 완료 하였습니다.", HttpStatus.OK);
				String message = "'"+ employeeVO.getEmpName() + "' 님의 정보 수정을 완료 하였습니다.";
				return new ResponseEntity<>(message, HttpStatus.OK);
			} else { // 수정 실패
				model.addAttribute("status", "u");	// 수정하러 들어갔는지 flag 필요
				return new ResponseEntity<>("서버에러, 다시 시도해주세요!", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		} catch (Exception e) {
			log.error("## 사원 수정을 실패: ", e);
	        return new ResponseEntity<>("서버 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value = "/apps-ecommerce-customers.do", method = RequestMethod.GET)
	public String extendedtreeview() {
		log.info(" ## extended-treeview() 실행!");
//			return "apps-ecommerce-customers";
		return "employee/apps-ecommerce-customers";
	}

	
	// 사원관리 - 등록
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value = "/empInsert.do", method = RequestMethod.POST)
	public ResponseEntity<?> empInsert(HttpServletRequest req, EmployeeVO employeeVO, Model model) {
		log.info(" ## empInsert() 실행");
		
		Map<String, String> errors = new HashMap<String, String>();
		
		// 념겨받은 이름 데이터가 비어있을때 에러 설정
		if(StringUtils.isBlank(employeeVO.getEmpName())) {
			errors.put("empName", "이름을 입력해주세요.");
		}
		if(employeeVO.getPositionNo() == 0) {
			errors.put("positionNo", "직급을 선택해주세요.");
		}
		if(StringUtils.isBlank(employeeVO.getEmpMail())) {
			errors.put("empMail", "이메일을 입력해주세요.");
		}
		if(StringUtils.isBlank(employeeVO.getEmpId())) {
			errors.put("empId", "아이디를 입력해주세요.");
		}
		if(StringUtils.isBlank(employeeVO.getEmpPw())) {
			errors.put("empPw", "비밀번호를 입력해주세요.");
		}
		if(StringUtils.isBlank(employeeVO.getEmpPhone())) {
			errors.put("empPhone", "전화번호를 입력해주세요.");
		}
		
		if (!errors.isEmpty()) { // 넘겨받은 데이터가 비정상 (에러 발생)
	        return new ResponseEntity<>(errors, HttpStatus.BAD_REQUEST);
	    } else { // 넘겨받은 데이터가 정상
	        ServiceResult result = service.insertEmp(req, employeeVO); // 회원가입
	        if (result.equals(ServiceResult.OK)) { // 회원가입 성공
	        	return new ResponseEntity<>("회원가입을 완료 하였습니다.", HttpStatus.OK);
	        } else { // 회원가입 실패
	        	model.addAttribute("status", "insert");	// 등록하러 들어갔는지 flag 필요
	            return new ResponseEntity<>("서버에러, 다시 시도해주세요!", HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
	}
	
	// 관리자 - 사원 등록 기능 - id 중복확인 클릭 이벤트 메소드
	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> idCheck(@RequestBody Map<String, String> map){
		log.info("[아이디 중복확인] 넘겨받은 아이디 : " + map.get("empId"));
			
	// 브라우저로 부터 넘겨받은 단일 데이터를 꺼낼 때
	// 0) ajax 설정에서 ContentType 설정을 하지않고, 데이터만 {memId : id}설정해서 넘길때
	// - String memId 로 꺼낼수 있다.
	// - jsp 스크립트 란에 방법 2가지중 2)에 해당
	
	// 1) ajax설정에서 ContentType 설정을 하지않고, 데이터만 JSON.sringify(data) 설정해서 넘길때
	// - @RequestBody로 String memId를 꺼내면 '%7B%22memId%22%3A%22...=' 이런 데이터가 넘어옴
	
	// 2) ajax설정에서 ContentType 설정을 하고, 데이터만 JSON.sringify(data) 설정해서 넘길때
	// - @RequestBody로 String memId를 꺼내면 '데이터만 '{memId : id}' 데이터가 넘어옴
	
	// 3) ajax설정에서 ContentType 설정을 하고, 데이터만 JSON.stringify(data) 설정해서 넘길때
	// - @RequstParam로 String memId로 꺼내면 400에러가 발생
	
	// 4) ajax설정에서 ContentType 설정을 하고, 데이터만 JSON.stringify(data) 설정해서 넘길때
	// - @RequestBody Map<String, String> map을 꺼내면 'a001' 데이터가 넘어옴
	// - jsp 스크린트 란에 방법 2가지중 1)에 해당
		ServiceResult result = service.idCheck(map.get("empId"));
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	
	//----------------관리자 끝-------------------------------------------------------------
	
	
}
