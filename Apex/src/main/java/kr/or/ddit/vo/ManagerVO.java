package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ManagerVO {
	private int managerNo;
	private int workNo;
	private int empNo;
	
	// 이름넣기
	private String empName;
	
	// 매니저 몇명인지 넣기
	private int managerCount;
}
