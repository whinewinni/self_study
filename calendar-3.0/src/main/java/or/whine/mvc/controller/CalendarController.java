package or.whine.mvc.controller;

import or.whine.domain.CalendarTable;
import or.whine.mvc.service.CalendarServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;

/**
 * Created by Winni on 2016-10-03.
 */
@Controller
public class CalendarController {

    @Autowired
    private CalendarServiceInterface calendarServiceInterface;

    @RequestMapping(value = "/a")
    public String uiTestMethod(Model model){
        System.out.println("Log1");
        CalendarTable calendarTable=calendarServiceInterface.getCalendarListONE();
        model.addAttribute("TestList", calendarTable);

        return "calendarView";
    }

    @RequestMapping(value = "saveTestRequestMapping", method = RequestMethod.POST)
    public String saveTest(Model model, CalendarTable calendarTable) {
        /*System.out.println("Log 01");*/
        calendarTable.setScheduleTime(new Date());
        calendarServiceInterface.saveTest(calendarTable);
        return "redirect:/a";
    }

} //end of CalendarController class
