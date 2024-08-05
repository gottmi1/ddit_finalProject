package kr.or.ddit.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IAdminDashMapper;
import kr.or.ddit.service.IAdminDashService;
import kr.or.ddit.vo.ManagerVO;


@Service
public class AdminDashServiceImpl implements IAdminDashService {
	
	@Inject
	private IAdminDashMapper mapper;

	@Override
	public int getTotalProjectCount(Map<String, Object> paramMap) {
		return mapper.getTotalProjectCount(paramMap);
	}

	@Override
	public int countProjectByStatus(Map<String, Object> paramMap) {
		return mapper.countProjectByStatus(paramMap);
	}

	@Override
	public Integer countProjectBarChart(Map<String, Object> paramMap) {
		return mapper.countProjectBarChart(paramMap);
	}

	@Override
	public Map<String, List<Object>> getProjectCompletionOverTime(Map<String, Object> paramMap) {
		// 데이터베이스로부터 작업 완료 데이터를 가져옵니다.
        List<Map<String, Object>> rawData = mapper.getProjectCompletionOverTime(paramMap);
        
        // 변환된 데이터를 저장할 맵을 초기화합니다.
        Map<String, List<Object>> result = new HashMap<>();
        result.put("labels", new ArrayList<>());
        result.put("data", new ArrayList<>());

        // 디버깅 메시지 추가
        System.out.println("Raw Data: " + rawData);

        // 각 데이터 항목을 순회하며 변환합니다.
        for (Map<String, Object> data : rawData) {
            result.get("labels").add(data.get("PRODATE"));
            result.get("data").add(data.get("COMPLETEDCOUNT"));
        }
        
        // 디버깅 메시지 추가
        System.out.println("Processed Data: " + result);

        return result;
	}

	@Override
	public int getTotalWorkCount(Map<String, Object> paramMap) {
		return mapper.getTotalWorkCount(paramMap);
	}

	@Override
	public int countWorkByStatus(Map<String, Object> paramMap) {
		return mapper.countWorkByStatus(paramMap);
	}

	@Override
	public List<ManagerVO> getWorkByAssignee(Map<String, Object> paramMap) {
		return mapper.getWorkByAssignee(paramMap);
	}

	@Override
	public Map<String, List<Object>> getWorkCompletionOverTime(Map<String, Object> paramMap) {
		// 데이터베이스로부터 작업 완료 데이터를 가져옵니다.
        List<Map<String, Object>> rawData = mapper.getWorkCompletionOverTime(paramMap);
        
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
	public int countOverTimeWork(Map<String, Object> paramMap) {
		return mapper.countOverTimeWork(paramMap);
	}

	@Override
	public Integer notCompleteWorkDetail(Map<String, Object> paramMap) {
		return mapper.notCompleteWorkDetail(paramMap);
	}

}
