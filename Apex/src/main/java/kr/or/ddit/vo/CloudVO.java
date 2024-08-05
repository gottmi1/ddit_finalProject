package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CloudVO {
	private int cloudNo;
	private int folderNo;
	private String cloudName;
	private String cloudOriginName;
	private int cloudDownhit;
	private int cloudSize;
	private String cloudFancysize;
	private String cloudDate;
	private String cloudSavepath;
	private String cloudMime;
	private int cloudWriter;
	
	private String cloudImgpath;
	private String cloudDownloadpath;
	
}
