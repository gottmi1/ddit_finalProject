package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IAdnoticeService {

	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVO);

	public List<NoticeVO> list(PaginationInfoVO<NoticeVO> pagingVO);

	public NoticeVO selectNotice(int noticeNo);

	public void deleteNotice(int noticeNo);

	public String getProjectLeader(int projectNo);

	public void insertNotice(NoticeVO noticeVO);

	public NoticeVO detailNotice(int noticeNo);

	public void modifyNotice(NoticeVO noticeVO);

	public EmployeeVO getEmployeeByEmpNo(int empNo);
	
	

}
