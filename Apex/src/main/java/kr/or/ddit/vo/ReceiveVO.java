package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ReceiveVO {
	private int receiveNo;
	private int mailNo;
	private int receiveEmp;
	private int mailSender;
	private int receiveCategory;
	private int receiveRead;
	private MailVO mailVO;
	
	private String empName;
	private String empProfileimg;
	
	private String receiveDelYn;
	
	private int sendCategory;
}
