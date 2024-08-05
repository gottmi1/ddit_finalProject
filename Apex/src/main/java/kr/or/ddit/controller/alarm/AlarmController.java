package kr.or.ddit.controller.alarm;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.IAlarmService;
import kr.or.ddit.vo.AlarmToVO;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/alarmApp")
public class AlarmController {
	
	@Inject
	private IAlarmService service;
	
	@PostMapping(value = "/alarmList.do")
	public ResponseEntity<List<AlarmVO>> showMyAlarm(@RequestBody Map<String, Object> empNoMap ){
		String empNoStr = empNoMap.get("empNo").toString();
		int empNo = Integer.parseInt(empNoStr);
		
		
		List<AlarmVO> alarmList = service.showMyAlarm(empNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		for(int i=0; i<alarmList.size(); i++) {
			
			alarmList.get(i).setArmDateStr(sdf.format(alarmList.get(i).getArmDate()));
		}
		
		
		return new ResponseEntity<List<AlarmVO>>(alarmList,HttpStatus.OK);
	}
	
	@PostMapping("/alarmRemove.do")
	public ResponseEntity<ServiceResult> alarmRead(@RequestBody Map<String, Object> empNoMap){
		String empNoStr = empNoMap.get("empNo").toString();
		int empNo = Integer.parseInt(empNoStr);
		
		int status = service.alarmRemove(empNo);
		ServiceResult result = null;
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
			
		
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	@PostMapping("/alarmDetailRemove.do")
	public ResponseEntity<ServiceResult> alarmDetailRead(@RequestBody Map<String, Object> armNoMap ){
		String empNoStr = armNoMap.get("empNo").toString();
		String armNoStr = armNoMap.get("armNo").toString();
		int empNo = Integer.parseInt(empNoStr);
		int armNo = Integer.parseInt(armNoStr);
		
		AlarmToVO vo = new AlarmToVO();
		vo.setArmNo(armNo);
		vo.setEmpNo(empNo);
		
		
		ServiceResult result = null;
		
		int status = service.alarmDetailRemove(vo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	@PostMapping("/viewRed.do")
	public ResponseEntity<?> viewRed(String alarmHtml, HttpSession session){
		session.setAttribute("alarmHtml", alarmHtml);
		log.info("#########  alarmHtml : "+alarmHtml);
		return new ResponseEntity<String>(alarmHtml,HttpStatus.OK);
	}
	
	@PostMapping("/removeRed.do")
	public ResponseEntity<String> removeRed(HttpSession session){
		session.removeAttribute("alarmHtml");
		
		return new ResponseEntity<String>(HttpStatus.OK);
		
	}
	
	@PostMapping("/firstShowRed.do")
	public ResponseEntity<ServiceResult> showRed(HttpSession session){
		ServiceResult result = null;
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
    	List<AlarmToVO> newAlarmList = service.newAlarmList(empNo);
    	
    	if(newAlarmList == null || newAlarmList.size() ==0) {
    		result = ServiceResult.NOTEXIST;
    	}else {
    		result = ServiceResult.EXIST;
    	}
    	
    	return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
		
	}
	
	@PostMapping("/changeYN.do")
	public ResponseEntity<ServiceResult> changeYN(HttpSession session){
		ServiceResult result = null;
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	int empNo = user.getEmployeeVO().getEmpNo();
    	int status = service.changeYN(empNo);
    	
    	if(status >0) {
    		result = ServiceResult.OK;
    	}else {
    		result = ServiceResult.FAILED;
    	}
    	
    	return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
		
	}
	

}
