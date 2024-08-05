package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.BoardCommentVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IBoardMapper {

	// 자유게시판 목록 조회(페이징)
	public List<BoardVO> selectBoardlist(PaginationInfoVO<BoardVO> pagingVO);

	// 페이징 처리를 위한 게시글 갯수
	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);

	// 게시글 상세
	public BoardVO boardDetail(int boNo);
	
	// 조회 수 증가
	public void incrementHit(int boNo);

	// 자유게시판 데이터 등록
	public int insertBoard(BoardVO boardVO);

	// 파일 테이블 등록(파일 상세를 담을 부모 테이블)
	public int insertFiles(FilesVO filesVO);

	// 파일 상세 테이블 등록
	public void insertFileDetail(FileDetailVO fileDetailVO);

	// 게시글 수정
	public int updateBoard(BoardVO boardVO);

	// 게시글 파일 가져오기
	public FileDetailVO selectBoardFile(Integer integer);

	// 게시글 수정 시 기존 파일 삭제
	public void deleteBoardFile(Integer integer);

	// Files 삭제
	public void deleteFiles(Integer integer);

	// 게시글 삭제
	public int deleteBoard(int boNo);

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
