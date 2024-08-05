package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CalendarVO {
	private int id;
	private int empNo;
	private String title;
	private String content;
	private Date startdate;
	private Date enddate;
	private String textColor;
	private String allday;
	
	private String startdateStr;
	private String enddateStr;
}
