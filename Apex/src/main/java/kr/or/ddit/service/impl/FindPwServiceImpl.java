package kr.or.ddit.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IFindPwMapper;
import kr.or.ddit.service.IFindPwService;

@Service
public class FindPwServiceImpl implements IFindPwService {
	
	@Autowired
    private IFindPwMapper mapper;

	@Override
	public String getCurrentPassword(String email, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("id", id);
		return mapper.getCurrentPassword(map);
	}

	@Override
	public int resetPw(String empId,String empPw) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empId", empId);
		map.put("empPw", empPw);
		
		return mapper.resetPw(map);
	}

	@Override
	public int getEmpNoByEmpId(String empId) {
		// TODO Auto-generated method stub
		return mapper.getEmpNoByEmpId(empId);
	}

}
