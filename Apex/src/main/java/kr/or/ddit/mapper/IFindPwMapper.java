package kr.or.ddit.mapper;

import java.util.Map;

public interface IFindPwMapper {


	public String getCurrentPassword(Map<String, Object> map);

	public int resetPw(Map<String, Object> map);

	public int getEmpNoByEmpId(String empId);

}
