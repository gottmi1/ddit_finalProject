package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.EmployeeVO;

public interface IEmployeeMapper {
	
	public List<EmployeeVO> keyupSearchEmpList(String empNameObj);
	
	public EmployeeVO readByUserId(String username);
	
	public List<EmployeeVO> empList(@Param("params") Map<String, Object> searchParams);	// 관리자 - 사원 목록 
	
	public EmployeeVO getEmpByNo(Integer empNo);	// 관리자 - 사원 상세보기

	public int updateEmp(EmployeeVO employeeVO);	// 관리자 - 사원 수정 기능
	
	public EmployeeVO idCheck(String empId);	// 관리자 - 사원 등록 기능 - id 중복확인 클릭 이벤트 메소드

	public int insertEmp(EmployeeVO employeeVO);	// 사원관리 - 사원 등록 기능

	public void insertAuth(int empNo);		// 회원가입 요구사항 (한명의 회원은 하나의 권한을 무조건 가질수 있도록 권한 등록 - 스프링시큐리티 적용시)

	//목록에서 선택한 사원의 목록
	public List<EmployeeVO> downloadPDF2(Map<String,Object> map);





}
