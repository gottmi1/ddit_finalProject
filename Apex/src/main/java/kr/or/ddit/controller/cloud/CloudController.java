package kr.or.ddit.controller.cloud;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import kr.or.ddit.service.ICloudService;
import kr.or.ddit.vo.CloudVO;
import kr.or.ddit.vo.FolderVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cloud")
@Slf4j
public class CloudController {
	// ------------------------------------------------------------- test
	@GetMapping("/file")
	public String viewCloud() {
		return "fileCloud/cloud";
	}
	
	@GetMapping("/fileCloud")
	public String viewCloud2() {
		return "fileCloud/fileCloud";
	}
	
	@GetMapping("/chart")
	public String view() {
		return "saas/charts-apex-line";
	}
	
	@GetMapping("/tree")
	public String view19() {
		return "fileCloud/treemap";
	}
	
	@GetMapping("/treeView")
	public String view22() {
		return "fileCloud/treeview";
	}
	// ------------------------------------------------------------- test
	
	@Inject
	private ICloudService cloudService;
	
	@Resource(name = "uploadPath")
	private String resourcePath;
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/fileManager")
	public String viewFileManager(Model model, RedirectAttributes rda, HttpSession session ) throws Exception {
		model.addAttribute("isProjectPage", true);
		
		log.info("fileManger에 접속 됨.");
		
		int proNo = (int)session.getAttribute("proNo");
		
		List<CloudVO> fileList = cloudService.selectAllList();
		List<FolderVO> folderList = cloudService.selectAllFolder(proNo);
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("folderList", folderList); 
		
		return "fileCloud/fileManager";
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/upload")
	public String uploadFile(@RequestPart MultipartFile file, String folderNo) throws Exception {
		// uuid 생성
		UUID uuid = UUID.randomUUID();		
		// vo생성
		CloudVO cloudVO = new CloudVO();
		
		// 업로드 경로에 폴더 있는지 확인하고 없으면 만듬
		File tempFile = new File(resourcePath);
		
		if (!tempFile.exists()) {
			tempFile.mkdirs();
		}
		
		// 폴더 번호 지정(test)
		cloudVO.setFolderNo(Integer.parseInt(folderNo));
		
		cloudVO.setCloudOriginName(file.getOriginalFilename());
		log.info("OriginalFilename : " + file.getOriginalFilename());
		
		cloudVO.setCloudSize((int)file.getSize());
		log.info("fileSize : " + file.getSize());
		
		// uuid로 저장할 이름 생성
		String savedName = uuid.toString() + "_" + cloudVO.getCloudOriginName();
		
		cloudVO.setCloudName(savedName);
		
		cloudVO.setCloudSavepath(resourcePath);
		log.info("savePath : " + resourcePath);
		
		// 확장자 빼옴
		String formatName = cloudVO.getCloudOriginName().substring(cloudVO.getCloudOriginName().lastIndexOf(".") + 1);
		
		cloudVO.setCloudMime(formatName);
		log.info("MIMEtype : " + formatName);
		
		// 작성자 지정(test)
		cloudVO.setCloudWriter(1);
		
		// 저장될 경로/파일명 지정
		String savePath = resourcePath + "/" + savedName;
		
		// 파일 copy
		File target = new File(savePath);
		FileCopyUtils.copy(file.getBytes(), target);
		// 파일 카피한 후, 저장된 파일의 팬시사이즈를 가져와서 vo에 저장
		long size = target.length();
		String fancySize = FileUtils.byteCountToDisplaySize(size);
		
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 펜시사이즈 : " + fancySize);
		cloudVO.setCloudFancysize(fancySize);
		
		// 섬네일/다운로드에 사용 될 파일 경로
		String imgPath = "/resources/upload/s_" + cloudVO.getCloudName();
		// 다운로드에 사용 될 파일 경로
		String downloadPath = "/resources/upload/" + cloudVO.getCloudName();
		cloudVO.setCloudDownloadpath(downloadPath);
		
		// 하나의 쿼리로 사용할 수 있도록 imgPath에는 미리 null을 담아줌
		cloudVO.setCloudImgpath("null");
		
		// 파일 확장자 검사해서 이미지일 때 섬네일 이미지를 같이 저장 함.
		String mimeType = cloudVO.getCloudMime().toLowerCase();
		
		if(mimeType.equals("png") || mimeType.equals("jpg")) {
			UploadFileUtils.makeThumnail(cloudVO.getCloudSavepath(), cloudVO.getCloudName());
			cloudVO.setCloudImgpath(imgPath);
		}
		
		log.info("cloudVO" + cloudVO);
		
		cloudService.insertFile(cloudVO);
		
		// 이동
		return "redirect:/cloud/fileManager";
	}

	@PreAuthorize("permitAll")
	@PostMapping("/fileModify")
	public String modifyFile(CloudVO cloudVO) {
		// 수정 성공/실패에 대한 처리 필요할까..?
		cloudService.modifyFile(cloudVO);
		return "redirect:/cloud/fileManager";
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/fileDelete")
	public String deleteFile(int cloudNo) {
		// 삭제 성공/실패에 대한 처리 필요할까..?
		cloudService.deleteFile(cloudNo);
		return "redirect:/cloud/fileManager";
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/folderModify")
	public String modifyFolder(FolderVO folderVO) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 수정할 폴더의 NO : " + folderVO);
		cloudService.modifyFolder(folderVO);
		
		return "redirect:/cloud/fileManager";
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/folderDelete")
	public String deleteFolder(int folderNo) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 삭제할 폴더의 번호 : " + folderNo);
		
		cloudService.deleteFolder(folderNo);
		return "redirect:/cloud/fileManager";
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/newFolder") 
	public String newFolder(FolderVO folderVO, HttpSession session) {
		
		int proNo = (int)session.getAttribute("proNo");
		
		// 일단 1번 프로젝트로 지정
		folderVO.setProNo(proNo);
		cloudService.createNewFolder(folderVO);
		return "redirect:/cloud/fileManager";
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/selectFolder")
	public ResponseEntity<List<CloudVO>> selectFolder(int folderNo) {
		List<CloudVO> cloudList =  cloudService.getFileFromFolderNo(folderNo);
		return new ResponseEntity<List<CloudVO>>(cloudList , HttpStatus.OK);
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/findParentFolder")
	public ResponseEntity<Integer> findParentFolder(int folderNo) {
		int parentFolderNo =  cloudService.findParentFolder(folderNo);
		return new ResponseEntity<Integer>(parentFolderNo , HttpStatus.OK);
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/childFolderList")
	public ResponseEntity<List<FolderVO>> childFolderList(int parentFolderNo) {
		List<FolderVO> childFolderList =  cloudService.childFolderList(parentFolderNo);
		return new ResponseEntity<List<FolderVO>>(childFolderList , HttpStatus.OK);
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/hasParent")
	public ResponseEntity<Integer> hasParent(int folderNo) {
		
		int count = cloudService.hasParent(folderNo);
		return new ResponseEntity<Integer>(count , HttpStatus.OK);
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/fileSearch")
	public ResponseEntity<List<CloudVO>> fileSearch(String fileName) {
		
		List<CloudVO> searchFileList = cloudService.selectSearchFile(fileName);
		
		return new ResponseEntity<List<CloudVO>>(searchFileList , HttpStatus.OK);
	}
	

}
