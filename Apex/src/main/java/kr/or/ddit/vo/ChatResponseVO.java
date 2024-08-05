package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class ChatResponseVO {
	
	private int chatroomNo;
	private List<ChatVO> chatList;
}
