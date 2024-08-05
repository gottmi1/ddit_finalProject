package kr.or.ddit.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IDashboardMapper;
import kr.or.ddit.service.IDashboardService;
import kr.or.ddit.vo.ManagerVO;

@Service
public class DashboardServiceImpl implements IDashboardService {

	@Inject
	private IDashboardMapper dashboardMapper;
	
	@Override
	public int countWorksByMultipleStatus(Map<String, Object> paramMap) {
		return dashboardMapper.countWorksByMultipleStatus(paramMap);
	}

	@Override
	public int countWorksByStatus(Map<String, Object> paramMap) {
		return dashboardMapper.countWorksByStatus(paramMap);
	}

	@Override
	public int countOverdueWorks(Map<String, Object> paramMap) {
		return dashboardMapper.countOverdueWorks(paramMap);
	}

	@Override
	public List<ManagerVO> getWorksByAssignee(Map<String, Object> paramMap) {
		return dashboardMapper.getWorksByAssignee(paramMap);
	}

	@Override
	public Map<String, List<Object>> getWorkCompletionOverTime(Map<String, Object> paramMap) {
        // 데이터베이스로부터 작업 완료 데이터를 가져옵니다.
        List<Map<String, Object>> rawData = dashboardMapper.getWorkCompletionOverTime((int)paramMap.get("proNo"));
        
        // 변환된 데이터를 저장할 맵을 초기화합니다.
        Map<String, List<Object>> result = new HashMap<>();
        result.put("labels", new ArrayList<>());
        result.put("data", new ArrayList<>());

        // 디버깅 메시지 추가
        System.out.println("Raw Data: " + rawData);

        // 각 데이터 항목을 순회하며 변환합니다.
        for (Map<String, Object> data : rawData) {
            result.get("labels").add(data.get("WORKDATE"));
            result.get("data").add(data.get("COMPLETEDCOUNT"));
        }
        
        // 디버깅 메시지 추가
        System.out.println("Processed Data: " + result);

        return result;
    }

	@Override
	public int getTotalWorksCount(Map<String, Object> paramMap) {
		return dashboardMapper.getTotalWorksCount(paramMap);
	}

	@Override
	public int selectFirstProjectFromEmpNo(int empNo) {
		return dashboardMapper.selectFirstProjectFromEmpNo(empNo);
	}
}
