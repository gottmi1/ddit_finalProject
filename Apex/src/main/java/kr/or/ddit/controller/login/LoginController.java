package kr.or.ddit.controller.login;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.IFindPwService;

@Controller
public class LoginController {
	
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	PasswordEncoder pw;
	
	@Inject
	private IFindPwService service;
	
	@PostConstruct
	public void init() {
		log.info("############## " + pw.encode("1234"));
	}
	
	@PreAuthorize("permitAll")
	@GetMapping("/login")
	public String loginForm(String error, String logout, Model model) {
		
		if(error != null) {
			model.addAttribute("error","Login Error");
		}
		if(logout != null) {
			model.addAttribute("logout", "Logout");
		}
		
		return "login/loginForm";
	}
	
	
	@PreAuthorize("permitAll")
	@GetMapping("/")
	public String loginForm2(String error, String logout, Model model) {
		
		if(error != null) {
			model.addAttribute("error","Login Error");
		}
		if(logout != null) {
			model.addAttribute("logout", "Logout");
		}
		
		return "login/loginForm";
	}
	
	@PreAuthorize("permitAll")
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
		
		return "redirect:/login";
	}
	
	@PreAuthorize("permitAll")
	
	@GetMapping("/resetPw")
	public String resetPw() {
		return "findIdPw/resetPw";
	}
	
	
	@PostMapping("/resetPw")
	public String resetPwGood(String empPw, HttpSession session, RedirectAttributes ra) {
		String empId = (String) session.getAttribute("findPw");
		log.info(empPw);
		String newPw = pw.encode(empPw);		
		
		
		int status = service.resetPw(empId, newPw);
		if(status > 0) {
			ra.addFlashAttribute("message2","비밀번호 수정에 성공했습니다. 다시 로그인하세요.");
			session.removeAttribute("findPW");
		}else {
			ra.addFlashAttribute("message2","비밀번호 수정에 실패했습니다.");
			session.removeAttribute("findPW");
		}
		
		
		return "redirect:/login";
	}
	

}
