package or.whine.mvc.service;

import or.whine.bean.CalendarBean;
import or.whine.domain.CalendarTable;
import or.whine.mvc.repository.CalendarRepositoryInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Winni on 2016-10-23.
 */
@Service
public class CalendarServiceImple implements CalendarServiceInterface{

    @Autowired
    private CalendarRepositoryInterface calendarRepository;

    public int saveContent(CalendarTable calendarTable) {
        calendarTable.setScheduleTime(new Date());
        return calendarRepository.saveContent(calendarTable);
    }

    public void updateContent(CalendarTable calendarTable) {

    }

    public List<CalendarTable> getListModalCalendarDomainList(CalendarTable calendarTable) {
        return calendarRepository.getListModalCalendarDomainList(calendarTable);
    }

    public CalendarTable getCalendarListONE(int calendarnum){
        return calendarRepository.getCalendarListOne(calendarnum);
    }

    @Transactional
    public boolean deleteContent(int calendarnum) throws Exception {
        //get calendarDomain through calendarnum(it is from getCalendarListOne)
        CalendarTable calendarDomain=calendarRepository.getCalendarListOne(calendarnum);
        //calendarDomain이 null값일경우 true를 리턴하고
        //null이 아닐 경우에만 deleteContent에 calendarDomain을 넘겨준다.
        if (calendarDomain==null){
            return false;
        }else {
            calendarRepository.deleteContent(calendarDomain);
            return true;
        }
   }

    public List<CalendarTable> getCalendarListAll(int year, int month) {
        return calendarRepository.getCalendarListAll(year, month);
    }

    public CalendarBean getCalendar(int year, int month) {

        //use getInstance method to get year and time
        //because calendar is abstract class it doesn't have constructor
        Calendar calendar=Calendar.getInstance();
        //Calendar는 추상클래스라서 생성자를 제공하지 않아 getInstance method로
        // 현재 날짜와, 시간을 가지고 올수 있음

        //value Object
        CalendarBean calendarBean=new CalendarBean();

        //get Year and Month from calendar class
        int currentYear=calendar.get(Calendar.YEAR);
        int currentMonth=calendar.get(Calendar.MONTH);

        //focusDay value is for focusing today styling
        int forFocusDay;

        //if year and month are same with currentYear and currentMonth
        //focusDay get current day or else get "1"
        if (year==currentYear && month==currentMonth){
            forFocusDay=calendar.get(Calendar.DATE);
        }else {
            forFocusDay=1;
        }
        calendarBean.setDay(forFocusDay);

        //calendar.DAY_OF_WEEK   //일요일은 1, 토요일은 7
        //calendar.get(calendar.DAY_OF_WEEK); //요일을 가져와서 CalendarBean에 요일을 넣어둠.
        calendarBean.setStartWeekDay(calendar.get(calendar.DAY_OF_WEEK));

        //규칙이 없는 달의 마지막 날을 배열로 넣어둠
        int[] endOfMonth={31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if ((year % 4 == 0) && (year % 100 != 0) || year % 400 == 0) {
            //윤년일 경우 2월의 마지막 날을 29로 지정
            endOfMonth[1] = 29;
        }

        //구하는 달의 마지막 날을 vo에 set시킴
        calendarBean.setEndOfMonthDay(endOfMonth[month]);

        //넘어온 year와 month를 vo에 set함.
        calendarBean.setYear(year);
        calendarBean.setMonth(month);

        return calendarBean;
    }
}
