package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReportCommentVO {
	private int reportCoNo;
	private int reportNo;
	private int empNo;
	private String reportCoContent;
	private Date reportCoDate;
	private Date reportCoModdate;
	private int reportCoParentNo;
	
	private String empName;
	private String profileImg;
}
