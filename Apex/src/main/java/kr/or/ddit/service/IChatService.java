package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatEntryVO;
import kr.or.ddit.vo.ChatVO;
import kr.or.ddit.vo.ChatroomVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;

public interface IChatService {

	public ChatroomVO checkAndCreateRoom(int myEmpNo, int targetEmpNo);

	public void createRoom(int myEmpNo, int targetEmpNo);

	public List<ChatVO> chatConversationList(int chatRoomNo);

	public int insertChat(ChatVO chatVO);

	public List<ChatEntryVO> chatRoomList(Map<String, Object> roomMap);

	public String findOtherByChatroomNo(Map<String, Object> paramMap);

	public int insertFile(FilesVO fileVO);

	public int insertFileDetail(FileDetailVO fileDetailVO);

	public FileDetailVO findFileDetail(int fileNo);



}
