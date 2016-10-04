package or.whine.mvc.repository;

import or.whine.domain.CalendarTable;

import java.util.List;

/**
 * Created by Winni on 2016-10-04.
 */
public interface CalendarRepositoryInterface {
    CalendarTable getCalendarListONE(int calendarnum);
    List<CalendarTable> getcalendarListAll(int year, int month);
    int saveContent(CalendarTable calendarTable);
    void updateContent(CalendarTable calendarTable);
    void deletecontent(CalendarTable calendarTable);
}
