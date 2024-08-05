package kr.or.ddit.vo;

import lombok.Data;

@Data
public class FolderVO {
	private int folderNo;
	private int proNo;
	private String folderName;
	private int parentFolderNo;
}
