package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class WorksVO {
	private int workNo;
	private int proNo;
	private int workStatus;
	private String workTitle;
	private String workContent;
	private String workFirst;
	private Date workDate;
	private String workStartdate;
	private String workEnddate;
	private int workProg;
	private int workParentNo;
	
	// 히스토리용
	private int worksCnt;
	
	// 중요도 한글로 ㅋㅋ
	private String workFirstName;
	
	// 일감 아래 댓글
	private List<WorkCommentVO> workCommentList;
	
	// 일감 댓글 몇개인지 표현
	private int workCommentCount;
	
	// 담당자
	private List<ManagerVO> managerList;
	
	// 담당자 몇명인지
	private int managerCount;
	
	private List<EmployeeVO> managerDetail;
	
	

}
