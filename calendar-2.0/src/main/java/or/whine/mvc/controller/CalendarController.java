package or.whine.mvc.controller;

import or.whine.bean.CalendarBean;
import or.whine.domain.CalendarTable;
import or.whine.mvc.service.CalendarServiceImple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Calendar;
import java.util.List;

/**
 * Created by Winni on 2016-09-18.
 */

@Controller
public class CalendarController {

    @Autowired
    private CalendarServiceImple getDataService;

    //Calendar variable declaration
    private Calendar calendar;

    @RequestMapping(value = "getCurrentCal")
    public String getCurrentCalendar(Model model){

        //declare calendar
        calendar=Calendar.getInstance();

        //get year and month from calendar variable
        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        List<CalendarTable> listAll=getDataService.listCalendartitle(year, month+1);
        model.addAttribute("listAll", listAll);

        //give year and month to getDateService
        //after then, get calendarVo
        CalendarBean calendarBean=getDataService.getCalendar(year, month);

        //Add the supplied name
        model.addAttribute("calBean", calendarBean);

        //return view name
        return "calendarView";
    }

    @RequestMapping(value = "otherMonth")
    public String getOhterMonth(Model model, int identifier){

         /*the identifier variable of previous month is "-1", next month is "1"
        add method can adds or subtracts the specified amount of time.*/
        calendar.add(Calendar.MONTH, identifier);

        //get year and month from calendar variable
        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        //give year and month to getDateService after then, get calendarBean
        CalendarBean calendarBean=getDataService.getCalendar(year, month);

        //Add the supplied name
        model.addAttribute("calBean", calendarBean);

        //return view name
        return "calendarView";
    }

    @RequestMapping(value = "saveContents", method= RequestMethod.POST)
    public String saveContent(CalendarTable calendarTable){
        getDataService.insertCalendarContent(calendarTable);
        return "redirect:/getCurrentCal";
    }
} //end CalendarController class
