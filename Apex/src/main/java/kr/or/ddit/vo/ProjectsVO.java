package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProjectsVO {
	private int proNo;
	private String proName;
	private String proContent;
	private String proStartdate;
	private String proEnddate;
	private int proStatus;
	private String proRejectReason;
	private int proLeader;
	
	// 히스토리용
	private int proCnt;
	
	private String leaderName;
	private String leaderProfileimg;
	
	private boolean projectComplete = false;
}
