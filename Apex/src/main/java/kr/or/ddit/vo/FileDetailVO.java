package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileDetailVO {
	// 파일 디테일 번호
	private MultipartFile item;
	private int fileDetailNo;
	private int fileNo;
	private String fileSaveName;
	private String fileOriginName;
	private String fileFancysize;
	private long fileSize;
	private String fileUrl;
	private String fileMime;
	private String imgUrl;
	
	public FileDetailVO() {}
	
	public FileDetailVO(MultipartFile item) {
		this.item = item;
		this.fileOriginName = item.getOriginalFilename();
		this.fileSize = item.getSize();
		this.fileMime = item.getContentType();
		
	}
}
