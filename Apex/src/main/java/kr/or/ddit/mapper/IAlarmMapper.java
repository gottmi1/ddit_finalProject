package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.AlarmToVO;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.MembersVO;
import kr.or.ddit.vo.ProjectsVO;

public interface IAlarmMapper {

	public void insertAlarm(AlarmVO alarmVO);

	public int findAlarmNo();

	public void insertAlarmTo(AlarmToVO alarmToVO);

	public List<AlarmVO> showMyAlarm(int empNo);

	public String findWorkName(int workNo);

	public int alarmRemove(int empNo);

	public int alarmDetailRemove(AlarmToVO vo);

	public ProjectsVO findProjectByProNo(int proNo);

	public List<MembersVO> findMemberByProNo(int proNo);

	public List<AlarmToVO> newAlarmList(int empNo);

	public int changeYN(int empNo);

	public List<Integer> findManagerList(int workNo);

	public List<Integer> getAllEmpNo();


}
