package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.ProjectReportVO;
import kr.or.ddit.vo.ProjectsVO;
import kr.or.ddit.vo.WorksVO;

public interface IProjectService {
	public void createProject(ProjectsVO projectVO);

	public List<Integer> selectProNoFromMemberTable(int empNo);

	public List<ProjectsVO> selectMyProject(List<Integer> proNoList);

	public List<EmployeeVO> selectAllMember();

	public EmployeeVO addEntryMember(int empNo);

	public void addProjectMember(Map<String, Integer> paramMap);

	public List<ProjectsVO> selectAllProject(Map<String,Object> paramMap);

	public ProjectsVO selectProject(int proNo);

	public int approveProject(int proNo);

	public int companionProject(ProjectsVO proVO);

	public ProjectReportVO getReport(String proNo);		// projectsReportVO 내용 가져오기
	
	public ProjectReportVO getProjects(String proNo);	// 프로젝트 완료보고서 PDF 미리보기

	public List<WorksVO> getWorks(String proNo);		// works내용을 projectsReportVO 안의 workList에 세팅


	
}
