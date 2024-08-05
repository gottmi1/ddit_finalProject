package kr.or.ddit.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IWorksMapper;
import kr.or.ddit.service.IWorksService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.ManagerVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.WorkCommentVO;
import kr.or.ddit.vo.WorksVO;

@Service
public class WorksServiceImpl implements IWorksService {

	@Inject
	private IWorksMapper mapper;
	
	@Override
	public int selectWorksCount(PaginationInfoVO<WorksVO> pagingVO) {
		return mapper.selectWorksCount(pagingVO);
	}

	@Override
	public List<WorksVO> list(PaginationInfoVO<WorksVO> pagingVO) {
		return mapper.list(pagingVO);
	}

	@Override
	public WorksVO selectWorksDetail(int workNo) {
		return mapper.selectWorksDetail(workNo);
	}

	@Override
	public List<WorksVO> selectChildWorksList(int workNo) {
		return mapper.selectChildWorksList(workNo);
	}

	@Override
	public List<ManagerVO> selectManagerList(int workNo) {
		return mapper.selectManagerList(workNo);
	}

	@Override
	public List<EmployeeVO> selectManagerNameList(List<ManagerVO> managerList) {
		return mapper.selectManagerNameList(managerList);
	}

	@Override
	public List<ManagerVO> selectChildManagerList(List<WorksVO> childWorksList) {
		return mapper.selectChildManagerList(childWorksList);
	}

	@Override
	public List<ManagerVO> selectAllManagerList() {
		return mapper.selectAllManagerList();
	}

	@Override
	public List<EmployeeVO> selectEmpList() {
		return mapper.selectEmpList();
	}

	@Override
	public void insertWork(WorksVO worksVO) {
		mapper.insertWork(worksVO);
	}

	@Override
	public void insertManager(Map<String, Object> managerMap) {
		mapper.insertManager(managerMap);
	}

	@Override
	public void insertNewFiles(FilesVO filesVO) {
		mapper.insertNewFiles(filesVO);
	}

	@Override
	public void insertWorkFile(FileDetailVO fileDetailVO) {
		mapper.insertWorkFile(fileDetailVO);
	}

	@Override
	public int selectCurrentFileNo(Map<String, Object> fileDetailMap) {
		return mapper.selectCurrentFileNo(fileDetailMap);
	}

	@Override
	public List<FileDetailVO> selectCurrentFileList(int currentFileNo) {
		return mapper.selectCurrentFileList(currentFileNo);
	}

	@Override
	public void addComment(WorkCommentVO commentVO) {
		mapper.addComment(commentVO);
	}

	@Override
	public List<WorkCommentVO> selectComment(int workNo) {
		return mapper.selectComment(workNo);
	}

	@Override
	public FilesVO selectFiles(HashMap<String, Object> filesFindMap) {
		return mapper.selectFiles(filesFindMap);
	}

	@Override
	public void deleteFile(int fileNo) {
		mapper.deleteFile(fileNo);
	}

	@Override
	public void deleteFiles(int fileNo) {
		mapper.deleteFiles(fileNo);
	}

	@Override
	public void modifyWork(WorksVO worksVO) {
		mapper.modifyWork(worksVO);
	}

	@Override
	public void deleteManager(int workNo) {
		mapper.deleteManager(workNo);
	}

	@Override
	public void deleteWork(int workNo) {
		mapper.deleteWork(workNo);
	}

	@Override
	public void modifyComment(WorkCommentVO commentVO) {
		mapper.modifyComment(commentVO);
	}

	@Override
	public void deleteComment(WorkCommentVO commentVO) {
		mapper.deleteComment(commentVO);
	}

	@Override
	public void realDeleteComment(int workNo) {
		mapper.realDeleteComment(workNo);
	}

	@Override
	public List<EmployeeVO> selectProjectMember(int proNo) {
		return mapper.selectProjectMember(proNo);
	}

}
