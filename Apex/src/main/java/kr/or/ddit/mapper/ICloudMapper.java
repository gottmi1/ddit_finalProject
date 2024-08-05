package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.CloudVO;
import kr.or.ddit.vo.FolderVO;

public interface ICloudMapper {
	
	public void insertFile(CloudVO cloudVO);

	public List<CloudVO> selectAllList();

	public List<FolderVO> selectAllFolder(int proNo);

	public void modifyFile(CloudVO cloudVO);

	public void deleteFile(int cloudNo);

	public List<CloudVO> getFileFromFolderNo(int folderNo);

	public int findParentFolder(int folderNo);

	public void createNewFolder(FolderVO folderVO);

	public List<FolderVO> childFolderList(int parentFolderNo);

	public void modifyFolder(FolderVO folderVO);

	public void deleteFolder(int folderNo);

	public void deleteAllFileFromFolder(int folderNo);

	public int hasParent(int folderNo);

	public List<CloudVO> selectSearchFile(String searchString);
}
