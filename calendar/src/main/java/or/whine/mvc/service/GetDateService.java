package or.whine.mvc.service;

import or.whine.vo.CalendarVo;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Winni on 2016-08-28.
 */
@Service
public class GetDateService {



    public CalendarVo getCalendar(int year, int month){

        //use getInstance method to get year and time
        //because calendar is abstract class it doesn't have constructor
        Calendar calendar=Calendar.getInstance();
        //Calendar는 추상클래스라서 생성자를 제공하지 않아 getInstance method로
        // 현재 날짜와, 시간을 가지고 올수 있음

        calendar.set(year, month-1, 1); //1일로 지정, 달은 0부터 시작으로 1을 빼줌

        /*calendar.set(calendar.YEAR, year);
        calendar.set(calendar.MONTH, month-1);
        calendar.set(calendar.DATE, 1);*/

        //calendar.DAY_OF_WEEK   //일요일은 1, 토요일은 7
        CalendarVo calVo=new CalendarVo();
        //calendar.get(calendar.DAY_OF_WEEK); //요일을 가져옴
        calVo.setStartWeekDay(calendar.get(calendar.DAY_OF_WEEK)); //calVo에 요일을 넣어둠.

        int[] endOfMonth={31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        //규칙이 없는 달의 마지막 날을 배열로 넣어둠
        if ((year % 4 == 0) && (year % 100 != 0) || year % 400 == 0) {
            endOfMonth[1] = 29;
        } //윤년일 경우 2월의 마지막 날을 29로 지정

        calVo.setEndOfMonth(endOfMonth[month-1]); //구하는 달의 마지막 날을 vo에 set시킴

        calVo.setYear(year);
        calVo.setMonth(month);
        //넘어온 year와 month를 vo에 set함.

        return calVo;  //vo를 넘겨줌
    } //end getCalendar method

} //end getDateService class
