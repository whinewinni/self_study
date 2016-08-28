package or.whine.mvc.controller;

import or.whine.mvc.service.GetDateService;
import or.whine.vo.CalendarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Winni on 2016-08-28.
 */
@Controller
public class CalendarController {

    @RequestMapping(value = "calendar002")
    public String calendar002(){
        return "calendar002";
    }

    @Autowired
    private GetDateService gds;

    @RequestMapping(value = "getCal")
    public ModelAndView calendar(){
        CalendarVo calVo=gds.getCalendar(2016, 8);
        ModelAndView mav=new ModelAndView("calendar003");
        mav.addObject("calVo", calVo);
        return mav;
    }


    /*calendar 컨트롤러에서 현재값 구해서 넣어주고,
    otherMonth method 만들고, 파라미터 값으로 전달은 -1 다음달은 +1,
    년도랑 월 처리해서 서비스에 getCalendar로 넘겨줌.*/



} //end CalendarController class
