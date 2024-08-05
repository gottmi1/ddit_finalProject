package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectsVO;

public interface IMyProjectMapper {

	public List<ProjectsVO> selectMyProject(Map<String, Object> paramMap);

	public int selectCompleteWorkCnt(int proNo);

	public int selectWorkCnt(int proNo);

	public List<ProjectsVO> filterMyProject(Map<String, Object> paramMap);

	public void modifyProject(ProjectsVO projectVO);

	public void completeProject(ProjectsVO projectVO);
}
