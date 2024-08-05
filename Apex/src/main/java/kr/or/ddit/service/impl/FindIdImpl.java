package kr.or.ddit.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IFindIdMapper;
import kr.or.ddit.service.IFindIdService;
import kr.or.ddit.vo.EmployeeVO;
@Service
public class FindIdImpl implements IFindIdService {

	
	@Inject
    private IFindIdMapper mapper;
	
	@Override
	public String findId(EmployeeVO employeeVO) {
		return mapper.findId(employeeVO);
	}

}
