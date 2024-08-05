package kr.or.ddit.controller.adnotice;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.IAdnoticeService;
import kr.or.ddit.vo.NoticeVO;

@Controller
@RequestMapping("/adnotice")
public class AdnoticeModifyController {
	
	@Inject
    private IAdnoticeService adnoticeService;
	
	// 수정 폼을 표시하는 메소드
	@PostMapping("/modify")
    public String modifyForm(int noticeNo, Model model) {
        NoticeVO noticeVO = adnoticeService.detailNotice(noticeNo);
        model.addAttribute("notice", noticeVO);
        model.addAttribute("pno", noticeVO.getProjectNo());
        model.addAttribute("isProjectPage", true);
        return "adnotice/modify";
    }

    // 수정 요청을 처리하는 메소드
	@PostMapping("/modify.do")
    public String modifyNotice(NoticeVO noticeVO, HttpServletRequest request) {
		adnoticeService.modifyNotice(noticeVO);
        return "redirect:/adnotice/list";
    }

}
