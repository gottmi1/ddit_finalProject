package kr.or.ddit.controller.calendar;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.or.ddit.service.ICalendarService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.CustomUser;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/calendar")
@Controller
public class CalendarController {

    @Autowired
    private ICalendarService calendarService;

    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    
    @PreAuthorize("hasRole('ROLE_USER')")
    @GetMapping("/home")
    public String calendar(Model model, HttpSession session) {
    	session.setAttribute("proNo", null);
    	
    	CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
        List<CalendarVO> calList = calendarService.getAllEvents(empNo);
        String[] friends;
        model.addAttribute("calList", calList);
        return "calendar/calendar";
    }

    @GetMapping("/events.do")
    public ResponseEntity<List<CalendarVO>>  getAllEvents() throws Exception {
    	CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
        List<CalendarVO> calList = calendarService.getAllEvents(empNo);
        return new ResponseEntity<List<CalendarVO>>(calList,HttpStatus.OK);
    }
    
    
    
    

    @PostMapping("/addEvent.do")
    public ResponseEntity<String> insertEvent(@RequestBody Map<String, Object> map){
        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int empNo = user.getEmployeeVO().getEmpNo();
        
        String title = map.get("title").toString();
        String content = map.get("content").toString();
        String startStr = map.get("start").toString();
        String endStr = map.get("end").toString();
        String textColor = map.get("textColor").toString();
        String allday = map.get("allday").toString();
        
        CalendarVO vo = new CalendarVO();
        
        vo.setEmpNo(empNo);
        vo.setTitle(title);
        
        vo.setContent(content);
        
        Date start = null;
        Date end = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        try {
			start = sdf.parse(startStr);
			end = sdf.parse(endStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
        vo.setStartdate(start);
        vo.setEnddate(end);
        
        vo.setTextColor(textColor);
        vo.setAllday(allday);
        
        log.info("title : "+title);
        log.info("content : "+content);
        log.info("startStr : "+startStr);
        log.info("endStr : "+endStr);
        log.info("textColor : "+textColor);
        log.info("allday : "+allday);
        log.info("start : "+start);
        log.info("end : "+end);
        
        int status = calendarService.insertEvent(vo);
        if(status >0) {
        	return new ResponseEntity<String>("success",HttpStatus.OK);
        }else {
        	return new ResponseEntity<String>("failed",HttpStatus.BAD_REQUEST);
        }
        
    }

    @PostMapping("/updateEvent.do")
    public ResponseEntity<String> updateEvent(@RequestBody Map<String, Object> map) {
        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        
        int empNo = user.getEmployeeVO().getEmpNo();
        String startStr = map.get("start").toString();
        String endStr = map.get("end").toString();
        String idStr = map.get("id").toString();
        int id = Integer.parseInt(idStr);
        
        CalendarVO vo = new CalendarVO();
        
        vo.setEmpNo(empNo);
        vo.setId(id);
        Date start = null;
        Date end = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        try {
			start = sdf.parse(startStr);
			end = sdf.parse(endStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
        vo.setStartdate(start);
        vo.setEnddate(end);
        
        
        int status = calendarService.updateEvent(vo);
        if(status >0) {
        	return new ResponseEntity<String>("success",HttpStatus.OK);
        }else {
        	return new ResponseEntity<String>("failed",HttpStatus.BAD_REQUEST);
        }
    }
    
    @PostMapping("/updateEventAllday.do")
    public ResponseEntity<String> updateEventAllday(@RequestBody Map<String, Object> map){
    	CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        
        int empNo = user.getEmployeeVO().getEmpNo();
        String startStr = map.get("start").toString();
        String endStr = map.get("end").toString();
        String idStr = map.get("id").toString();
        int id = Integer.parseInt(idStr);
        
        CalendarVO vo = new CalendarVO();
        
        vo.setEmpNo(empNo);
        vo.setId(id);
        Date start = null;
        Date end = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
			start = sdf.parse(startStr);
			end = sdf.parse(endStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
        vo.setStartdate(start);
        vo.setEnddate(end);
        
        
        int status = calendarService.updateEvent(vo);
        if(status >0) {
        	return new ResponseEntity<String>("success",HttpStatus.OK);
        }else {
        	return new ResponseEntity<String>("failed",HttpStatus.BAD_REQUEST);
        }
    	
    }

    @PostMapping("/deleteEvent.do")
    public ResponseEntity<String> deleteEvent(@RequestBody Map<String, Object> map) {
    	String idStr = map.get("id").toString();
    	int id = Integer.parseInt(idStr);
    	
        int status = calendarService.deleteEvent(id);
         
         
        if(status >0) {
        	return new ResponseEntity<String>("success",HttpStatus.OK);
        }else {
        	return new ResponseEntity<String>("failed",HttpStatus.BAD_REQUEST);
        }
    }
    
    @PostMapping("/eventDetail.do")
    public ResponseEntity<CalendarVO> eventDetail(@RequestBody Map<String, Object> map){
    	String idStr = map.get("id").toString();
    	int id = Integer.parseInt(idStr);
    	CalendarVO vo = calendarService.eventDetail(id);
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    	String startdateStr =sdf.format(vo.getStartdate());
    	String enddateStr = sdf.format(vo.getEnddate());
    	vo.setStartdateStr(startdateStr);
    	vo.setEnddateStr(enddateStr);
    	
    	
    	return new ResponseEntity<CalendarVO>(vo, HttpStatus.OK);
    }
    
    @PostMapping("/updateEventDetail.do")
    public ResponseEntity<String> updateEventDetail(@RequestBody Map<String,Object> map){
    	String idStr = map.get("id").toString();
    	String title = map.get("title").toString();
        String content = map.get("content").toString();
        String startStr = map.get("start").toString();
        String endStr = map.get("end").toString();
        String textColor = map.get("textColor").toString();
        String allday = map.get("allday").toString();
        
        int id = Integer.parseInt(idStr);
        CalendarVO vo = new CalendarVO();
        
        vo.setId(id);
        vo.setTitle(title);
        
        vo.setContent(content);
        
        Date start = null;
        Date end = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        try {
			start = sdf.parse(startStr);
			end = sdf.parse(endStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
        vo.setStartdate(start);
        vo.setEnddate(end);
        
        vo.setTextColor(textColor);
        vo.setAllday(allday);
        
        log.info("title : "+title);
        log.info("content : "+content);
        log.info("startStr : "+startStr);
        log.info("endStr : "+endStr);
        log.info("textColor : "+textColor);
        log.info("allday : "+allday);
        log.info("start : "+start);
        log.info("end : "+end);
    	
    	int status = calendarService.updateEventDetail(vo);
        if(status >0) {
        	return new ResponseEntity<String>("success",HttpStatus.OK);
        }else {
        	return new ResponseEntity<String>("failed",HttpStatus.BAD_REQUEST);
        }
    }
    
}
