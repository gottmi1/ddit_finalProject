package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.BoardCommentVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IBoardService {
	
	// 자유게시판 목록 조회(페이징)
	public List<BoardVO> selectBoardlist(PaginationInfoVO<BoardVO> pagingVO);

	// 페이징 처리를 위한 게시글 갯수
	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);

	// 게시글 상세
	public BoardVO boardDetail(int boNo);
	
	// 게시글 등록(파일 등록)
	public ServiceResult insertBoard(HttpServletRequest req, BoardVO boardVO) throws Exception ;
	
	// 게시글 수정
	public ServiceResult updateBoard(HttpServletRequest req, BoardVO boardVO);
	
	// 게시글 삭제
	public ServiceResult deleteBoard(HttpServletRequest req, int boNo);
	
	// 사원 이름 가져오기
	public List<EmployeeVO> selectEmpList();

	// 게시글 내 댓글/답글 조회
	public List<BoardCommentVO> selectComment(int boNo);
	
	// 게시글 내 댓글/답글 등록
	public void addComment(BoardCommentVO commentVO);

	// 게시글 내 댓글/답글 수정
	public void modifyComment(BoardCommentVO commentVO);

	// 게시글 내 댓글/답글 삭제
	public void deleteComment(BoardCommentVO commentVO);

}