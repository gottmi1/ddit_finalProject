package kr.or.ddit.handler;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.BinaryWebSocketHandler;

import kr.or.ddit.service.IChatService;
import kr.or.ddit.vo.ChatVO;
import kr.or.ddit.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/chat")
public class ChatHandler extends BinaryWebSocketHandler {
	
	
	@Inject
	private IChatService service;
	
	private Map<WebSocketSession, ChatVO> chatMap = new HashMap<WebSocketSession,ChatVO>();
	private EmployeeVO empInfo;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		empInfo = (EmployeeVO) session.getAttributes().get("empInfo");
		log.info("####### chatting  web소켓 실행 ");
		log.info("로그인한 유저 아이디 "+empInfo.getEmpName());
		chatMap.put(session, new ChatVO());
	}

	// 일단 텍스트 채팅만 
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) {
		String payload = message.getPayload();
		log.info("###### chatpayload "+payload);
		JSONObject jsonObj;
		try {
			jsonObj = new JSONObject(payload);
		} catch (Exception e) {
			log.error("JSON형식으로 묵는데 오류남"+payload,e);
			return;
		}
		
		String chatRoomNoStr = jsonObj.getString("chatroomNo");
		String empNoStr = jsonObj.getString("empNo");
		String chatContent = jsonObj.getString("chatContent");
		
		
		
		int chatroomNo = Integer.parseInt(chatRoomNoStr);
		int empNo = Integer.parseInt(empNoStr);
		
		
		log.info("채팅Handler에서 받은 charoomNo"+chatroomNo);
		log.info("채팅Handler에서 받은 empNo"+empNoStr);
		log.info("채팅Handler에서 받은 chatContent"+chatContent);
		
//		ChatVO chatVO = new ChatVO();
//		chatVO.setChatroomNo(chatroomNo);
//		chatVO.setChatWriter(empNo);
//		chatVO.setChatContent(chatContent);
//		
//		int chatNo = service.insertChat(chatVO);
//		
		
		
//		log.error("chatNo : "+chatNo);
		
		for(WebSocketSession wss : chatMap.keySet()) {
			ChatVO vo = chatMap.get(wss);
			EmployeeVO emp = (EmployeeVO) wss.getAttributes().get("empInfo");
			for(int i=0; i<emp.getChatroomList().size(); i++) {
				if(emp.getChatroomList().get(i).getChatroomNo() == chatroomNo) {
					
					try {
						wss.sendMessage(new TextMessage(chatroomNo+","+empNo));
						log.info("메세지 전송 성공");
					} catch (Exception e) {
						log.error("메세지 전송 실패");
					}
					
					
					
				}
			}
			
			
		}

	}
	

	@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handleBinaryMessage(session, message);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		chatMap.remove(session);
	}

	
}
