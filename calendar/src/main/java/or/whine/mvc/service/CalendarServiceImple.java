package or.whine.mvc.service;

import or.whine.mvc.repository.CalendarRepository;
import or.whine.vo.CalendarContentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Winni on 2016-09-05.
 */
@Service
public class CalendarServiceImple implements CalendarService{

    @Autowired
    private CalendarRepository calendarRepository;

    public void insertCalendarContent(CalendarContentVO calendarContentVO) {
        calendarRepository.insertCalendatContent(calendarContentVO);
    }
}
