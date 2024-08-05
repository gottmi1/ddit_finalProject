package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.WorksVO;

public interface IKanbanMapper {

	List<WorksVO> workListOfKanban(int proNo);

	int updateStatusOfKanban(WorksVO worksVO);
	
	

}
