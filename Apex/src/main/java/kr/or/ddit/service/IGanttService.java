package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.ManagerVO;
import kr.or.ddit.vo.MembersVO;
import kr.or.ddit.vo.WorksVO;

public interface IGanttService {

	// 간트차트 화면
	public List<WorksVO> ganttChart(int proNo);

	public List<WorksVO> workListByProNo(int proNo);

	public WorksVO workDetailByWorkNo(int workNo);

	public List<ManagerVO> findManager(int workNo);

	public List<EmployeeVO> findManagerDetail(int workNo);

	public String findProName(int proNo);

}
