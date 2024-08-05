package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReportCommentVO;
import kr.or.ddit.vo.ReportVO;

public interface IReportMapper {

	// 일일업무보고 목록 조회(페이징)
	public List<ReportVO> selectReportList(PaginationInfoVO<ReportVO> pagingVO);
    
	// 페이징 처리를 위한 게시글 갯수
	public int selectReportCount(PaginationInfoVO<ReportVO> pagingVO);
    
	// 조회 수 증가
	public void incrementHit(int reportNo);
    
	// 게시글 상세
	public ReportVO reportDetail(int reportNo);
    
	// 자유게시판 데이터 등록
	public int insertReport(ReportVO reportVO);
    
	// 파일 테이블 등록(파일 상세를 담을 부모 테이블)
	public int insertFiles(FilesVO filesVO);
    
	// 파일 상세 테이블 등록
	public void insertFileDetail(FileDetailVO fileDetailVO);
    
	// 게시글 수정
	public int updateReport(ReportVO reportVO);
    
	// 게시글 파일 가져오기
	public FileDetailVO selectReportFile(Integer integer);
    
	// 게시글 수정 시 기존 파일 삭제
	public void deleteReportFile(Integer integer);
    
	// 게시글 삭제
	public int deleteReport(int reportNo);
    
	// 사원 이름 가져오기
	public List<EmployeeVO> selectEmpList();
    
	// 게시글 내 댓글/답글 조회 
	public List<ReportCommentVO> selectComment(int reportNo);
    
	// 게시글 내 댓글/답글 등록
	public void addComment(ReportCommentVO commentVO);
    
	// 게시글 내 댓글/답글 수정
	public void modifyComment(ReportCommentVO commentVO);
    
	// 게시글 내 댓글/답글 삭제
	public void deleteComment(ReportCommentVO commentVO);

	// Files 삭제
	public void deleteFiles(Integer integer);

}
