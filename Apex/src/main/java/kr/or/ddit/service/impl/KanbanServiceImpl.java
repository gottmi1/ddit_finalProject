package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IKanbanMapper;
import kr.or.ddit.service.IKanbanService;
import kr.or.ddit.vo.WorksVO;

@Service
public class KanbanServiceImpl implements IKanbanService {

	@Inject
	private IKanbanMapper mapper;
	
	@Override
	public List<WorksVO> workListOfKanban(int proNo) {
		return mapper.workListOfKanban(proNo);
	}

	@Override
	public ServiceResult updateStatusOfKanban(WorksVO worksVO) {
		
		ServiceResult result = null;
		int status = mapper.updateStatusOfKanban(worksVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		
		
		return result;
	}

}
