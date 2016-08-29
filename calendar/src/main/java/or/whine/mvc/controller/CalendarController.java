package or.whine.mvc.controller;

import or.whine.mvc.service.GetDateService;
import or.whine.vo.CalendarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Calendar;

/**
 * Created by Winni on 2016-08-28.
 */
@Controller
public class CalendarController {

    @Autowired
    private GetDateService getDateService;

    //make a calendarVo variable, for sharing same address in this class.
    private CalendarVo calendarVo;

    //calendar002.jsp is only java script code
    //calendar002.jsp and calendar003.jsp are different
    @RequestMapping(value = "getJsCal")
    public String getJavaScriptCalendar(){
        return "calendar002";
    }

    /*ModelAndView 더 이상 사용하지 않음
    반환형을 String으로 주고 매개변수에 Model받아서
    addObject →  addAttribute
    setViewName → return 값으로 */

    @RequestMapping(value = "getCal")
    public String calendar(Model model){

        //get date or time through calendar Class (caleandar class is Abstract Class)
        Calendar calendar = Calendar.getInstance();
        int year =calendar.get(Calendar.YEAR);
        int month =calendar.get(Calendar.MONTH);

        //give year and month to getCalendar method within the getDateService class
        //month is from 0 to 11, so add "1"
        calendarVo=getDateService.getCalendar(year, (month+1));
        //give calVo variable as "calVo" name.
        model.addAttribute("calVo", calendarVo);
        //return view name
        return "calendar003";
    }


    /*calendar 컨트롤러에서 현재값 구해서 넣어주고,
    otherMonth method 만들고, 파라미터 값으로 전달은 -1 다음달은 +1,
    년도랑 월 처리해서 서비스에 getCalendar로 넘겨줌.*/
    @RequestMapping(value = "getOtherMonth")
    public String getOtherMonth(Model model, int identifier){
        //get year and month from calendatVo
        int year=calendarVo.getYear();
        int month=calendarVo.getMonth();
        // check the identifier variable (1 or 2)
        if (identifier==1){
            //if month is January then the month is changing to December and year is 1 year going down
            if (month==1){
                month=12;
                year-=1;
            }else {
                month-=1;
            }
        }else if (identifier==2){
            //if month is December then the month is changing to January and year is 1 year going up
            if (month==12){
                month=1;
                year+=1;
            }else {
                month+=1;
            }
        }
        calendarVo=getDateService.getCalendar(year, month);
        model.addAttribute("calVo", calendarVo);
        return "calendar003";
    }

} //end CalendarController class
