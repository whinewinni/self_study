package or.whine.mvc.controller;

import or.whine.mvc.service.GetDateService;
import or.whine.vo.CalendarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Calendar;

/**
 * Created by Winni on 2016-09-01.
 */
@Controller
public class CalendarControllerVersion3 {

    @Autowired
    private GetDateService getDateService;

    //Calendar variable declaration
    private Calendar calendar;

    @RequestMapping(value = "currentCal")
    public String getCurrentCalendar(Model model){
        //declare calendar
        calendar=Calendar.getInstance();

        //get year and month from calendar variable
        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        //get today date, for focusing today style
        int date=calendar.get(Calendar.DATE);
        model.addAttribute("todayStyle", date);

        //give year and month to getDateService
        //after then, get calendarVo
        CalendarVo calendarVo=getDateService.getCalendar(year, (month+1));

        //Add the supplied name
        model.addAttribute("calVo", calendarVo);

        //return view name
        return "calendar003";
    }


    @RequestMapping(value = "otherMonth")
    public String getOtherMonth(Model model, int identifier){

        /*the identifier variable of previous month is "-1", next month is "1"
        add method can adds or subtracts the specified amount of time.*/
        calendar.add(Calendar.MONTH, identifier);

        //get year and month from calendar variable
        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        //give year and month to getDateService after then, get calendarVo
        CalendarVo calendarVo=getDateService.getCalendar(year, (month+1));

        //Add the supplied name
        model.addAttribute("calVo", calendarVo);

        //return view name
        return "calendar003";
    }

    //확인용!!!!
    @RequestMapping(value = "saveContents", method= RequestMethod.POST)
    public String save(String scheduleTitle, String scheduleContents){
        System.out.println(scheduleContents+" "+scheduleTitle);
        return "redirect:/currentCal";
    }


}
