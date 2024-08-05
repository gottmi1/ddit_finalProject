package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.CalendarVO;

public interface ICommonCalendarMapper {

	public List<CalendarVO> getAllEvents(int empNo);

	public int insertEvent(CalendarVO calendarVO);

	public int updateEvent(CalendarVO calendarVO);

	public int deleteEvent(int id);

	public CalendarVO eventDetail(int id);

	public int updateEventDetail(CalendarVO vo);
}
