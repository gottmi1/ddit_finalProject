package kr.or.ddit.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.service.IAlarmService;
import kr.or.ddit.vo.AlarmToVO;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.MembersVO;
import kr.or.ddit.vo.ProjectsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/alarm")
public class AlarmHandler extends TextWebSocketHandler {
	
	@Inject
	private IAlarmService service;
	
	private Map<WebSocketSession, AlarmVO> alarmMap = new HashMap<WebSocketSession,AlarmVO>();
	private EmployeeVO empInfo;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		empInfo = (EmployeeVO) session.getAttributes().get("empInfo");
		log.info("####### alarm 소케 실행 ");
		log.info("로그인한 유저 아이디 "+empInfo.getEmpName());
		alarmMap.put(session, new AlarmVO());
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String payload = message.getPayload();
		log.info("###### message.getPayload : "+payload);
		JSONObject jsonObj;
		
		try {
			jsonObj = new JSONObject(payload);
		} catch (Exception e) {
			log.error("JSON형식으로 묵는데 오류남"+payload,e);
			return;
		}
		
		String type;
		String value;
		String name;
		String workNoStr;
		String proNoStr;
		int workNo;
		int proNo;
		
		try {
			type = jsonObj.getString("type");
			value = jsonObj.getString("value");
			name = jsonObj.getString("name");
			workNoStr = jsonObj.getString("workNo");
			proNoStr = jsonObj.getString("proNo");
			
			workNo = Integer.parseInt(workNoStr);
			proNo = Integer.parseInt(proNoStr);
		} catch (Exception e) {
			log.error("키없음 :"+payload,e);
			return;
		}
		String workName = service.findWorkName(workNo);
		
		int alarmCategoryNo = 0;
		
		log.info("alarmHandler에서 받는 type : "+type);
		log.info("alarmHandler에서 받는 value : "+value);
		log.info("alarmHandler에서 받는 name : "+name);
		log.info("alarmHandler에서 받는 workNo : "+workNoStr);
		log.info("alarmHandler에서 받는 proNo : "+proNoStr);
		
