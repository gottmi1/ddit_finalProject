package kr.or.ddit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.ManagerVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.WorkCommentVO;
import kr.or.ddit.vo.WorksVO;

public interface IWorksService {

	public int selectWorksCount(PaginationInfoVO<WorksVO> pagingVO);

	public List<WorksVO> list(PaginationInfoVO<WorksVO> pagingVO);

	public WorksVO selectWorksDetail(int workNo);

	public List<WorksVO> selectChildWorksList(int workNo);

	public List<ManagerVO> selectManagerList(int workNo);

	public List<EmployeeVO> selectManagerNameList(List<ManagerVO> managerList);

	public List<ManagerVO> selectChildManagerList(List<WorksVO> childWorksList);

	public List<ManagerVO> selectAllManagerList();

	public List<EmployeeVO> selectEmpList();

	public void insertWork(WorksVO worksVO);

	public void insertManager(Map<String, Object> managerMap);

	public void insertNewFiles(FilesVO filesVO);

	public void insertWorkFile(FileDetailVO fileDetailVO);

	public int selectCurrentFileNo(Map<String, Object> fileDetailMap);

	public List<FileDetailVO> selectCurrentFileList(int currentFileNo);

	public void addComment(WorkCommentVO commentVO);

	public List<WorkCommentVO> selectComment(int workNo);

	public FilesVO selectFiles(HashMap<String, Object> filesFindMap);

	public void deleteFile(int fileNo);

	public void deleteFiles(int workNo);

	public void modifyWork(WorksVO worksVO);

	public void deleteManager(int workNo);

	public void deleteWork(int workNo);

	public void modifyComment(WorkCommentVO commentVO);

	public void deleteComment(WorkCommentVO commentVO);

	public void realDeleteComment(int workNo);

	public List<EmployeeVO> selectProjectMember(int proNo);

}
