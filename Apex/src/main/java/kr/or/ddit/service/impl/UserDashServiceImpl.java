package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IUserDashMapper;
import kr.or.ddit.service.IUserDashService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.ProjectsVO;


@Service
public class UserDashServiceImpl implements IUserDashService{

	@Inject
	private IUserDashMapper mapper;

	@Override
	public int selectWorkCount(int empNo) {
		return mapper.selectWorkCount(empNo);
	}

	@Override
	public int selectDoneWorkCount(int empNo) {
		return mapper.selectDoneWorkCount(empNo);
	}

	@Override
	public int selectNoDoneWorkCount(int empNo) {
		return mapper.selectNoDoneWorkCount(empNo);
	}

	@Override
	public int selectLateWorkCount(int empNo) {
		return mapper.selectLateWorkCount(empNo);
	}

	@Override
	public List<BoardVO> selectBoardListTen() {
		return mapper.selectBoardListTen();
	}

	@Override
	public String getEmpName(int empNo) {
		return mapper.getEmpName(empNo);
	}

	@Override
	public List<Integer> selectMemberList(int empNo) {
		return mapper.selectMemberList(empNo);
	}

	@Override
	public ProjectsVO selectProject(int proNo) {
		return mapper.selectProject(proNo);
	}
	
	
}
