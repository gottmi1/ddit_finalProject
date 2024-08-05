package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import kr.or.ddit.vo.ManagerVO;

public interface IAdminDashService {

	public int getTotalProjectCount(Map<String, Object> paramMap);

	public int countProjectByStatus(Map<String, Object> paramMap);

	public Integer countProjectBarChart(Map<String, Object> paramMap);

	public Map<String, List<Object>> getProjectCompletionOverTime(Map<String, Object> paramMap);

	public int getTotalWorkCount(Map<String, Object> paramMap);

	public int countWorkByStatus(Map<String, Object> paramMap);

	public List<ManagerVO> getWorkByAssignee(Map<String, Object> paramMap);

	public Map<String, List<Object>> getWorkCompletionOverTime(Map<String, Object> paramMap);

	public int countOverTimeWork(Map<String, Object> paramMap);

	public Integer notCompleteWorkDetail(Map<String, Object> paramMap);
}

