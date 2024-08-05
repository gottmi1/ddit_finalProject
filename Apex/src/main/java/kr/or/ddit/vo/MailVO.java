package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MailVO {
	private int mailNo;
	private int mailSender;
	private int mailReceiver;
	private String mailTitle;
	private String mailContent;
	private Date mailDate;
	private int mailSendCategory;
	private Integer[] mailArr;
	
	private String empName;
	private String empProfileimg;
	
	private String mailReceiverList;
}
