package or.whine.mvc.controller;

import or.whine.mvc.service.GetDateService;
import or.whine.vo.CalendarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Calendar;

/**
 * Created by User on 2016-08-30.
 */

@Controller
public class CalendarControllerVersionII {

   /* private Calendar calendar;

    //생성자로 하면 한번만 불러옴.
    public CalendarControllerVersionII() {

        calendar=Calendar.getInstance();
    }*/

    @Autowired
    private GetDateService getDateService;

    //어찌해야할까...
    private Calendar calendar=Calendar.getInstance();

    @RequestMapping(value = "version2calendar")
    //if parameter is null, then the parameter value is "0"
    public String getCalendar(Model model, @RequestParam(value = "identifier", required = false, defaultValue = "0")int identifier){

        /*the identifier variable of previous month is "-1", next month is "1"
        Calendar Month can get a current month
        add method can adds or subtracts the specified amount of time.*/
        calendar.add(Calendar.MONTH, identifier);

        //get year and month from calendar variable
        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        //get today date, for focus today styling
        int today=calendar.get(Calendar.DATE);
        if (identifier==0){
            model.addAttribute("todayStyle", today);
        }

        //give year and month to getDateService
        //after then, get calendarVo
        CalendarVo calendarVo=getDateService.getCalendar(year, (month+1));
        //Add the supplied name
        model.addAttribute("calVo", calendarVo);

        //return view name
        return "calendar003";
    }


}
