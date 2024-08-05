package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.ProjectsVO;

public interface IUserDashService {

	public int selectWorkCount(int empNo);

	public int selectDoneWorkCount(int empNo);

	public int selectNoDoneWorkCount(int empNo);

	public int selectLateWorkCount(int empNo);

	public List<BoardVO> selectBoardListTen();

	public String getEmpName(int boWriterNo);

	public List<Integer> selectMemberList(int empNo);

	public ProjectsVO selectProject(int proNo);

}
