package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {

	private int boNo;
	private int empNo;
	private String boTitle;
	private String boContent;
	private int boHit;
	private Date boDate;
	private Date boModdate;
	private String boDelyn;
	private String boDateStr;
	private String token;

	private String empName;
	private String profileImg;
	
	private String boWriter;// DB에 없음
	
	
	
	private List<BoardCommentVO> boardCommentList;
	
	private int boardCommentCount;
	

	// 행번호
	private int rnum;

	// 게시글 수정시 파일관리
	private Integer[] delBoardNo;
	
	// 자유게시판 파일 등록을 위한
	private List<MultipartFile> boFiles;
	private int fileNo;
	private List<FileDetailVO> fileDetailList;
	
	//SELECT 1) BOARD : FILES = 1 : 1
	private FilesVO boFile;

	public void setBoFiles(List<MultipartFile> boFiles) {
		this.boFiles = boFiles;
		if(boFiles != null) {
			List<FileDetailVO> fileList = new ArrayList<FileDetailVO>();
			for(MultipartFile item : boFiles) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				FileDetailVO fileDetailVO = new FileDetailVO(item);
				fileList.add(fileDetailVO);
			}
			this.fileDetailList = fileList;
		}
	}

}
