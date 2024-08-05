package kr.or.ddit.controller.chat;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.controller.cloud.UploadFileUtils;
import kr.or.ddit.handler.ChatHandler;
import kr.or.ddit.service.IChatService;
import kr.or.ddit.vo.ChatEntryVO;
import kr.or.ddit.vo.ChatResponseVO;
import kr.or.ddit.vo.ChatVO;
import kr.or.ddit.vo.ChatroomVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/chatApp")
@Controller
@Slf4j
public class ChatController {
	
	@Inject
	private IChatService service;
	
	@Resource(name = "uploadPath")
	private String resourcePath;
	
	@PostMapping("/showChatList.do")
	public ResponseEntity<ChatResponseVO> createOrCheckRoom(@RequestBody Map<String, Object> myMap ){
		String targetEmpNoStr = myMap.get("targetEmpNo").toString();
		String myEmpNoStr = myMap.get("myEmpNo").toString();
		
		
		
		int targetEmpNo = Integer.parseInt(targetEmpNoStr);
		int myEmpNo = Integer.parseInt(myEmpNoStr);
		log.info(targetEmpNo+"타겟empNo");
		log.info(myEmpNo+"나의empNo");
		
		ChatroomVO chatRoomVo =service.checkAndCreateRoom(myEmpNo,targetEmpNo);
		if(chatRoomVo == null) {
			service.createRoom(myEmpNo,targetEmpNo);
			chatRoomVo =service.checkAndCreateRoom(myEmpNo,targetEmpNo);
		}
		log.info("#######444444444444444444444444");
		
		int chatRoomNo = chatRoomVo.getChatroomNo();
		
		List<ChatVO> chatList = service.chatConversationList(chatRoomNo);
		
		
		FileDetailVO fileDetailVO = new FileDetailVO();
		for(int i=0; i<chatList.size(); i++) {
			fileDetailVO = service.findFileDetail(chatList.get(i).getFileNo());
			if(fileDetailVO != null) {
				chatList.get(i).setFileDetailVO(fileDetailVO);
				
			}
				
		}
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		for(int i=0; i<chatList.size(); i++) {
			chatList.get(i).setChatDateStr(sdf.format(chatList.get(i).getChatDate()));
		}
		
		ChatResponseVO chatResponseVO = new ChatResponseVO();
		chatResponseVO.setChatList(chatList);
		chatResponseVO.setChatroomNo(chatRoomNo);
		
		return new ResponseEntity<ChatResponseVO>(chatResponseVO,HttpStatus.OK);
		
	}
	
	@PostMapping("/showChatListByChatroomNo.do")
	public ResponseEntity<ChatResponseVO> showChatListByChatroomNo(@RequestBody Map<String, Object> myMap){
		String chatRoomStr = myMap.get("chatroomNo").toString();
		int chatRoomNo = Integer.parseInt(chatRoomStr);
		
		List<ChatVO> chatList = service.chatConversationList(chatRoomNo);
		
		FileDetailVO fileDetailVO = new FileDetailVO();
		for(int i=0; i<chatList.size(); i++) {
			fileDetailVO = service.findFileDetail(chatList.get(i).getFileNo());
			if(fileDetailVO != null) {
				chatList.get(i).setFileDetailVO(fileDetailVO);
				
			}
			
		}
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		for(int i=0; i<chatList.size(); i++) {
			chatList.get(i).setChatDateStr(sdf.format(chatList.get(i).getChatDate()));
		}
		
		ChatResponseVO chatResponseVO = new ChatResponseVO();
		chatResponseVO.setChatList(chatList);
		chatResponseVO.setChatroomNo(chatRoomNo);
		
		return new ResponseEntity<ChatResponseVO>(chatResponseVO,HttpStatus.OK);
	}
	
	@PostMapping("/showChatRoomList.do")
	public ResponseEntity<List<ChatEntryVO>> showChatRoomList(@RequestBody Map<String, Object> mMap){
		String empNoStr = mMap.get("empNo").toString();
		int empNo = Integer.parseInt(empNoStr);
		Map<String, Object> roomMap = new HashMap<String, Object>();
		roomMap.put("empNo", empNo);
		
		log.info("########### empNo : "+empNo);
		
		List<ChatEntryVO> list = service.chatRoomList(roomMap);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setChatDateStr(sdf.format(list.get(i).getChatDate()));
		}
		
