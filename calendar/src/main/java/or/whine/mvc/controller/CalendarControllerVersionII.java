package or.whine.mvc.controller;

import or.whine.mvc.service.GetDateService;
import or.whine.vo.CalendarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by User on 2016-08-30.
 */

@Controller
public class CalendarControllerVersionII {


    @Autowired
    private GetDateService getDateService;


    @RequestMapping(value = "version2calendar")
    //if parameter is null, then the parameter value is "0"
    public String getCalendar(Model model, @RequestParam(value = "identifier", required = false, defaultValue = "0")int identifier){

        Calendar calendar=Calendar.getInstance();

        /*calendar.add(Calendar.DATE, 1);
        Date tempCalendar = calendar.getTime();*/

        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        if (identifier==1){
            if (month==1){
                month=12;
                year-=1;
            }else {
                month-=1;
            }
        }else if (identifier==2){
            if (month==12){
                month=1;
                year+=1;
            }else {
                month+=1;
            }
        }
        CalendarVo calendarVo=getDateService.getCalendar(year, (month+1));
        model.addAttribute("calVo", calendarVo);

        return "calendar003";
    }


}
