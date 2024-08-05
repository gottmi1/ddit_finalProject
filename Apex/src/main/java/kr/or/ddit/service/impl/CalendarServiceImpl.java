package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ICalendarMapper;
import kr.or.ddit.service.ICalendarService;
import kr.or.ddit.vo.CalendarVO;

@Service
public class CalendarServiceImpl implements ICalendarService {

	@Inject
	private ICalendarMapper calendarMapper;

	@Override
	public List<CalendarVO> getAllEvents(int empNo) {
		return calendarMapper.getAllEvents(empNo);
	}

	@Override
	public int insertEvent(CalendarVO calendarVO) {
		
		return calendarMapper.insertEvent(calendarVO);
	}

	@Override
	public int updateEvent(CalendarVO calendarVO) {
		return calendarMapper.updateEvent(calendarVO);
	}

	@Override
	public int deleteEvent(int id) {
		return calendarMapper.deleteEvent(id);
	}

	@Override
	public CalendarVO eventDetail(int id) {
		return calendarMapper.eventDetail(id);
	}

	@Override
	public int updateEventDetail(CalendarVO vo) {
		return calendarMapper.updateEventDetail(vo);
	}
	

}
