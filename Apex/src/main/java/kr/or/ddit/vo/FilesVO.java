package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FilesVO {
	// 파일 첨부할때 한개씩 늘어남
	private int fileNo;
	// sysdate
	private String fileRegdate;
	// 어느 게시판에서 왔는지
	private int fileWhereNo;
	// 네가 넣을 게시물의 테이블 pk번호
	private int fileWherePk;
	
	// fileVO아래 fileDetail들의 모음집
	//SELECT 2) FILES : FILE_DETAIL = 1 : N
	private List<FileDetailVO> fileList;
	
	// 파일이 한개면 여기다 담아볼까
	private FileDetailVO fileDetailVO;
}
