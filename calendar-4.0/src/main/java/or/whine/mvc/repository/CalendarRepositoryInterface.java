package or.whine.mvc.repository;

import or.whine.domain.CalendarTable;

import java.util.List;

/**
 * Created by Winni on 2016-10-23.
 */
public interface CalendarRepositoryInterface {

    CalendarTable getCalendarListOne(int calendarnum);
    List<CalendarTable> getCalendarListAll(int year, int month);
    int saveContent(CalendarTable calendarTable);
    void updateContent(CalendarTable calendarTable);
    void deleteContent(CalendarTable calendarTable) throws Exception;

} //end CalendarRepositoryInterface
