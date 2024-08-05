package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatEntryVO;
import kr.or.ddit.vo.ChatVO;
import kr.or.ddit.vo.ChatroomVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;

public interface IChatMapper {

	public ChatroomVO checkAndCreateRoom(Map<String, Integer> params);

	public void createRoom();

	public void createChatEntry(Map<String, Object> Map);

	public List<ChatVO> chatConversationList(int chatRoomNo);

	public int insertChat(ChatVO chatVO);

	public List<ChatEntryVO> chatRoomList(Map<String, Object> roomMap);

	public String findEmpNameByEmpNo(int myEmpNo);

	public String findOtherByChatroomNo(Map<String, Object> paramMap);

	public void insertFile(FilesVO fileVO);

	public void insertFileDetail(FileDetailVO fileDetailVO);

	public FileDetailVO findFileDetail(int fileNo);






}
