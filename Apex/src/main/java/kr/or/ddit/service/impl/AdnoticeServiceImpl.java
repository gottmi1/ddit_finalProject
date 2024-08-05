package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IAdnoticeMapper;
import kr.or.ddit.service.IAdnoticeService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class AdnoticeServiceImpl implements IAdnoticeService {
	
	@Inject
	private IAdnoticeMapper mapper;

	@Override
	public int selectNoticeCount(PaginationInfoVO<NoticeVO> pagingVO) {
		return mapper.selectNoticeCount(pagingVO);
	}

	@Override
	public List<NoticeVO> list(PaginationInfoVO<NoticeVO> pagingVO) {
		log.info("mapper.list() 실행");
		return mapper.list(pagingVO);
	}

	@Override
	public NoticeVO selectNotice(int noticeNo) {
		mapper.incrementHit(noticeNo);
		return mapper.detail(noticeNo);
	}

	@Override
	public void deleteNotice(int noticeNo) {
		 mapper.deleteNotice(noticeNo);
		
	}

	 @Override
	    public String getProjectLeader(int projectNo) {
	        return mapper.selectProjectLeader(projectNo);
	    }

	@Override
	public void insertNotice(NoticeVO noticeVO) {
		mapper.insertNotice(noticeVO);
		
	}

	@Override
	public NoticeVO detailNotice(int noticeNo) {
		return mapper.detailNotice(noticeNo);
	}

	@Override
	public void modifyNotice(NoticeVO noticeVO) {
		mapper.updateNotice(noticeVO);
		
	}

	@Override
	public EmployeeVO getEmployeeByEmpNo(int empNo) {
		return mapper.getEmployeeByEmpNo(empNo);
	}

}
