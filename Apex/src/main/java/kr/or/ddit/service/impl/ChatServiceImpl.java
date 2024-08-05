package kr.or.ddit.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IChatMapper;
import kr.or.ddit.service.IChatService;
import kr.or.ddit.vo.ChatEntryVO;
import kr.or.ddit.vo.ChatVO;
import kr.or.ddit.vo.ChatroomVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;

@Service
public class ChatServiceImpl implements IChatService {
	
	@Inject
	private IChatMapper mapper;

	@Override
	public ChatroomVO checkAndCreateRoom(int myEmpNo, int targetEmpNo) {
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("myEmpNo", myEmpNo);
		params.put("targetEmpNo", targetEmpNo);
		
		if (params.get("myEmpNo") == null || params.get("targetEmpNo") == null) {
	        throw new IllegalArgumentException("Employee numbers cannot be null");
	    }
		
		
		return mapper.checkAndCreateRoom(params);
	}

	@Override
	public void createRoom(int myEmpNo, int targetEmpNo) {
		
		String otherName = mapper.findEmpNameByEmpNo(targetEmpNo);
		String targetOtherName = mapper.findEmpNameByEmpNo(myEmpNo);
		Map<String, Object> myMap = new HashMap<String, Object>();
		Map<String, Object> otherMap = new HashMap<String, Object>();
		myMap.put("empNo", myEmpNo);
		myMap.put("chatTitle", otherName);
		otherMap.put("empNo", targetEmpNo);
		otherMap.put("chatTitle", targetOtherName);
		mapper.createRoom();
		mapper.createChatEntry(myMap);
		mapper.createChatEntry(otherMap);
		
		
	}

	@Override
	public List<ChatVO> chatConversationList(int chatRoomNo) {
		return mapper.chatConversationList(chatRoomNo);
	}

	@Override
	public int insertChat(ChatVO chatVO) {
		mapper.insertChat(chatVO);
		return chatVO.getChatNo();
		
	}

	@Override
	public List<ChatEntryVO> chatRoomList(Map<String, Object> roomMap) {
		return mapper.chatRoomList(roomMap);
	}

	@Override
	public String findOtherByChatroomNo(Map<String, Object> paramMap) {
		return mapper.findOtherByChatroomNo(paramMap);
	}

	@Override
	public int insertFile(FilesVO fileVO) {
		mapper.insertFile(fileVO);
		return fileVO.getFileNo();
	}

	@Override
	public int insertFileDetail(FileDetailVO fileDetailVO) {
		mapper.insertFileDetail(fileDetailVO);
		return fileDetailVO.getFileDetailNo();
	}

	@Override
	public FileDetailVO findFileDetail(int fileNo) {
		return mapper.findFileDetail(fileNo);
	}



}
