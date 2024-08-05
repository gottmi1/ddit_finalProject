package kr.or.ddit.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.EmployeeVO;

public interface IEmployeeService {
	
	public List<EmployeeVO> keyupSearchEmpList(String empNameObj);

	public List<EmployeeVO> empList(Map<String, Object> searchParams);		// 관리자 - 사원목록 홈
	
	public EmployeeVO getEmpByNo(Integer empNo);	// 관리자 - 사원 상세보기
	
	public ServiceResult updateEmp(HttpServletRequest req, EmployeeVO employeeVO);	// 관리자 - 사원 수정 기능

	public ServiceResult insertEmp(HttpServletRequest req, EmployeeVO employeeVO);	// 사원관리 - 사원 등록 기능

	public ServiceResult idCheck(String string);	// 관리자 - 사원 등록 기능 - id 중복확인 클릭 이벤트 메소드

	//목록에서 선택한 사원의 목록
	public List<EmployeeVO> downloadPDF2(Map<String,Object> map);




}
