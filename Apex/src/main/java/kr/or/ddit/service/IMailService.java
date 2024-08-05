package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.MailVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReceiveVO;

public interface IMailService {

	// 발신 메일
	public int selectEmailCount(PaginationInfoVO<MailVO> pagingVO);

	// 수신 메일
	public int selectReceiveCount(PaginationInfoVO<ReceiveVO> pagingVO);
	public List<ReceiveVO> receivelist(Map<String, Object> pagingMap);
	
	// 메일함에 변경시 상태가 맞는 메일(ReceiveVO)만 가져오도록
	public MailVO getMailFromMailNo(int mailNo);
	public ReceiveVO getReceiveFormMailNo(int mailNo);
	public void sendMail(MailVO mailVO);
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
