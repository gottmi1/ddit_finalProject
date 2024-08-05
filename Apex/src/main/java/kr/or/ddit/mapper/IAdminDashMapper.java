package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ManagerVO;

public interface IAdminDashMapper {

	public int getTotalProjectCount(Map<String, Object> paramMap);

	public int countProjectByStatus(Map<String, Object> paramMap);

	public Integer countProjectBarChart(Map<String, Object> paramMap);

	public List<Map<String, Object>> getProjectCompletionOverTime(Map<String, Object> paramMap);

	public int getTotalWorkCount(Map<String, Object> paramMap);

	public int countWorkByStatus(Map<String, Object> paramMap);

	public List<ManagerVO> getWorkByAssignee(Map<String, Object> paramMap);

	public List<Map<String, Object>> getWorkCompletionOverTime(Map<String, Object> paramMap);

	public int countOverTimeWork(Map<String, Object> paramMap);

	public Integer notCompleteWorkDetail(Map<String, Object> paramMap);
}
