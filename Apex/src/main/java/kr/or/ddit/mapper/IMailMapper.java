package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.MailVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReceiveVO;

public interface IMailMapper {

	public int selectEmailCount(PaginationInfoVO<MailVO> pagingVO);

	public int selectReceiveCount(PaginationInfoVO<ReceiveVO> pagingVO);

	public List<ReceiveVO> receivelist(Map<String, Object> pagingMap);

	public MailVO getMailFromMailNo(int mailNo);

	public ReceiveVO getReceiveFormMailNo(int mailNo);
	
	public void sendMail(MailVO mailVO);
	
	public void insertFile(FilesVO filesVO);
	
	public void insertNewFiles(FilesVO filesVO);

	public void insertMailFile(FileDetailVO fileDetailVO);

	public void insertReceive(ReceiveVO receiveVO);

	public MailVO getSendMailFromEmpNo(int empNo);

	public void updateMailReceiveRead(ReceiveVO receiveVO);

	public List<ReceiveVO> importantReceiveMail(ReceiveVO receiveVO);

	public void readAllMail(int mailNo);

	public void checkImportantAllMail(int mailNo);

	public void trashAllMail(int mailNo);

	public void clearImportantAllMail(int mailNo);

	public void deleteSendMail(int mailNo);

	public void allTrashClean(int empNo);
	
	public Integer selectFilesByMailNo(Map<String, Object> fileDetailMap);
	public List<FileDetailVO> selectCurrentFileList(Integer currentFileNo);

	public void saveTempMail(MailVO mailVO);

	public void deleteSaveMail(int mailNo);

	public int selectAsyncReceivePaging(PaginationInfoVO<ReceiveVO> pagingVO);

	public List<ReceiveVO> filterReceiveMail(PaginationInfoVO<ReceiveVO> pagingVO);

	public List<ReceiveVO> getMySendMail(PaginationInfoVO<ReceiveVO> pagingVO);

	public List<MailVO> getSaveMailList(PaginationInfoVO<ReceiveVO> pagingVO);

	public int selectAsyncSendPaging(PaginationInfoVO<ReceiveVO> pagingVO);

	public List<EmployeeVO> selectAllMember();
}
