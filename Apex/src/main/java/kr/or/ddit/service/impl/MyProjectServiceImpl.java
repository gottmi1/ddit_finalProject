package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IMyProjectMapper;
import kr.or.ddit.service.IMyProjectService;
import kr.or.ddit.vo.ProjectsVO;

@Service
public class MyProjectServiceImpl implements IMyProjectService {

	@Inject
	private IMyProjectMapper mapper;
	
	@Override
	public List<ProjectsVO> selectMyProject(Map<String, Object> paramMap) {
		return mapper.selectMyProject(paramMap);
	}

	@Override
	public int selectCompleteWorkCnt(int proNo) {
		return mapper.selectCompleteWorkCnt(proNo);
	}

	@Override
	public int selectWorkCnt(int proNo) {
		return mapper.selectWorkCnt(proNo);
	}

	@Override
	public void modifyProject(ProjectsVO projectVO) {
		mapper.modifyProject(projectVO);
	}

	@Override
	public void completeProject(ProjectsVO projectVO) {
		mapper.completeProject(projectVO);
	}


	
}
