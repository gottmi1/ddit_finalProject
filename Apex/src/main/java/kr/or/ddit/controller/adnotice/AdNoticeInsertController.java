package kr.or.ddit.controller.adnotice;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.IAdnoticeService;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/adnotice")
public class AdNoticeInsertController {
    
    @Inject
    private IAdnoticeService adnoticeService;
    
    @RequestMapping(value = "/form.do", method = RequestMethod.GET)
    public String noticeForm(Model model,HttpSession session) {
        log.info("insert() 실행...");
        
        int pno = (int) session.getAttribute("proNo");
        model.addAttribute("pno", pno);
        model.addAttribute("isProjectPage", true);
        
        return "adnotice/insert";
    }
    
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST)
    public String insertNotice(NoticeVO noticeVO, Model model) {
        log.info("insertNotice() 실행... NoticeVO: " + noticeVO);
        
        // 제목과 내용이 비어 있는지 확인
        if (noticeVO.getNoticeTitle() == null || noticeVO.getNoticeTitle().trim().isEmpty() ||
            noticeVO.getNoticeContent() == null || noticeVO.getNoticeContent().trim().isEmpty()) {
            model.addAttribute("error", "제목과 내용을 모두 입력해주세요.");
            model.addAttribute("pno", noticeVO.getProjectNo()); // 프로젝트 번호도 함께 전달
            return "adnotice/insert";
        }
        
        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int empNo = user.getEmployeeVO().getEmpNo();
        noticeVO.setNoticeWriter(empNo + "");
        adnoticeService.insertNotice(noticeVO);
        
        
        return "redirect:/adnotice/detail.do?noticeNo=" + noticeVO.getNoticeNo();
    }
}