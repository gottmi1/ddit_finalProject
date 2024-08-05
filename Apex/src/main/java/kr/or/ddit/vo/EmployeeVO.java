package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Datapublic class EmployeeVO implements Serializable{
//public class EmployeeVO{
	private int empNo;
	private String empId;
	private int positionNo;
	private String empPw;
	private String empName;
	private String empPhone;
	private String empMail;
	private String empBirth;
	private String empProfileimg;
	private String empPostcode;
	private String empAddress1;
	private String empAddress2;
	private String empIndate;
	private String empOutdate;
	private String enabled;
	private String empFireyn;
	private List<EmployeeAuthVO> employeeAuthList; 
	
	private String positionName;
	// 사원 등록 할때 선택했던 프로필 이미지 파일
	private MultipartFile imgFile;
	
	// 이 사원이 속해있는 프로젝트 목록임
	private List<MembersVO> proNoList;
	
	private List<ChatEntryVO> chatroomList;
}
