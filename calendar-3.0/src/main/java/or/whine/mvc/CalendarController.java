package or.whine.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Winni on 2016-10-03.
 */
@Controller
public class CalendarController {

    @RequestMapping(value = "/a")
    public String uiTestMethod(){
        return "calendarView";
    }
} //end of CalendarController class
