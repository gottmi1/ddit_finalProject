package kr.or.ddit.service;

public interface IFindPwService {

	public String getCurrentPassword(String email, String empId);

	public int resetPw(String empId, String empPw);

	public int getEmpNoByEmpId(String empId);

}
