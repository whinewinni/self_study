package or.whine.mvc.controller;

import or.whine.bean.CalendarBean;
import or.whine.mvc.service.CalendarServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Calendar;

/**
 * Created by Winni on 2016-10-23.
 */

@Controller
public class CalendarController {

    /*@RequestMapping("test")
    public String test(){
        return "calendarView";
    }*/

    @Autowired
    private CalendarServiceInterface calendarService;

    //Calendar variable declaration
    private Calendar calendar;

    @RequestMapping(value = "/")
    public String getCurrentCalendar(Model model){

        //declare calendar
        calendar=Calendar.getInstance();

        //get year and month from calendar variable
        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        //give year and month to getDateService
        //after then, get calendarVo
        CalendarBean calendarBean=calendarService.getCalendar(year, month);

        //Add the supplied name
        model.addAttribute("calBean", calendarBean);

        //return view name
        return "calendarView";
    }

    @RequestMapping(value = "otherMonth")
    public String getOtherMonthCalendar(Model model, int identifier){

        /*the identifier variable of previous month is "-1", next month is "1"
        add method can adds or subtracts the specified amount of time.*/
        calendar.add(Calendar.MONTH, identifier);

        //get year and month from calendar variable
        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        //give year and month to getDateService after then, get calendarBean
        CalendarBean calendarBean=calendarService.getCalendar(year, month);

        //Add the supplied name
        model.addAttribute("calBean", calendarBean);

        return "calendarView";
    }


}

