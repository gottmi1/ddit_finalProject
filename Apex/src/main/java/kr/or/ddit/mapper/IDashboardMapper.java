package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ManagerVO;

public interface IDashboardMapper {

	int countWorksByMultipleStatus(Map<String, Object> paramMap);

	int countWorksByStatus(Map<String, Object> paramMap);

	int countOverdueWorks(Map<String, Object> paramMap);

	List<ManagerVO> getWorksByAssignee(Map<String, Object> paramMap);

	List<Map<String, Object>> getWorkCompletionOverTime(int proNo);

	int getTotalWorksCount(Map<String, Object> paramMap);

	int selectFirstProjectFromEmpNo(int empNo);

}
