package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IAdnoticeMapper {

	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVO);

	public List<NoticeVO> list(PaginationInfoVO<NoticeVO> pagingVO);

	public void incrementHit(int noticeNo);

	public NoticeVO detail(int noticeNo);

	public void deleteNotice(int noticeNo);

	public String selectProjectLeader(int projectNo);

	public void insertNotice(NoticeVO noticeVO);

	public NoticeVO detailNotice(int noticeNo);

	public void updateNotice(NoticeVO noticeVO);

	public EmployeeVO getEmployeeByEmpNo(int empNo);
	
}
