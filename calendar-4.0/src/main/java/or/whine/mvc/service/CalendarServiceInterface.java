package or.whine.mvc.service;

import or.whine.bean.CalendarBean;
import or.whine.domain.CalendarTable;

import java.util.List;

/**
 * Created by Winni on 2016-10-23.
 */
public interface CalendarServiceInterface {

    CalendarBean getCalendar(int year, int month);
    List<CalendarTable> getCalendarListAll(int year, int month);
    int saveContent(CalendarTable calendarTable);
    void updateContent(CalendarTable calendarTable);
    boolean deleteContent(int calendarnum) throws Exception;
    List<CalendarTable> getListModalCalendarDomainList(CalendarTable calendarTable);

} //end CalendarServiceInterface
