package or.whine.mvc.service;

import or.whine.domain.CalendarTable;

import java.util.List;

/**
 * Created by Winni on 2016-09-18.
 */
public interface CalendarServiceInterface {

    void insertCalendarContent(CalendarTable calendarTable);
    List<CalendarTable> listCalendartitle(int year, int month);
    void updateContents(CalendarTable calendarTable);
    void  deleteContent(int calendarnum);

} //end CalendarServiceInterface interface
