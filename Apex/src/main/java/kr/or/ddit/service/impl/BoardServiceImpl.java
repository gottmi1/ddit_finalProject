package kr.or.ddit.service.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IBoardMapper;
import kr.or.ddit.service.IBoardService;
import kr.or.ddit.vo.BoardCommentVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements IBoardService {

	// 의존성 주입
	@Inject
	private IBoardMapper boardMapper;

	// 파일 업로드 경로
	@Resource(name = "uploadPath")
	private String resourcePath;

	// 자유게시판 목록 조회(페이징)
	@Override
	public List<BoardVO> selectBoardlist(PaginationInfoVO<BoardVO> pagingVO) {
		log.info("mapper.list() 실행");
		return boardMapper.selectBoardlist(pagingVO);
	}

	// 페이징 처리를 위한 게시글 갯수
	@Override
	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO) {
		return boardMapper.selectBoardCount(pagingVO);
	}

	// 게시글 상세
	@Override
	public BoardVO boardDetail(int boNo) {
		boardMapper.incrementHit(boNo);
		return boardMapper.boardDetail(boNo);
	}

	// 게시글 등록(파일 등록)
	@Override
	public ServiceResult insertBoard(HttpServletRequest req, BoardVO boardVO) throws Exception {
		ServiceResult result = null;
		int status = boardMapper.insertBoard(boardVO);
		if (status > 0) { // 등록 성공
			List<MultipartFile> boFiles = boardVO.getBoFiles();
			
			//파일들의 첫번째 파일을 가져와서 그 파일의 명의 길이를 구하여 
			//0보다 크면 파일이 있는 것이고, 1보다 작으면 파일이 없는 것임
			if(boFiles.get(0).getOriginalFilename().length()>0) {//파일 있음
			
				// 일반 데이터가 등록 성공 시, 파일데이터를 write 준비한다.
				List<FileDetailVO> fileDetailList = boardVO.getFileDetailList();
	
				FilesVO filesVO = new FilesVO();
				filesVO.setFileWhereNo(3);
				filesVO.setFileWherePk(boardVO.getBoNo());
				int filesStatus = boardMapper.insertFiles(filesVO);
				if (filesStatus > 0) {
					boardFileUpload(fileDetailList, req, boardVO.getBoNo(), boardMapper, filesVO.getFileNo());
				}
			}else { //파일없음
				
			}

			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	private void boardFileUpload(List<FileDetailVO> fileDetailList, HttpServletRequest req, int boNo,
			IBoardMapper mapper, int fileNo) throws Exception {

		// 업로드 경로에 폴더 있는지 확인하고 없으면 만듬
		File tempFile = new File(resourcePath);

		if (!tempFile.exists()) {
			tempFile.mkdirs();
		}

		for (int i = 0; i < fileDetailList.size(); i++) {
			FileDetailVO fileDetailVO = fileDetailList.get(i);
			String fileName = UUID.randomUUID().toString();
			fileName += "_" + fileDetailVO.getFileOriginName(); // UUID_원본파일명

			String realSavePath = resourcePath + "/" + fileName;
			File file = new File(realSavePath);
			fileDetailVO.getItem().transferTo(file); // 해당 경로에 파일을 복사한다.

			fileDetailVO.setFileNo(fileNo);
			fileDetailVO.setFileSaveName(fileName);
			fileDetailVO.setFileSize(fileDetailList.get(i).getFileSize());
			log.info("파일 사이즈!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!" + fileDetailVO.getFileSize());
			fileDetailVO.setFileUrl(realSavePath);

			String fileFancysize = FileUtils.byteCountToDisplaySize(fileDetailVO.getFileSize());
			fileDetailVO.setFileFancysize(fileFancysize);

			mapper.insertFileDetail(fileDetailVO);
		}

	}

	// 게시글 수정
	@Override
	public ServiceResult updateBoard(HttpServletRequest req, BoardVO boardVO) {
		ServiceResult result = null;
		//1. board 테이블 업데이트 처리
		int status = boardMapper.updateBoard(boardVO);
		if (status > 0) {
			List<FileDetailVO> fileDetailList = boardVO.getFileDetailList();

			FilesVO filesVO = boardVO.getBoFile();
			try {
				//2.1 파일이 있으면 처리 없으면 그대로 놔둠
				List<MultipartFile> boFiles = boardVO.getBoFiles();
				
				log.info("boFiles.get(0).getOriginalFilename().length() : " + boFiles.get(0).getOriginalFilename().length());
				
				if(boFiles.get(0).getOriginalFilename().length()>0){//파일이 있을때만 수행
	//				boardFileUpload(fileDetailList, boardVO.getBoNo(), mapper);
	
					//1) 파일 테이블들의 기존 파일들을 삭제하고
					Integer[] delBoardNo = boardVO.getDelBoardNo();
					log.info("updateBoard->delBoardNo : " + delBoardNo);
					if (delBoardNo != null) {
						for (int i = 0; i < delBoardNo.length; i++) {
							FileDetailVO fileDetailVO = boardMapper.selectBoardFile(delBoardNo[i]);
	
							boardMapper.deleteBoardFile(delBoardNo[i]);
							boardMapper.deleteFiles(delBoardNo[i]);
							File file = new File(fileDetailVO.getFileUrl());
							file.delete();// 파일 삭제
						}
					}
					
					//2) 파일 테이블들에 새로운 파일 데이터를 넣음
					// 일반 데이터가 등록 성공 시, 파일데이터를 write 준비한다.
					fileDetailList = boardVO.getFileDetailList();
		
					filesVO = new FilesVO();
					filesVO.setFileWhereNo(3);
					filesVO.setFileWherePk(boardVO.getBoNo());
					int filesStatus = boardMapper.insertFiles(filesVO);
					if (filesStatus > 0) {
						boardFileUpload(fileDetailList, req, boardVO.getBoNo(), boardMapper, filesVO.getFileNo());
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 게시글 삭제
	@Override
	public ServiceResult deleteBoard(HttpServletRequest req, int boNo) {
		ServiceResult result = null;

		BoardVO boardVO = boardMapper.boardDetail(boNo);

		int status = boardMapper.deleteBoard(boNo);
		if (status > 0) {
			List<FileDetailVO> fileDetailList = boardVO.getFileDetailList();
			try {
				if (fileDetailList != null) {
					String[] filePath = fileDetailList.get(0).getFileUrl().split("/");
					String path = filePath[0];
					deleteFolder(req, path);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	private void deleteFolder(HttpServletRequest req, String path) {
		// UUID_원본파일명 전 폴더경로를 folder 파일객체로 잡는다.
		File folder = new File(path);
		try {
			if (folder.exists()) { // 경로가 존재한다면
				// 폴더 안에 있는 파일들의 목록을 가져온다.
				File[] fileList = folder.listFiles();

				for (int i = 0; i < fileList.length; i++) {
					if (fileList[i].isFile()) { // 파일이라면~
						fileList[i].delete(); // 파일 삭제
					} else {
						deleteFolder(req, fileList[i].getPath());
					}
				}
				folder.delete(); // 폴더 삭제
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 사원 이름 가져오기
	@Override
	public List<EmployeeVO> selectEmpList() {
		return boardMapper.selectEmpList();
	}

	// 게시글 내 댓글/답글 조회
	@Override
	public List<BoardCommentVO> selectComment(int boNo) {
		return boardMapper.selectComment(boNo);
	}

	// 게시글 내 댓글/답글 등록
	@Override
	public void addComment(BoardCommentVO commentVO) {
		boardMapper.addComment(commentVO);
	}

	// 게시글 내 댓글/답글 수정
	@Override
	public void modifyComment(BoardCommentVO commentVO) {
		boardMapper.modifyComment(commentVO);
	}

	// 게시글 내 댓글/답글 삭제
	@Override
	public void deleteComment(BoardCommentVO commentVO) {
		boardMapper.deleteComment(commentVO);
	}

}
