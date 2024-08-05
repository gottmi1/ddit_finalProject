package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.WorksVO;

public interface IKanbanService {

	List<WorksVO> workListOfKanban(int proNo);

	ServiceResult updateStatusOfKanban(WorksVO worksVO);

}
