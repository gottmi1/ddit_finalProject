package kr.or.ddit.controller.cloud;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;


public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	
	// 정적 초기화 블록, 인스턴스 생성시 가장 먼저 실행됨
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
	}
	
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
}
