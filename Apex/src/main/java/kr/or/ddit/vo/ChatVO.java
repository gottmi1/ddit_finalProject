package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {
	private int chatNo;
	private int chatroomNo;
	private String chatContent;
	private Date chatDate;
	private int chatWriter;
	
	private String chatWriterName;
	
	//Date 형식
	private String chatDateStr;
	
	private String chatEmpProfileImg;
	private int fileNo;
	private FileDetailVO fileDetailVO;
	
}
