package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardCommentVO {
	private int boCoNo;
	private int boNo;
	private int empNo;
	private String boCoContent;
	private Date boCoDate;
	private Date boCoModdate;
	private String boCoDelyn;
	private int boCoParentNo;
	
	private String empName;
	private String profileImg;
	
}
