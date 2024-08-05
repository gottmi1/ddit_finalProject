package kr.or.ddit.controller.cloud;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	public static String uploadFile(String uploadPath, String originalFileName, byte[] fileData) throws Exception {
		// /2024/05/29/UUID_원본파일명
		
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString() + "_" + originalFileName;
		
		String savedPath = calcPath(uploadPath);
		
		// 배포된 서버 업로드 경로 + /2024/05/29/ + UUID_원본 파일명으로 File target을 하나 만들어 놓는다
		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		// 확장자 추출
		String formatName = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		
		String uploadedFileName = savedPath.replace(File.separatorChar, '/') + "/" + savedName;
		
//		if(MediaUtils.getMediaType(formatName) != null) {
//			makeThumnail(uploadPath,savedPath,savedName);
//		}
		
		return uploadedFileName;
	}
	
//	public static String uploadExpressionFile(String uploadPath, String originalFileName, byte[] fileData) throws Exception {
//		UUID uuid = UUID.randomUUID();
//		String savedName = uuid.toString() + "_" + originalFileName;
//		String savedPath = calcPath(uploadPath);
//		
//		// 배포된 서버 업로드 경로 + /현재날짜/ + UUID_원본파일명으로 파일을 만듬
//		File target = new File(uploadPath + savedPath, savedName);
//		FileCopyUtils.copy(fileData, target);
//		
//		String uploadedFileName = savedPath.replace(File.separatorChar, '/') + "/" + savedName;
//		
//		return uploadedFileName;
//	}
	
	public static void makeThumnail(String uploadPath, String savedName) throws Exception {
		// 썸네일 이미지를 만들기 위해 원본 이미지를 읽는다
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + File.separator + savedName));
		
		// 섬네일 이미지를 만들기 위한 설정
		// Method.AUTOMATIC : 최소 시간 내에 가장 잘 보이는 이미지를 얻기 위한 사용 방식
		// Mode.FIT_TO_HEIGHT : 이미지 방향과 상관 없이 주어진 높이 내에서 가장 잘 맞는 이미지로 계산
		// targetSize : 값 100, 정 사각형 사이즈로 100x100
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		// 업로드한 원본 이미지 앞에 's_'를 붙여 임시 파일로 만들기 위해 경로 + 파일명을 작성
		String thumnailName = uploadPath + File.separator + "s_" + savedName;
		
		File newFile = new File(thumnailName);
		
		String formatName = savedName.substring(savedName.lastIndexOf(".") + 1);
		
		// 's_'가 붙은 섬네일 이미지를 만듬
		ImageIO.write(destImg, formatName.toLowerCase(), newFile);
	}

	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);		// /2024
		
		// DecimalFormat("00") 빈 자리는 0으로 채움 << 많이 쓸거같은데
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);		// /2024/05
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));			// /2024/05/29
		
		// 년월일 폴더 구조에 의한 폴더 생성
		makeDir(uploadPath,yearPath,monthPath,datePath);
		
		return datePath;
	}

	// 가변인자
	// 키워드 '...'를 사용한다
	// [사용법] 타입...변수명 형태로 사용
	// 파라미터로 받은 인자들이 순서대로 들어가 배열 처리됨
	private static void makeDir(String uploadPath, String...paths) {
		// /2024/05/29 폴더가 존재하면 리턴
		// 만들려던 폴더 구조가 이미 만들어져 있는 구조기 떄문에 리턴
		// 그렇지 않으면 폴더 구조를 만들어줌
		if(new File(paths[paths.length - 1]).exists()) {
			return;
		}
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			// 2024 05 29 각각 폴더가 없으면 각각 만들어 줌
			if(!dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
	
}
