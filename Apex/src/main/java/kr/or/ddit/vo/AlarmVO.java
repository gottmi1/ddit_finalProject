package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class AlarmVO {
	private int armNo;
	private String armContent;
	private Date armDate;
	private int armCategoryNo;
	
	private String armCategoryName;
	
	// 전체 사원 리스트
	private List<EmployeeVO> employeeList; 
	
	// 알람 대상자 리스트
	private List<AlarmToVO> alarmToList;
	
	// 데이트형식 
	private String armDateStr; 
}
