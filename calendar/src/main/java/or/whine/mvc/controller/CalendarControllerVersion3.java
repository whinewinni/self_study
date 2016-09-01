package or.whine.mvc.controller;

import or.whine.mvc.service.GetDateService;
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
public class CalendarControllerVersion3 {

    @Autowired
    private GetDateService getDateService;

    private Calendar calendar;

    @RequestMapping(value = "currentCal")
    public String getCurrentCalendar(Model model){
        calendar=Calendar.getInstance();

        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        int date=calendar.get(Calendar.DATE);
        model.addAttribute("todayStyle", date);

        CalendarVo calendarVo=getDateService.getCalendar(year, (month+1));

        model.addAttribute("calVo", calendarVo);

        return "calendar003";
    }


    @RequestMapping(value = "otherMonth")
    public String getOtherMonth(Model model, int identifier){

        calendar.add(Calendar.MONTH, identifier);

        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        /*int date=calendar.get(Calendar.DATE);
        model.addAttribute("todayStyle", date);*/

        CalendarVo calendarVo=getDateService.getCalendar(year, (month+1));

        model.addAttribute("calVo", calendarVo);

        return "calendar003";
    }
}
