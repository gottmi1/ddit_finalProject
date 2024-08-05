package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IGanttMapper;
import kr.or.ddit.service.IGanttService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.ManagerVO;
import kr.or.ddit.vo.MembersVO;
import kr.or.ddit.vo.WorksVO;

@Service
public class GanttServiceImpl implements IGanttService {

	@Inject
	private IGanttMapper ganttMapper;

	// 간트차트 화면
	@Override
	public List<WorksVO> ganttChart(int proNo) {
		return ganttMapper.ganttChart(proNo);
	}

	@Override
	public List<WorksVO> workListByProNo(int proNo) {
		return ganttMapper.workListByProNo(proNo);
	}

	@Override
	public WorksVO workDetailByWorkNo(int workNo) {
		// TODO Auto-generated method stub
		return ganttMapper.workDetailByWorkNo(workNo);
	}

	@Override
	public List<ManagerVO> findManager(int workNo) {
		return ganttMapper.findManager(workNo);
	}

	@Override
	public List<EmployeeVO> findManagerDetail(int workNo) {
		return ganttMapper.findManagerDetail(workNo);
	}

	@Override
	public String findProName(int proNo) {
		// TODO Auto-generated method stub
		return ganttMapper.findProName(proNo);
	}
	
}
