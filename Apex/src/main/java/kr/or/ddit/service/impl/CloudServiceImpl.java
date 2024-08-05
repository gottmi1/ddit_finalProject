package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ICloudMapper;
import kr.or.ddit.service.ICloudService;
import kr.or.ddit.vo.CloudVO;
import kr.or.ddit.vo.FolderVO;

@Service
public class CloudServiceImpl implements ICloudService {

	@Inject
	private ICloudMapper mapper;

	@Override
	public void insertFile(CloudVO cloudVO) {
		mapper.insertFile(cloudVO);
	}

	@Override
	public List<CloudVO> selectAllList() {
		return mapper.selectAllList();
	}

	@Override
	public List<FolderVO> selectAllFolder(int proNo) {
		return mapper.selectAllFolder(proNo);
	}

	@Override
	public void modifyFile(CloudVO cloudVO) {
		mapper.modifyFile(cloudVO);
	}

	@Override
	public void deleteFile(int cloudNo) {
		mapper.deleteFile(cloudNo);
	}

	@Override
	public List<CloudVO> getFileFromFolderNo(int folderNo) {
		return mapper.getFileFromFolderNo(folderNo);
	}

	@Override
	public int findParentFolder(int folderNo) {
		return mapper.findParentFolder(folderNo);
	}

	@Override
	public void createNewFolder(FolderVO folderVO) {
		mapper.createNewFolder(folderVO);
		
	}

	@Override
	public List<FolderVO> childFolderList(int parentFolderNo) {
		return mapper.childFolderList(parentFolderNo);
	}

	@Override
	public void modifyFolder(FolderVO folderVO) {
		mapper.modifyFolder(folderVO);
	}

	@Override
	public void deleteFolder(int folderNo) {
		mapper.deleteAllFileFromFolder(folderNo);
		mapper.deleteFolder(folderNo);
	}

	@Override
	public int hasParent(int folderNo) {
		return mapper.hasParent(folderNo);
	}

	@Override
	public List<CloudVO> selectSearchFile(String searchString) {
		return mapper.selectSearchFile(searchString);
	}

}
