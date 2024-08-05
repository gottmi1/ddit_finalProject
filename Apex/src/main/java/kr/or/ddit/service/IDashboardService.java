package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ManagerVO;

public interface IDashboardService {

	public int getTotalWorksCount(Map<String, Object> paramMap);

	public int countWorksByMultipleStatus(Map<String, Object> paramMap);

	public int countWorksByStatus(Map<String, Object> paramMap);

	public int countOverdueWorks(Map<String, Object> paramMap);

	public List<ManagerVO> getWorksByAssignee(Map<String, Object> paramMap);

	public Map<String, List<Object>> getWorkCompletionOverTime(Map<String, Object> paramMap);

	public int selectFirstProjectFromEmpNo(int empNo);
}
