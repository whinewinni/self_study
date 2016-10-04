package or.whine.mvc.service;

import or.whine.domain.CalendarTable;

import java.util.List;

/**
 * Created by User on 2016-10-03.
 */
public interface CalendarServiceInterface {
    /*-------------------------------------Testing CODE----------------------------------------*/
    /*void saveTest(CalendarTable calendarTable);*/
    CalendarTable getCalendarListONE();
    /*-----------------------------------------------------------------------------------------*/

    List<CalendarTable> getCalendarListALL(int year, int month);
    int saveContent(CalendarTable calendarTable);
    void updateCotent(CalendarTable calendarTable);
    void deleteContent(int calendarnum);
}
