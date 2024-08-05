package kr.or.ddit.mapper;

import java.util.List;

import javax.inject.Inject;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.ProjectsVO;

public interface IUserDashMapper {

	public int selectWorkCount(int empNo);

	public int selectDoneWorkCount(int empNo);

	public int selectNoDoneWorkCount(int empNo);

	public int selectLateWorkCount(int empNo);

	public List<BoardVO> selectBoardListTen();

	public String getEmpName(int empNo);


	public List<Integer> selectMemberList(int empNo);

	public ProjectsVO selectProject(int proNo);
	
}
