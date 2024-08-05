package kr.or.ddit.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.vo.CalendarVO;


@Service
public interface ICalendarService {
	public List<CalendarVO> getAllEvents(int empNo);

	public int insertEvent(CalendarVO calendarVO);

	public int updateEvent(CalendarVO calendarVO);

	public int deleteEvent(int id);

	public CalendarVO eventDetail(int id);

	public int updateEventDetail(CalendarVO vo);
}
