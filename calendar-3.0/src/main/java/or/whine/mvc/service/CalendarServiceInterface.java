package or.whine.mvc.service;

import or.whine.bean.CalendarBean;
import or.whine.domain.CalendarTable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by User on 2016-10-03.
 */
public interface CalendarServiceInterface {
    /*-------------------------------------Testing CODE----------------------------------------*/
    CalendarBean getCalendar(int year, int month);
    CalendarTable getCalendarListONE(int calendarnum);
    /*-----------------------------------------------------------------------------------------*/

    List<CalendarTable> getCalendarListALL(int year, int month);
    int saveContent(CalendarTable calendarTable);
    void updateCotent(CalendarTable calendarTable);
    boolean deleteContent(int calendarnum) throws Exception;
}
