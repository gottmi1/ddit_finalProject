package kr.or.ddit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

//인증(로그인) 전에 접근을 시도한 URL로 리다이렉트하는 기능을 가지고 있음
//스프링 시큐리티에서 기본적으로 사용되는 구현 클래스임
@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	//요청파라미터 : {username=admin,password=java}
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request
			, HttpServletResponse response,
			Authentication auth) throws ServletException, IOException {
		//******
//		User customUser = (User)auth.getPrincipal();	// 인증된 회원 정보
		
		log.info("rememberMe ===> " + request.getParameter("rememberMe"));
		
		CustomUser customUser = (CustomUser)auth.getPrincipal();	// 인증된 회원 정보
		log.info("username : " + customUser.getUsername());//admin
		EmployeeVO emp = customUser.getEmployeeVO();
		HttpSession session = request.getSession();
		session.setAttribute("empInfo", emp);
		
		if(request.getParameter("rememberMe")!=null) {
			Cookie rememberCookie = new Cookie("rememberMe", customUser.getUsername());
			rememberCookie.setPath("/");
			rememberCookie.setMaxAge(7*24*60*60);
			response.addCookie(rememberCookie);
		}else {
			Cookie[] cookieArr = request.getCookies();
			for(Cookie cookie : cookieArr){
				if("rememberMe".equals(cookie.getName())){
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		
		//admin 아이디가 갖고 있는 권한(role) 목록
		List<String> roleNames = new ArrayList<String>();
		auth.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		
		log.info("roleNames : " + roleNames);
		
		// 시큐리티 내 발생한 에러 세션 정보들을 삭제
		clearAuthenticationAttribute(request);
		
		// 요청이 가지고 있는 request 내 타겟 정보
		// 타겟 정보가 존재한다면 타겟으로 이동시켜준다.
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String targetUrl = "";
	      
	      if(savedRequest != null) {
	    	  targetUrl = savedRequest.getRedirectUrl();
	      }else if(savedRequest ==null || savedRequest.equals("/login")){
	  		if(roleNames.contains("ROLE_ADMIN")) {
				//관리자
				response.sendRedirect("/dashboard");
				return;
			}
			
			if(roleNames.contains("ROLE_USER")) {
				//회원 로그인
				response.sendRedirect("/dashboard");
				return;
			}
	      }
	      
	      log.info("Login Success targetUrl : " + targetUrl);
	      response.sendRedirect(targetUrl);
	}
	
	private void clearAuthenticationAttribute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session == null) {
			return;
		}
		
		// SPRING_SECURITY_LAST_EXCEPTION 값에 해당하는 KEY
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		
		// 요청이 가지고 있는 request 내 타겟 정보
		// 타겟정보가  존재한다면 타겟으로 이동시켜준다.
	}
}