		// 일감제목찾기
		
//		updateStatus : 일감상태변경
//		createProject : 프로젝트신청
//		approveProject : 프로젝트 승인
		String workStatus = null;
		String projectStatus = null;
		if(type.equals("updateStatus")) {
			//일감상태변경 area
			alarmCategoryNo = 2;
			if(value.equals("1")) {
				workStatus = "할 일";
			}else if(value.equals("2")) {
				workStatus = "진행중";
			}else if(value.equals("3")) {
				workStatus = "완료";
			}else if(value.equals("4")) {
				workStatus = "이슈발생";
			}
			
			// emp안에 있는 프로젝트리스트가 있어야 함..
			// tq
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setArmCategoryNo(2);
			alarmVO.setArmContent("["+name+"] 님이 ["+workName+"]의 일감 상태를 ["+ workStatus + "] (으)로 변경했습니다.");
			service.insertAlarm(alarmVO);
			int alarmNo = service.findAlarmNo();
			
			List<Integer> managerList = service.findManagerList(workNo);
			// 10, 1, 3
			for(int i =0; i<managerList.size(); i++) {
				
				AlarmToVO alarmToVO = new AlarmToVO();
				alarmToVO.setEmpNo(managerList.get(i));
				alarmToVO.setArmNo(alarmNo);
				
				service.insertAlarmTo(alarmToVO);
			}
			
			
			for(WebSocketSession wss : alarmMap.keySet()) {
				AlarmVO vo = alarmMap.get(wss);
				EmployeeVO emp = (EmployeeVO) wss.getAttributes().get("empInfo");
//				wss.sendMessage(new TextMessage("알람을 이용한 일감 상태 업데이트중."));
				for(int i=0; i<emp.getProNoList().size(); i++) {
					if(emp.getProNoList().get(i).getProNo() == proNo) {
						
						try {
							wss.sendMessage(new TextMessage("알람을 이용한 일감 상태 업데이트입니다!!"));
						} catch (Exception e) {
							log.error("메시지 전송 실패: " + wss, e);
						}
						
						
						
					}
					
				}
				
			}
			
		} else if(type.equals("createProject")) {
			//프로젝트 생성신청 area
			alarmCategoryNo= 5;
			
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setArmCategoryNo(alarmCategoryNo);
			alarmVO.setArmContent("["+name+"] 님이 새 프로젝트를 생성 신청했습니다.");
			service.insertAlarm(alarmVO);
			int alarmNo = service.findAlarmNo();
			
			for(WebSocketSession wss : alarmMap.keySet()) {
				AlarmVO vo = alarmMap.get(wss);
				EmployeeVO emp = (EmployeeVO) wss.getAttributes().get("empInfo");
				for(int i=0; i<emp.getEmployeeAuthList().size(); i++) {
					if(emp.getEmployeeAuthList().get(i).getAuth().equals("ROLE_ADMIN")) {
						AlarmToVO alarmToVO = new AlarmToVO();
						alarmToVO.setEmpNo(emp.getEmpNo());
						alarmToVO.setArmNo(alarmNo);
						service.insertAlarmTo(alarmToVO);
						try {
							wss.sendMessage(new TextMessage("프로젝트 생성 신청 알림입니다 !!"));
						} catch (Exception e) {
							log.error("메시지 전송 실패: " + wss, e);
						}
						
					}
				}
			}
			
		} else if(type.equals("approveProject")) {
			alarmCategoryNo = 1;
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setArmCategoryNo(alarmCategoryNo);
			alarmVO.setArmContent("["+value+"] 프로젝트의 승인이 완료되었습니다.");
			service.insertAlarm(alarmVO);
			int alarmNo = service.findAlarmNo();
			
			ProjectsVO projectVO = service.findProjectByProNo(proNo);
			List<MembersVO> memberList = service.findMemberByProNo(proNo);
			
			for(WebSocketSession wss : alarmMap.keySet()) {
				AlarmVO vo = alarmMap.get(wss);
				EmployeeVO emp = (EmployeeVO) wss.getAttributes().get("empInfo");
				for(int i=0; i<memberList.size(); i++) {
					
					if(proNo == memberList.get(i).getProNo()) {
						AlarmToVO alarmToVO = new AlarmToVO();
						alarmToVO.setEmpNo(memberList.get(i).getEmpNo());
						alarmToVO.setArmNo(alarmNo);
						service.insertAlarmTo(alarmToVO);
						try {
							wss.sendMessage(new TextMessage("프로젝트 승인 알림입니다 !"));
						} catch (Exception e) {
							log.error("메시지 전송 실패 : "+wss, e);
						}
						
						
					}
					
				}
			}
			
			
		}else if(type.equals("rejectProject")) {
			alarmCategoryNo = 6;
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setArmCategoryNo(alarmCategoryNo);
			String[] valueArr = value.split(",");
			
			alarmVO.setArmContent("["+valueArr[0]+"] 프로젝트가 반려되었습니다. <br/> 반려사유 : ["+valueArr[1]+"]");
			service.insertAlarm(alarmVO);
			int alarmNo = service.findAlarmNo();
			
			ProjectsVO projectVO = service.findProjectByProNo(proNo);
			
			for(WebSocketSession wss : alarmMap.keySet()) {
				AlarmVO vo = alarmMap.get(wss);
				EmployeeVO emp = (EmployeeVO) wss.getAttributes().get("empInfo");
				for(int i=0; i<emp.getProNoList().size(); i++) {
					
					if(projectVO.getProLeader() == emp.getEmpNo() ) {
						AlarmToVO alarmToVO = new AlarmToVO();
						alarmToVO.setEmpNo(emp.getEmpNo());
						alarmToVO.setArmNo(alarmNo);
						service.insertAlarmTo(alarmToVO);
						try {
							wss.sendMessage(new TextMessage("프로젝트 반려 알림입니다 !"));
						} catch (Exception e) {
							log.error("메시지 전송 실패 : "+wss, e);
						}
						
						
					}
					
				}
			}
		}else if(type.equals("addNotice")) {
			alarmCategoryNo = 3;
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setArmCategoryNo(alarmCategoryNo);
			ProjectsVO projectVO =  service.findProjectByProNo(proNo);
			String proName = projectVO.getProName(); 
			
			alarmVO.setArmContent("["+proName+"] 프로젝트의 공지사항이 추가되었습니다.");
			service.insertAlarm(alarmVO);
			int alarmNo = service.findAlarmNo();
			List<MembersVO> memberList = service.findMemberByProNo(proNo);
			
			for(WebSocketSession wss : alarmMap.keySet()) {
				AlarmVO vo = alarmMap.get(wss);
				EmployeeVO emp = (EmployeeVO) wss.getAttributes().get("empInfo");
				for(int i=0; i<memberList.size(); i++) {
					
					if(proNo == memberList.get(i).getProNo()) {
						AlarmToVO alarmToVO = new AlarmToVO();
						alarmToVO.setEmpNo(memberList.get(i).getEmpNo());
						alarmToVO.setArmNo(alarmNo);
						service.insertAlarmTo(alarmToVO);
						try {
							wss.sendMessage(new TextMessage("프로젝트 공지사항 추가 알림입니다 !"));
						} catch (Exception e) {
							log.error("메시지 전송 실패 : "+wss, e);
						}
						
						
					}
					
				}
			}
			
			
		}else if(type.equals("email")) {
			alarmCategoryNo = 4;
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setArmCategoryNo(alarmCategoryNo);
			
			alarmVO.setArmContent("새로운 이메일이 도착했습니다.");
			service.insertAlarm(alarmVO);
			int alarmNo = service.findAlarmNo();
			
//			name = empNo들어있음
			int empNo = Integer.parseInt(name);
//			List<Integer> empNoList = service.getAllEmpNo();
			
			AlarmToVO alarmToVO = new AlarmToVO();
			alarmToVO.setEmpNo(empNo);
			alarmToVO.setArmNo(alarmNo);
			
			service.insertAlarmTo(alarmToVO);
			
			for(WebSocketSession wss: alarmMap.keySet()) {
				AlarmVO vo = alarmMap.get(wss);
				EmployeeVO emp = (EmployeeVO) wss.getAttributes().get("empInfo");
				if(empNo == emp.getEmpNo()) {
					try {
						wss.sendMessage(new TextMessage("이메일 알림입니다 !"));
					} catch (Exception e) {
						log.error("메시지 전송 실패 : "+wss, e);
					}
				}
				
			}
			
			
		}else if(type.equals("updateWork")) {
			String insertModVal = null;
			AlarmVO alarmVO = new AlarmVO();
			
			if(value.equals("일감 수정")) {
				alarmCategoryNo = 7;
				insertModVal = "수정";
				alarmVO.setArmCategoryNo(7);
				
			}else if(value.equals("일감 등록")) {
				alarmCategoryNo = 8;
				alarmVO.setArmCategoryNo(8);
				insertModVal = "등록";
			}
			
			alarmVO.setArmContent("["+name+"] 님이 일감 ["+workName+"]을 "+insertModVal+"했습니다.");
			service.insertAlarm(alarmVO);
			int alarmNo = service.findAlarmNo();
			
			List<Integer> managerList = service.findManagerList(workNo);
			// 10, 1, 3
			for(int i =0; i<managerList.size(); i++) {
				
				AlarmToVO alarmToVO = new AlarmToVO();
				alarmToVO.setEmpNo(managerList.get(i));
				alarmToVO.setArmNo(alarmNo);
				
				service.insertAlarmTo(alarmToVO);
			}
			
			
			for(WebSocketSession wss : alarmMap.keySet()) {
				AlarmVO vo = alarmMap.get(wss);
				EmployeeVO emp = (EmployeeVO) wss.getAttributes().get("empInfo");
//				wss.sendMessage(new TextMessage("알람을 이용한 일감 상태 업데이트중."));
				for(int i=0; i<emp.getProNoList().size(); i++) {
					if(emp.getProNoList().get(i).getProNo() == proNo) {
						
						try {
							wss.sendMessage(new TextMessage("알람을 이용한 일감 상태 업데이트입니다!!"));
						} catch (Exception e) {
							log.error("메시지 전송 실패: " + wss, e);
						}
						
						
						
					}
					
				}
				
			}
			
			
			
			
			
			
		}
		
		
		
		
		
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		alarmMap.remove(session);
		
	}
	
}
