package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WorkCommentVO {
	private int workCoNo;
	private int workNo;
	private int workCoWriter;
	private String workCoContent;
	private Date workCoDate;
	private Date workCoModdate;
	private int workCoParentNo;
	
	private String empName;
	private String profileImg;
	private String empNo;
}
