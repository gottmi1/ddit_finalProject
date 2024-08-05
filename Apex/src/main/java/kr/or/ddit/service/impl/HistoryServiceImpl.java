package kr.or.ddit.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IHistoryMapper;
import kr.or.ddit.service.IHistoryService;
import kr.or.ddit.vo.HistoryVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class HistoryServiceImpl implements IHistoryService {

	@Inject
	private IHistoryMapper mapper;

	// 히스토리 목록
	@Override
	public List<HistoryVO> getHistoryList(Map<String, Object> searchParams) {
        return mapper.getHistoryList(searchParams);
	}

	// 전체 레코드 수 조회
	@Override
	public int getTotalRecords(Map<String, Object> searchParams) {
        return mapper.getTotalRecords(searchParams);
	}

	// 일감 등록,수정시 히스토리에 등록
	@Override
	public void worksInsertHistory(HistoryVO historyVO) {
		mapper.worksInsertHistory(historyVO);
		
	}

	// 프로젝트 등록,수정시 히스토리에 등록
	@Override
	public void projectsInsertHistory(HistoryVO historyVO) {
		mapper.projectsInsertHistory(historyVO);
	}

	// 프로젝트 멤버 목록 조회
	@Override
	public List<Integer> findMemberList(int proNo) {
		return mapper.findMemberList(proNo);
	}
}
