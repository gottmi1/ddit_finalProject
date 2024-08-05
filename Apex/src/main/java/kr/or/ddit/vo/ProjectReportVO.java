package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProjectReportVO {
	
	// 프로젝트 내용 
	private int proNo;
    private String proName;
    private String proContent;
    private Date proStartdate;
    private Date proEnddate;
    private String proStatus;
    private String proRejectReason;
    private String hisProLeaderName;
    private String hisProMemberList;
    private int proMemberCount;
    
    // 일감 중첩자바빈즈
    private List<WorksVO> workList;
    
    // 해당 프로젝트의 일감들
//    private int workNo;
//    private String workStatus;
//    private String workTitle;
//    private String workContent;
//    private String workFirst;
//    private Date workDate;
//    private Date workStartdate;
//    private Date workEnddate;
//    private String workProg;
//    private int workParentNo;
    private String workManagerList;
//    private int workManagerCount;
    
}
