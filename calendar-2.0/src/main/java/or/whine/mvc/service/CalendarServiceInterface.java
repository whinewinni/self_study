package or.whine.mvc.service;

import or.whine.domain.CalendarTable;

import java.util.List;

/**
 * Created by Winni on 2016-09-18.
 */
public interface CalendarServiceInterface {

    void insertCalendarContent(CalendarTable calendarTable);
    List<CalendarTable> listCalendartitle(int year, int month);

} //end CalendarServiceInterface interface
