package kr.or.ddit.controller.findIdPw;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.IFindIdService;
import kr.or.ddit.vo.EmployeeVO;

@Controller
@RequestMapping("/findIdPw")
public class FindIdController {
    
    @Inject
    private IFindIdService findIdService;

    @RequestMapping(value = "/findId", method = RequestMethod.GET)
    public String findId() {
        return "findIdPw/findId";             
    }  

    @PostMapping("/findId")
    public String findIdResult(EmployeeVO employeeVO, Model model) {
        String id = findIdService.findId(employeeVO);
        
        if (id != null) {
            String maskedId = maskId(id);
            model.addAttribute("id", maskedId);
        } else {
            model.addAttribute("message", "해당 ID를 찾을 수 없습니다.");
        }
        return "findIdPw/findId";
    }

    private String maskId(String id) {
        if (id.length() > 8) {
            StringBuilder maskedId = new StringBuilder();
            for (int i = 0; i < 8; i++) {
                maskedId.append('*');
            }
            maskedId.append(id.substring(8));
            return maskedId.toString();
        } else {
            return id;
        }
    }
}