package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IAlarmMapper;
import kr.or.ddit.service.IAlarmService;
import kr.or.ddit.vo.AlarmToVO;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.MembersVO;
import kr.or.ddit.vo.ProjectsVO;

@Service
public class AlarmServiceImpl implements IAlarmService {

	@Inject
	private IAlarmMapper mapper;

	@Override
	public void insertAlarm(AlarmVO alarmVO) {
		mapper.insertAlarm(alarmVO);
	}

	@Override
	public int findAlarmNo() {
		return mapper.findAlarmNo();
	}

	@Override
	public void insertAlarmTo(AlarmToVO alarmToVO) {

		mapper.insertAlarmTo(alarmToVO);
	}

	@Override
	public List<AlarmVO> showMyAlarm(int empNo) {
		return mapper.showMyAlarm(empNo);
	}

	@Override
	public String findWorkName(int workNo) {
		// TODO Auto-generated method stub
		return mapper.findWorkName(workNo);
	}

	@Override
	public int alarmRemove(int empNo) {
		return mapper.alarmRemove(empNo);
	}

	@Override
	public int alarmDetailRemove(AlarmToVO vo) {
		return mapper.alarmDetailRemove(vo);
	}

	@Override
	public ProjectsVO findProjectByProNo(int proNo) {
		return mapper.findProjectByProNo(proNo);
	}

	@Override
	public List<MembersVO> findMemberByProNo(int proNo) {
		return mapper.findMemberByProNo(proNo);
	}

	@Override
	public List<AlarmToVO> newAlarmList(int empNo) {
		return mapper.newAlarmList(empNo);
	}

	@Override
	public int changeYN(int empNo) {
		return mapper.changeYN(empNo);
	}

	@Override
	public List<Integer> findManagerList(int workNo) {
		return mapper.findManagerList(workNo);
	}

	@Override
	public List<Integer> getAllEmpNo() {
		return mapper.getAllEmpNo();
	}
	
	
}
