package or.whine.mvc.controller;

import or.whine.mvc.service.GetDateService;
import or.whine.vo.CalendarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Winni on 2016-08-28.
 */
@Controller
public class CalendarController {

    @Autowired
    private GetDateService gds;

    @RequestMapping(value = "getCal")
    public ModelAndView calendar(){
        CalendarVo calVo=gds.getCalendar(2016, 8);
        ModelAndView mav=new ModelAndView("calendar003");
        mav.addObject("calVo", calVo);
        return mav;
    }


} //end CalendarController class
