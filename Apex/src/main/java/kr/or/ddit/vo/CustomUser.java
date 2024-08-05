package kr.or.ddit.vo;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User {
   
   private EmployeeVO employeeVO;
   
   // User객체를 만들기 위한 첫 번째 생성자
   public CustomUser(String username, String password, 
         Collection<? extends GrantedAuthority> authorities) {
      super(username, password, authorities);
      
   }
   // 커스텀 생성자
   public CustomUser(EmployeeVO employeeVO) {
      super(employeeVO.getEmpId(), employeeVO.getEmpPw(),
    		  employeeVO.getEmployeeAuthList().stream().map(
                  auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));   
      this.employeeVO = employeeVO; 
   }
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
   
}