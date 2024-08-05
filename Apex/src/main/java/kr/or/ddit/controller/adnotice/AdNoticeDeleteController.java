package kr.or.ddit.controller.adnotice;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.or.ddit.service.IAdnoticeService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/adnotice")
public class AdNoticeDeleteController {

    @Inject
    private IAdnoticeService adnoticeService;


    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public String deleteNotice(@RequestParam("noticeNo") int noticeNo, RedirectAttributes redirectAttributes, HttpServletRequest request,
    		HttpSession session) {
        log.info("deleteNotice() 실행");
        
        try {
            adnoticeService.deleteNotice(noticeNo);
            redirectAttributes.addFlashAttribute("message", "공지사항이 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            log.error("공지사항 삭제 중 오류 발생", e);
            redirectAttributes.addFlashAttribute("message", "공지사항 삭제 중 오류가 발생했습니다.");
        }

        return "redirect:/adnotice/list";
    }
}