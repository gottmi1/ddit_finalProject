package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hyper")
public class TemplateTestController {
	
	@RequestMapping(value = "/index")
	public String testIndex() {
		return "test";
	}
	
	@RequestMapping(value = "/chat")
	public String testChat() {
		return "saas/apps-chat";
	}
	
	@RequestMapping(value = "/test")
	public String viewTest() {
		return "test";
	}
	
}
