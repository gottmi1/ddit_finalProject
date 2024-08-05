package kr.or.ddit.controller.project;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ai")
public class AiController {
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/home")
	public String aiPage() {
		return "project/ai";
	}
}
