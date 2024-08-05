package kr.or.ddit.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IEmployeeMapper;
import kr.or.ddit.service.IEmployeeService;
import kr.or.ddit.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmployeeServiceImpl implements IEmployeeService {
	
	@Inject
	private IEmployeeMapper mapper;
	
	// 시큐리티 적용 - 암호화된 비밀번호 받기 위함
	@Inject
	private PasswordEncoder pw;

	@Override
	public List<EmployeeVO> keyupSearchEmpList(String empNameObj) {
		
		return mapper.keyupSearchEmpList(empNameObj);
	}

	// 관리자 - 사원목록 
	@Override
	public List<EmployeeVO> empList(Map<String, Object> searchParams) {
		log.info(" ## empList 서비스() 호출됨");
        log.info(" ## 검색 파라미터: " + searchParams);
        List<EmployeeVO> dataList = mapper.empList(searchParams);
        log.info(" ## 검색 결과: " + dataList.size() + "건");

        return dataList;
//		return mapper.empList(searchParams);
	}

	// 관리자 - 사원 상세보기
	@Override
	public EmployeeVO getEmpByNo(Integer empNo) {
		return mapper.getEmpByNo(empNo);
	}
	
	// 관리자 - 사원 수정 기능
	@Override
	public ServiceResult updateEmp(HttpServletRequest req, EmployeeVO employeeVO) {
		
		ServiceResult result = null;
		
		// 회원가입 시, 프로필 이미지로 파일 업로드 하는데 이때 업로드 할 서버 경로
		String uploadPath = req.getServletContext().getRealPath("/resources/privateCSS/LDY/profile");
		
		// 폴더 구조의 위치를 갖고 있는 파일 객체 생성
		File file = new File(uploadPath);
		// 해당 경로에 폴더구조가 만들어져 있는지 체크
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String profileImg = "";	// 회원정보에 추가할 프로필 이미지 경로
		try {
			// 회원가입 할때 선택했던 프로필 이미지 파일
			MultipartFile profileImgFile = employeeVO.getImgFile();
			
			// 넘겨받은 파일 데이터가 있는지 체크
			if(profileImgFile.getOriginalFilename() != null && !profileImgFile.getOriginalFilename().equals("")) {
				String fileName = UUID.randomUUID().toString();				// UUID 파일명 생성
				fileName += "_" + profileImgFile.getOriginalFilename();		// UUID_원본파일명 생성
				uploadPath += "/" + fileName;	// /resources/profile/UUID_원본파일명 구조 생성(완전체)
				profileImgFile.transferTo(new File(uploadPath));			// 파일 복사: transferTo 안에 완전체의 File객체를 넣기
				profileImg = "/resources/privateCSS/LDY/profile/" + fileName;			// 파일 복사가 일어난 파일의 위치로 접근하기 위한 URI설정
			}
			// VO에 설정
			employeeVO.setEmpProfileimg(profileImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 시큐리티 인증 
		// 넘겨받은 비밀번호를 암호화처리 하여 데이터를 넘겨준다
		employeeVO.setEmpPw(pw.encode(employeeVO.getEmpPw()));	// 비밀번호 암호화 하기
		
		int status = mapper.updateEmp(employeeVO);
		
		if(status > 0) {	// 수정 성공
			
			// 수정 요구사항 (한명의 회원은 하나의 권한을 무조건 가질수 있도록 권한 등록 - 스프링시큐리티 적용시)
//			mapper.insertAuth(employeeVO.getEmpNo());	// selectkey가 있다
			result = ServiceResult.OK;
		}else {				// 회원가입 실패
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 사원관리 - 사원 등록 기능
	@Override
	public ServiceResult insertEmp(HttpServletRequest req, EmployeeVO employeeVO) {
		ServiceResult result = null;
		
		// 회원가입 시, 프로필 이미지로 파일 업로드 하는데 이때 업로드 할 서버 경로
		String uploadPath = req.getServletContext().getRealPath("/resources/privateCSS/LDY/profile");
		
		// 폴더 구조의 위치를 갖고 있는 파일 객체 생성
		File file = new File(uploadPath);
		// 해당 경로에 폴더구조가 만들어져 있는지 체크
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String profileImg = "";	// 회원정보에 추가할 프로필 이미지 경로
		try {
			// 회원가입 할때 선택했던 프로필 이미지 파일
			MultipartFile profileImgFile = employeeVO.getImgFile();
			
			// 넘겨받은 파일 데이터가 있는지 체크
			if(profileImgFile.getOriginalFilename() != null && !profileImgFile.getOriginalFilename().equals("")) {
				String fileName = UUID.randomUUID().toString();				// UUID 파일명 생성
				fileName += "_" + profileImgFile.getOriginalFilename();	// UUID_원본파일명 생성
				uploadPath += "/" + fileName;	// /resources/profile/UUID_원본파일명 구조 생성(완전체)
				profileImgFile.transferTo(new File(uploadPath));		// 파일 복사: transferTo 안에 완전체의 File객체를 넣기
				profileImg = "/resources/privateCSS/LDY/profile/" + fileName;			// 파일 복사가 일어난 파일의 위치로 접근하기 위한 URI설정
			}
			// VO에 설정
			employeeVO.setEmpProfileimg(profileImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 시큐리티 인증 
		// 넘겨받은 비밀번호를 암호화처리 하여 데이터를 넘겨준다
		employeeVO.setEmpPw(pw.encode(employeeVO.getEmpPw()));	// 비밀번호 암호화 하기
		
		int status = mapper.insertEmp(employeeVO);
		
		if(status > 0) {	// 회원가입 성공
			
			// 회원가입 요구사항 (한명의 회원은 하나의 권한을 무조건 가질수 있도록 권한 등록 - 스프링시큐리티 적용시)
			mapper.insertAuth(employeeVO.getEmpNo());	// selectkey가 있다
			result = ServiceResult.OK;
		}else {				// 회원가입 실패
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 관리자 - 사원 등록 기능 - id 중복확인 클릭 이벤트 메소드
	@Override
	public ServiceResult idCheck(String empId) {
		ServiceResult result = null;
		EmployeeVO employeeVO = mapper.idCheck(empId);
		if(employeeVO != null) {	// VO존재할때
			result = ServiceResult.EXIST;
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}

	//목록에서 선택한 사원의 목록
	@Override
	public List<EmployeeVO> downloadPDF2(Map<String,Object> map) {
		return this.mapper.downloadPDF2(map);
	}


}
