package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IProjectMapper;
import kr.or.ddit.service.IProjectService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.ProjectReportVO;
import kr.or.ddit.vo.ProjectsVO;
import kr.or.ddit.vo.WorksVO;

@Service
public class ProjectServiceImpl implements IProjectService {

	@Inject
	private IProjectMapper mapper;

	@Override
	public void createProject(ProjectsVO projectVO) {
		mapper.createProject(projectVO);
		mapper.createCloudFolder(projectVO);
		
	}

	@Override
	public List<Integer> selectProNoFromMemberTable(int empNo) {
		return mapper.selectProNoFromMemberTable(empNo);
	}

	@Override
	public List<ProjectsVO> selectMyProject(List<Integer> proNoList) {
		return mapper.selectMyProject(proNoList);
	}

	@Override
	public List<EmployeeVO> selectAllMember() {
		return mapper.selectAllMember();
	}

	@Override
	public EmployeeVO addEntryMember(int empNo) {
		return mapper.addEntryMember(empNo);
	}

	@Override
	public void addProjectMember(Map<String, Integer> paramMap) {
		mapper.addProjectMember(paramMap);
	}

	@Override
	public List<ProjectsVO> selectAllProject(Map<String,Object> paramMap) {
		return mapper.selectAllProject(paramMap);
	}

	@Override
	public ProjectsVO selectProject(int proNo) {
		return mapper.selectProject(proNo);
	}

	@Override
	public int approveProject(int proNo) {
		
		return mapper.approveProject(proNo);
	}

	@Override
	public int companionProject(ProjectsVO proVO) {
		return mapper.companionProject(proVO);
	}

	// projectsReportVO 내용 가져오기
	@Override
	public ProjectReportVO getReport(String proNo) {
		return mapper.getReport(proNo);
	}
	
	// 프로젝트 완료보고서 PDF 미리보기
	@Override
	public ProjectReportVO getProjects(String proNo) {
		return mapper.getProjects(proNo);
	}

	// works내용을 projectsReportVO 안의 workList에 세팅
	@Override
	public List<WorksVO> getWorks(String proNo) {
		return mapper.getWorks(proNo);
	}




}
