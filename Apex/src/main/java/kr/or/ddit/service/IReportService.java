package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReportCommentVO;
import kr.or.ddit.vo.ReportVO;

public interface IReportService {

	// 일일업무보고 목록 조회(페이징)
	public List<ReportVO> selectReportList(PaginationInfoVO<ReportVO> pagingVO);

	// 페이징 처리를 위한 게시글 갯수
	public int selectReportCount(PaginationInfoVO<ReportVO> pagingVO);

	// 게시글 상세
	public ReportVO reportDetail(int reportNo);

	// 게시글 등록(파일 등록)
	public ServiceResult insertReport(HttpServletRequest req, ReportVO reportVO) throws Exception;

	// 게시글 수정
	public ServiceResult updateReport(HttpServletRequest req, ReportVO reportVO);
	
	// 게시글 삭제
	public ServiceResult deleteReport(HttpServletRequest req, int reportNo);
	
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


}
