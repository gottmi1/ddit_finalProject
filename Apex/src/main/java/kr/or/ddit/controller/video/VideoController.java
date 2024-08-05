package kr.or.ddit.controller.video;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.IVideoService;
import lombok.extern.slf4j.Slf4j;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Controller
@Slf4j
@RequestMapping("/video")
public class VideoController {
	// okhttp3와 simplejson을 이용해야함
	
	@Inject
	private IVideoService service;
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/home")
	public String videoList(Model model, HttpSession session) throws Exception {
		OkHttpClient client = new OkHttpClient();

		session.setAttribute("proNo", null);
		
		//목록 불러오기
		Request request = new Request.Builder()
		  .url("https://openapi.gooroomee.com/api/v1/room/list?page=1&limit=10&sortCurrJoinCnt=true")
		  .get()
		  .addHeader("accept", "application/json")
		  .addHeader("X-GRM-AuthToken", "12056163501988613cf51b7b51cdd8140bb172761d02211a8b")
		  .build();
		//response에 결과값이 담겨있다.
		Response response = client.newCall(request).execute();
		
		
		// jsonobject로 변환해서 보내기
        JSONParser jsonParser = new JSONParser();
        Object obj = jsonParser.parse(response.body().string());
        JSONObject jsonObj = (JSONObject) obj;
        
		                        
		model.addAttribute("roomList", jsonObj);
		
			 
			
		return "video/videoList";
	}
	
	@PostMapping(value ="/join", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject join(@RequestBody Map<String,Object> jsonObj, HttpServletRequest req, Model model) throws Exception {
		// 입장
		log.info("join메소드 실행!");
		String strMemId = jsonObj.get("memId").toString();
		String strRoomId = jsonObj.get("roomId").toString();
		
		OkHttpClient client = new OkHttpClient();
		
		MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
		okhttp3.RequestBody body = okhttp3.RequestBody.create(mediaType, "roomId="+strRoomId+"&username="+strMemId+"&roleId=participant&apiUserId=gooroomee-"+strMemId+"&ignorePasswd=false");
		Request request = new Request.Builder()
		  .url("https://openapi.gooroomee.com/api/v1/room/user/otp/url")
		  .post(body)
		  .addHeader("accept", "application/json")
		  .addHeader("content-type", "application/x-www-form-urlencoded")
		  .addHeader("X-GRM-AuthToken", "12056163501988613cf51b7b51cdd8140bb172761d02211a8b")
		  .build();
		
		// response에 값이 담겨있음
		Response response = client.newCall(request).execute();
		// jsonobject로 변환하여 보내기
		JSONParser jsonParser = new JSONParser();
	    Object obj = jsonParser.parse(response.body().string()); 
	    JSONObject jsonObj2 = (JSONObject) obj;
	    
		
		return jsonObj2;
	}
	
	
	@PostMapping("/deleteroom")
	@ResponseBody
	public JSONObject deleteRoom(@RequestBody Map<String,Object> roomId) throws Exception {
		
		// 삭제기능 시작
		String strRoomId = roomId.get("roomId").toString();
		
		OkHttpClient client = new OkHttpClient();

		Request request = new Request.Builder()
		  .url("https://openapi.gooroomee.com/api/v1/room/"+strRoomId)
		  .delete(null)
		  .addHeader("accept", "application/json")
		  .addHeader("X-GRM-AuthToken", "12056163501988613cf51b7b51cdd8140bb172761d02211a8b")
		  .build();

		Response response = client.newCall(request).execute();
		// 삭제기능 완료 
		
		
		
		// 다시 목록 불러오기 시작
		client = new OkHttpClient();

	 	request = new Request.Builder()
		  .url("https://openapi.gooroomee.com/api/v1/room/list?page=1&limit=10&sortCurrJoinCnt=true")
		  .get()
		  .addHeader("accept", "application/json")
		  .addHeader("X-GRM-AuthToken", "12056163501988613cf51b7b51cdd8140bb172761d02211a8b")
		  .build();
	
		 response = client.newCall(request).execute();
		// 다시 목록 불러오기 끝
		
		 
		//jsonobjcet로 파싱하여 보내주기
		JSONParser jsonParser = new JSONParser();
		Object obj = jsonParser.parse(response.body().string());
        JSONObject jsonObj = (JSONObject) obj;
		
		
		
		return jsonObj;
	}
	
	
	@PostMapping("/createroom")
	@ResponseBody
	public JSONObject createroom(@RequestBody Map<String,Object> value) throws Exception {
		
		String roomName = value.get("title").toString();
		String maxStr = value.get("max").toString();
		int max = Integer.parseInt(maxStr);
		
		// 방 만들기
		OkHttpClient client = new OkHttpClient();
		MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
		okhttp3.RequestBody body = okhttp3.RequestBody.create(mediaType, "callType=P2P&liveMode=false&maxJoinCount="+max+"&liveMaxJoinCount=100&layoutType=4&roomTitle="+roomName+"&durationMinutes=3000");
		Request request = new Request.Builder()
		  .url("https://openapi.gooroomee.com/api/v1/room")
		  .post(body)
		  .addHeader("accept", "application/json")
		  .addHeader("content-type", "application/x-www-form-urlencoded")
		  .addHeader("X-GRM-AuthToken", "12056163501988613cf51b7b51cdd8140bb172761d02211a8b")
		  .build();
		
		Response response = client.newCall(request).execute();
		// 방만들기 완료
		
		// 목록 불러오기
		 	client = new OkHttpClient();
		 	request = new Request.Builder()
		  .url("https://openapi.gooroomee.com/api/v1/room/list?page=1&limit=10&sortCurrJoinCnt=true")
		  .get()
		  .addHeader("accept", "application/json")
		  .addHeader("X-GRM-AuthToken", "12056163501988613cf51b7b51cdd8140bb172761d02211a8b")
		  .build();
	
		 response = client.newCall(request).execute();
		// 목록 불러오기 끝
		
		
		// json형식으로 바꾸기
        JSONParser jsonParser = new JSONParser();
        Object obj = jsonParser.parse(response.body().string());
        JSONObject jsonObj = (JSONObject) obj;
		
		return jsonObj;
		
	}
	
	
	

}
