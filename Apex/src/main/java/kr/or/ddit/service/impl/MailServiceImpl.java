package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IMailMapper;
import kr.or.ddit.service.IMailService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.MailVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.ReceiveVO;

@Service
public class MailServiceImpl implements IMailService {

	@Inject
	private IMailMapper mapper;
	
	@Override
	public int selectEmailCount(PaginationInfoVO<MailVO> pagingVO) {
		return mapper.selectEmailCount(pagingVO);
	}

	@Override
	public int selectReceiveCount(PaginationInfoVO<ReceiveVO> pagingVO) {
		return mapper.selectReceiveCount(pagingVO);
	}

	@Override
	public List<ReceiveVO> receivelist(Map<String, Object> pagingMap) {
		return mapper.receivelist(pagingMap);
	}

	@Override
	public MailVO getMailFromMailNo(int mailNo) {
		return mapper.getMailFromMailNo(mailNo);
	}

	@Override
	public ReceiveVO getReceiveFormMailNo(int mailNo) {
		return mapper.getReceiveFormMailNo(mailNo);
	}

	@Override
	public void sendMail(MailVO mailVO) {
		mapper.sendMail(mailVO);
	}

	@Override
	public void insertNewFiles(FilesVO filesVO) {
		mapper.insertNewFiles(filesVO);
	}

	@Override
	public void insertMailFile(FileDetailVO fileDetailVO) {
		mapper.insertMailFile(fileDetailVO);
	}

	@Override
	public void insertReceive(ReceiveVO receiveVO) {
		mapper.insertReceive(receiveVO);
	}

	@Override
	public MailVO getSendMailFromEmpNo(int empNo) {
		return mapper.getSendMailFromEmpNo(empNo);
	}

	@Override
	public void updateMailReceiveRead(ReceiveVO receiveVO) {
		mapper.updateMailReceiveRead(receiveVO);
	}

	@Override
	public List<ReceiveVO> importantReceiveMail(ReceiveVO receiveVO) {
		return mapper.importantReceiveMail(receiveVO);
	}

	@Override
	public void readAllMail(int mailNo) {
		mapper.readAllMail(mailNo);
	}

	@Override
	public void checkImportantAllMail(int mailNo) {
		mapper.checkImportantAllMail(mailNo);
	}

	@Override
	public void trashAllMail(int mailNo) {
		mapper.trashAllMail(mailNo);
	}

	@Override
	public void clearImportantAllMail(int mailNo) {
		mapper.clearImportantAllMail(mailNo);
	}

	@Override
	public void deleteSendMail(int mailNo) {
		mapper.deleteSendMail(mailNo);
	}

	@Override
	public void allTrashClean(int empNo) {
		mapper.allTrashClean(empNo);
	}

	@Override
	public Integer selectFilesByMailNo(Map<String, Object> fileDetailMap) {
		return mapper.selectFilesByMailNo(fileDetailMap);
	}

	@Override
	public List<FileDetailVO> selectCurrentFileList(Integer currentFileNo) {
		return mapper.selectCurrentFileList(currentFileNo);
	}

	@Override
	public void saveTempMail(MailVO mailVO) {
		mapper.saveTempMail(mailVO);
	}

	@Override
	public void deleteSaveMail(int mailNo) {
		mapper.deleteSaveMail(mailNo);
	}

	@Override
	public int selectAsyncReceivePaging(PaginationInfoVO<ReceiveVO> pagingVO) {
		return mapper.selectAsyncReceivePaging(pagingVO);
	}

	@Override
	public List<ReceiveVO> filterReceiveMail(PaginationInfoVO<ReceiveVO> pagingVO) {
		return mapper.filterReceiveMail(pagingVO);
	}

	@Override
	public List<ReceiveVO> getMySendMail(PaginationInfoVO<ReceiveVO> pagingVO) {
		return mapper.getMySendMail(pagingVO);
	}

	@Override
	public List<MailVO> getSaveMailList(PaginationInfoVO<ReceiveVO> pagingVO) {
		return mapper.getSaveMailList(pagingVO);
	}

	@Override
	public int selectAsyncSendPaging(PaginationInfoVO<ReceiveVO> pagingVO) {
		return mapper.selectAsyncSendPaging(pagingVO);
	}

	@Override
	public List<EmployeeVO> selectAllMember() {
		return mapper.selectAllMember();
	}


}
