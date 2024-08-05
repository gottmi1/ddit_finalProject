package kr.or.ddit.vo;

import lombok.Data;

@Data
public class HistoryVO {
//	private String historyColumn;	// 바뀐 컬럼
//	private String historyBefore;	// 변경전 내용
//	private String historyAfter;	// 변경후 내용
//	private String pkNo;	// 바뀐 테이블의 기본키
//	private String manageNo;		// 담당자
//	private int manageNo;
	
	
	private int historyNo;
	private String historyDate;
	private String actionType;		// 등록, 수정 인지 액션지정
	private String hisModifyType;	// 등록, 수정 구분용
	private String hisTbNm;	// 바뀐 테이블명
	
	private int hisWorkNo;
	private String hisWorkManagerList;	// 일감 담당자 :  managerList랑 매칭 (OK)
	private String hisWorkStatus;
	private String hisWorkTitle;
	private String hisWorkContent;
	private String hisWorkFirst;
	private String hisWorkDate;
	private String hisWorkStartdate;
	private String hisWorkEnddate;
	private int hisWorkProg;
	private int hisWorkParentNo;
	private String hisWorkFileOriginName;	// 일감의 첨부파일들
	private int hisWorkCnt;					// 일감 등록, 수정시 조건용
	
	private int hisProNo;
	private String hisProName;
	private String hisProContent;
	private String hisProStartdate;
	private String hisProEnddate;
	private String hisProStatus;
	private String hisProRejectReason;
	private String hisProLeader;			// 프로젝트 팀장
	private String hisProManagerList;		// 프로젝트 담당자들
	private String hisProMemberList;		// 프로젝트 멤버들 : 완료보고서용
	private int hisProCnt;					// 프로젝트 등록, 수정시 조건용
	
	
	
	
//	private String managerName;
//	private int workStatus;
//	private String workTitle;
//	private String workContent;
//	private String workFirst;
//	private Date workDate;
//	private String workStartdate;
//	private String workEnddate;
//	private int workProg;
//	private int workParentNo;
}
