package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.vo.ProjectsVO;

public interface IMyProjectService {

	public List<ProjectsVO> selectMyProject(Map<String,Object> paramMap);

	public int selectCompleteWorkCnt(int proNo);

	public int selectWorkCnt(int proNo);

	public void modifyProject(ProjectsVO projectVO);

	public void completeProject(ProjectsVO projectVO);
}
