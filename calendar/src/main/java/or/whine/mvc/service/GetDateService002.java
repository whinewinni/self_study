package or.whine.mvc.service;

import or.whine.vo.CalendarVo;
import org.springframework.stereotype.Service;

import java.util.Calendar;

/**
 * Created by Winni on 2016-09-01.
 */
@Service
public class GetDateService002 {

    public CalendarVo getCalendar2(Calendar cal){

        int year=cal.get(Calendar.YEAR);
        int month=cal.get(Calendar.MONTH);

        cal.set(year, month, 1); //1일로 지정, 달은 0부터 시작으로 1을 빼줌

        CalendarVo calVo=new CalendarVo();
        calVo.setStartWeekDay(cal.get(cal.DAY_OF_WEEK)); //calVo에 요일을 넣어둠.

        int[] endOfMonth={31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if ((year % 4 == 0) && (year % 100 != 0) || year % 400 == 0) {
            endOfMonth[1] = 29;
        }

        calVo.setEndOfMonth(endOfMonth[month-1]); //구하는 달의 마지막 날을 vo에 set시킴

        calVo.setYear(year);
        calVo.setMonth(month+1);

        return calVo;  //vo를 넘겨줌
    } //end getCalendar method
}
