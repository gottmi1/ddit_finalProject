package kr.or.ddit.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.mapper.IEmployeeMapper;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Inject
	private IEmployeeMapper empMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		EmployeeVO employeeVO;
		try {
			employeeVO = empMapper.readByUserId(username);
			log.info("[채민이 체크 포인트] 시큐리티 인증 시, 인증된 객체 정보 만들기 위한 UserDetailsService 만들기 : " + employeeVO);
			return employeeVO == null ? null : new CustomUser(employeeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
