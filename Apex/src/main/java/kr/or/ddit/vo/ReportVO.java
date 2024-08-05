package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReportVO {
	private int reportNo;
	private int proNo;
	private int empNo;
	private String reportTitle;
	private String reportContent;
	private Date reportDate;
	private Date reportModdate;
	private String reportDelyn;
	private int reportHit;
	
	private String empName;
	private String profileImg;
	
	private String reportWriter;
	
	private List<ReportCommentVO> reportCommentList;
	
	private int  reportCommentCount;
	
	//행번호
	private int rnum;
	
	// 게시긓 수정시 파일 관리
	private Integer[] delReportNo;
	
	private List<MultipartFile> reportFiles;
	private int fileNo;
	private List<FileDetailVO> fileDetailList;
	private FilesVO reportFile;
	
	public void setReportFiles(List<MultipartFile> reportFiles) {
		this.reportFiles = reportFiles;
		if(reportFiles != null) {
			List<FileDetailVO> fileList = new ArrayList<FileDetailVO>();
			for(MultipartFile item : reportFiles) {
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