		return new ResponseEntity<List<ChatEntryVO>>(list,HttpStatus.OK);
	}
	
	@PostMapping("/showChatRoomListSearch.do")
	public ResponseEntity<List<ChatEntryVO>> showChatRoomListSearch(@RequestBody Map<String, Object> mMap){
		String empNoStr = mMap.get("empNo").toString();
		int empNo = Integer.parseInt(empNoStr);
		String searchValue = mMap.get("searchValue").toString();
		Map<String, Object> roomMap = new HashMap<String, Object>();
		roomMap.put("empNo", empNo);
		roomMap.put("searchValue", searchValue);
		
		log.info("########### empNo : "+empNo);
		
		List<ChatEntryVO> list = service.chatRoomList(roomMap);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setChatDateStr(sdf.format(list.get(i).getChatDate()));
		}
		
		return new ResponseEntity<List<ChatEntryVO>>(list,HttpStatus.OK);
	}
	
	
	@PostMapping("/findOtherByChatroomNo.do")
	public ResponseEntity<String> findOtherByChatroomNo(@RequestBody Map<String, Object> paramMap){
		
		String imgUrl = service.findOtherByChatroomNo(paramMap);
		
		if(imgUrl == null) {
			imgUrl = "";
		}
		log.info("### imgUrl ==  "+imgUrl);
		return new ResponseEntity<String>(imgUrl,HttpStatus.OK);
	}
	
	@PostMapping("/viewRed.do")
	public ResponseEntity<?> viewRed(@RequestBody Map<String, Object> map, HttpSession session){
		String chatHtml = map.get("chatHtml").toString();
		session.setAttribute("chatHtml", chatHtml);
		log.info("#########  alarmHtml : "+chatHtml);
		
		return new ResponseEntity<String>(chatHtml,HttpStatus.OK);
	}
	
	@PostMapping("/removeRed.do")
	public ResponseEntity<?> removeRed(HttpSession session){
		session.removeAttribute("chatHtml");
		
		return new ResponseEntity<String>(HttpStatus.OK);
		
	}
	
	@PostMapping(value = "/uploadChatFile.do/{chatNo}", produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file, @PathVariable("chatNo") String chatNoStr) throws Exception{
		int chatNo = Integer.parseInt(chatNoStr);
		
		UUID uuid = UUID.randomUUID();
		FilesVO fileVO = new FilesVO();
		FileDetailVO fileDetailVO = new FileDetailVO();
		
		fileVO.setFileWherePk(chatNo);
		fileVO.setFileWhereNo(2);
		
		// 파일 만들기
		int fileNo = service.insertFile(fileVO);
		
		File tempFile = new File(resourcePath);
		
		if (!tempFile.exists()) {
			tempFile.mkdirs();
		}
		
		fileDetailVO.setFileNo(fileNo); //
		fileDetailVO.setFileOriginName(file.getOriginalFilename()); //
		fileDetailVO.setFileSize(file.getSize()); //
		
		String savedName = uuid.toString()+"_"+file.getOriginalFilename();
		fileDetailVO.setFileSaveName(savedName); //
		fileDetailVO.setFileUrl(resourcePath+"/"+savedName); //
		
		String formatName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") +1);
		fileDetailVO.setFileMime(formatName); //
		
		String savePath = resourcePath + "/" + savedName;
		File target = new File(savePath);
		FileCopyUtils.copy(file.getBytes(), target);
		long size = target.length();
		String fancySize = FileUtils.byteCountToDisplaySize(size);
		fileDetailVO.setFileFancysize(fancySize); //
		
		String mimeType = fileDetailVO.getFileMime().toLowerCase();
		
		if(mimeType.equals("png") || mimeType.equals("jpg")) {
			UploadFileUtils.makeThumnail(resourcePath,savedName);
		}
		
		String imgPath = "/resource/upload/s_"+savedName;
		String downloadPath ="/resource/upload/"+savedName;
		
		int fileDetailNo = service.insertFileDetail(fileDetailVO);
		
		
		return new ResponseEntity<String>(""+fileDetailNo,HttpStatus.OK);
		
	}
	
	@PostMapping("/downloadFile.do")
	public ResponseEntity<InputStreamResource> downloadChatFile(@RequestParam String fileName,
			@RequestParam String originalFileName) throws FileNotFoundException{
		File file = new File(resourcePath +"/"+ fileName);
		FileInputStream fileInputStream = new FileInputStream(file);
        InputStreamResource resource = new InputStreamResource(fileInputStream);
        return ResponseEntity.ok()
        		.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + originalFileName)
        		.contentType(MediaType.APPLICATION_OCTET_STREAM)
        		.contentLength(file.length())
        		.body(resource);
	}
	
	@PostMapping("/insertChat.do")
	public ResponseEntity<Integer> insertChat(@RequestBody Map<String, Object> map){
		int chatroomNo = Integer.parseInt(map.get("chatroomNo").toString());
		int empNo = Integer.parseInt(map.get("empNo").toString());
		String chatContent = map.get("textInput").toString();
		
		ChatVO chatVO = new ChatVO();
		chatVO.setChatroomNo(chatroomNo);
		chatVO.setChatWriter(empNo);
		chatVO.setChatContent(chatContent);
		
		int chatNo = service.insertChat(chatVO);
		
		
		return new ResponseEntity<Integer>(chatNo,HttpStatus.OK);
	}
	
	
	@PostMapping("/view.do")
	public ResponseEntity<byte[]> view(String fileName){
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		String nameo = fileName.substring(fileName.length()-3, fileName.length());
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			in = new FileInputStream(resourcePath+fileName);
			if(nameo.equals("png")) {
				headers.setContentType(MediaType.IMAGE_PNG);
			}else {
				headers.setContentType(MediaType.IMAGE_JPEG);
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			try {
				in.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return entity;
		
	}
	
	
	
}
