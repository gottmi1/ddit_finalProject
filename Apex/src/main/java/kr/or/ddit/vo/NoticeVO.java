package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeNo;
	private int projectNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private Date noticeModdate;
	private int noticeHit;
	
	private String noticeWriter;
	private int empNo;
	
	private EmployeeVO empVO;
	
	private int rnum;
	
	
}
