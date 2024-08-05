package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChatEntryVO {
	private int chatroomNo;
	private int empNo;
	private int chatStartno;
	private int chatReadno;
	private String chatTitle;
	
	// 참여자이름
	private String empName;
	private String otherEmpName;
	private int otherEmpNo;
	
	private String lastChat;
	private Date chatDate;
	
	private String chatDateStr;
	
	private String empProfileimg;
	private String otherEmpProfileimg;
}
