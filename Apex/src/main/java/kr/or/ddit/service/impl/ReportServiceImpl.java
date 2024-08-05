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
import kr.or.ddit.mapper.IReportMapper;
import kr.or.ddit.service.IReportService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReportCommentVO;
import kr.or.ddit.vo.ReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReportServiceImpl implements IReportService {

	// 의존성 주입
	@Inject
	private IReportMapper reportMapper;

	// 파일 업로드 경로
	@Resource(name = "uploadPath")
	private String resourcePath;

	// 일일업무보고 목록 조회(페이징)
	@Override
	public List<ReportVO> selectReportList(PaginationInfoVO<ReportVO> pagingVO) {
		return reportMapper.selectReportList(pagingVO);
	}

	// 페이징 처리를 위한 게시글 갯수
	@Override
	public int selectReportCount(PaginationInfoVO<ReportVO> pagingVO) {
		return reportMapper.selectReportCount(pagingVO);
	}

	// 게시글 상세
	@Override
	public ReportVO reportDetail(int reportNo) {
		reportMapper.incrementHit(reportNo);
		return reportMapper.reportDetail(reportNo);
	}

	// 게시글 등록(파일 등록)
	@Override
	public ServiceResult insertReport(HttpServletRequest req, ReportVO reportVO) throws Exception {
		ServiceResult result = null;
		int status = reportMapper.insertReport(reportVO);
		if (status > 0) { // 등록 성공
			// 일반 데이터가 등록 성공 시, 파일데이터를 write 준비한다.
			List<MultipartFile> reportFiles = reportVO.getReportFiles();

			if (reportFiles.get(0).getOriginalFilename().length() > 0) {

				List<FileDetailVO> fileDetailList = reportVO.getFileDetailList();

				FilesVO filesVO = new FilesVO();
				filesVO.setFileWhereNo(5);
				filesVO.setFileWherePk(reportVO.getReportNo());
				int filesStatus = reportMapper.insertFiles(filesVO);
				if (filesStatus > 0) {
					reportFileUpload(fileDetailList, req, reportVO.getReportNo(), reportMapper, filesVO.getFileNo());
				}
			} else {

			}

			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	private void reportFileUpload(List<FileDetailVO> fileDetailList, HttpServletRequest req, int reportNo,
			IReportMapper mapper, int fileNo) throws Exception {
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
	public ServiceResult updateReport(HttpServletRequest req, ReportVO reportVO) {
		ServiceResult result = null;
		int status = reportMapper.updateReport(reportVO);
		if (status > 0) {
			List<FileDetailVO> fileDetailList = reportVO.getFileDetailList();

			FilesVO filesVO = reportVO.getReportFile();
			try {

				List<MultipartFile> reportFiles = reportVO.getReportFiles();

				if (reportFiles.get(0).getOriginalFilename().length() > 0) {

					Integer[] delReportNo = reportVO.getDelReportNo();
					if (delReportNo != null) {
						for (int i = 0; i < delReportNo.length; i++) {
							FileDetailVO fileDetailVO = reportMapper.selectReportFile(delReportNo[i]);

							reportMapper.deleteReportFile(delReportNo[i]);
							reportMapper.deleteFiles(delReportNo[i]);
							File file = new File(fileDetailVO.getFileUrl());
							file.delete();// 파일 삭제
						}
					}

					fileDetailList = reportVO.getFileDetailList();

					filesVO = new FilesVO();
					filesVO.setFileWhereNo(5);
					filesVO.setFileWherePk(reportVO.getReportNo());
					int filesStatus = reportMapper.insertFiles(filesVO);
					if (filesStatus > 0) {
						reportFileUpload(fileDetailList, req, reportVO.getReportNo(), reportMapper,
								filesVO.getFileNo());
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
	public ServiceResult deleteReport(HttpServletRequest req, int reportNo) {
		ServiceResult result = null;

		ReportVO reportVO = reportMapper.reportDetail(reportNo);

		int status = reportMapper.deleteReport(reportNo);
		if (status > 0) {
			List<FileDetailVO> fileDetailList = reportVO.getFileDetailList();
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

		return reportMapper.selectEmpList();
	}

	// 게시글 내 댓글/답글 조회
	@Override
	public List<ReportCommentVO> selectComment(int reportNo) {

		return reportMapper.selectComment(reportNo);
	}

	// 게시글 내 댓글/답글 등록
	@Override
	public void addComment(ReportCommentVO commentVO) {
		reportMapper.addComment(commentVO);
	}

	// 게시글 내 댓글/답글 수정
	@Override
	public void modifyComment(ReportCommentVO commentVO) {
		reportMapper.modifyComment(commentVO);
	}

	// 게시글 내 댓글/답글 삭제
	@Override
	public void deleteComment(ReportCommentVO commentVO) {
		reportMapper.deleteComment(commentVO);
	}

}
