package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class IssueVO {
	private int issueNo;
	private int workNo;
	private String issueContent;
	private Date issueDate;
}
