
package kr.or.ddit.controller.findIdPw;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.IFindPwService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/findIdPw")
public class FindPwController {
	
	@Inject
	private IFindPwService findPwService;
	
	@Autowired
	private JavaMailSender mailSender;
	
    @RequestMapping(value = "/findPw", method = RequestMethod.GET)
    public String findId() {
        return "findIdPw/findPw";             
    }  
	
	
	@PostMapping("/findPw")
    public String findPw(String empMail,String empId, 
    		HttpServletRequest request, Model model, HttpSession session) {
		
		log.info("empMail : "+empMail);
		log.info("empId : "+empId);
				
		
		// 아이디랑 이메일이랑 비교해서 유저가 있는지 확인
		
		String currentPw = findPwService.getCurrentPassword(empMail,empId);
		
		
		// 확인이 안될시 모델에 안됩니다 담아서 return
		if(currentPw == null || currentPw.equals("")) {
			model.addAttribute("message", "맞는 회원정보를 찾을 수 없습니다.");
		}else {
			session.setAttribute("findPw", empId);
			try {
				
				MimeMessage mimeMessage = mailSender.createMimeMessage();
			    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	 
			    messageHelper.setFrom("tkdydgkrl12@naver.com","Apex"); // 보내는사람 이메일 여기선 google 메일서버 사용하는 아이디를 작성하면됨
			    messageHelper.setTo(empMail); // 받는사람 이메일
			    messageHelper.setSubject("[Apex] 비밀번호 재설정" ); // 메일제목
			    messageHelper.setText("고객님 안녕하세요 :) <br/><br/>"
			            + "Apex 비밀번호 재설정을 요청하셔서 이 이메일을 보내드립니다. 다음 링크를 클릭하시면 비밀번호 재설정 화면으로 이동합니다:<br/><br/>"
			            + "<a href='http://192.168.35.29/resetPw'>[비밀번호 초기화]</a><br/><br/>"
			            + "비밀번호 재설정 화면에서 새로운 비밀번호를 등록하신 후, Apex 서비스를 정상적으로 이용하실 수 있습니다.<br/><br/>"
			            + "만약 비밀번호 재설정을 요청하지 않으셨다면 이 이메일을 무시하셔도 됩니다.<br/> "
			            + "문의사항이 있으시면 고객센터로 연락 주시기 바랍니다.<br/><br/>"
			            + "감사합니다.<br/><br/>"
			            + "Apex 드림", true); // 메일 내용
			    
			    
			    mailSender.send(mimeMessage);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("message","이메일 전송 완료.");
			
		}
        return "findIdPw/findPw";
    }
	

	

}
