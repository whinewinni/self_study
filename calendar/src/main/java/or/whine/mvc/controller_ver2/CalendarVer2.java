package or.whine.mvc.controller_ver2;

import or.whine.mvc.service.GetDateService;
import or.whine.mvc.service.GetDateService002;
import or.whine.vo.CalendarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Calendar;

/**
 * Created by Winni on 2016-09-01.
 */
@Controller
public class CalendarVer2{

    /*년과 달로 인자값을 넘기지 않고 calendar로 인자값을 넘기면
    이번해에는 값이 문제 없지만 다른 년도로 넘어 갔을때 문제가 있다.
    calendar객체를 넘기면 다른 문제가 ....나온다....
    해결해야한다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/

    @Autowired
    private GetDateService002 getDateService;

    private Calendar calendar;

    @RequestMapping(value = "getCal_ver2")
    public String getCalendar_ver2(Model model){
        calendar =Calendar.getInstance();

        int date=calendar.get(Calendar.DATE);
        model.addAttribute("todayStyle", date);

        CalendarVo calendarVo=getDateService.getCalendar2(calendar);

        model.addAttribute("calVo", calendarVo);

        return "calendar003";
    }

    @RequestMapping(value = "otherMonth2")
    public String getOtherMonth(Model model, int identifier){
        calendar.add(Calendar.MONTH, identifier);

        CalendarVo calendarVo=getDateService.getCalendar2(calendar);

        model.addAttribute("calVo", calendarVo);

        return "calendar003";
    }


}
