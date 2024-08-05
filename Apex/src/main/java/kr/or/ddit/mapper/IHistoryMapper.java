package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.HistoryVO;

public interface IHistoryMapper {

	public List<HistoryVO> getHistoryList(Map<String, Object> searchParams); // 히스토리 목록

	public int getTotalRecords(Map<String, Object> searchParams);	// 전체 레코드 수 조회

	public void worksInsertHistory(HistoryVO historyVO);		// 일감 등록,수정시 히스토리에 등록

	public void projectsInsertHistory(HistoryVO historyVO);		// 프로젝트 등록,수정시 히스토리에 등록

	public List<Integer> findMemberList(int proNo);			// 프로젝트 멤버 목록 조회

}
