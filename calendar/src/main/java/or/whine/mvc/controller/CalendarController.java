package or.whine.mvc.controller;

import or.whine.mvc.service.GetDateService;
import or.whine.vo.CalendarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @RequestMapping(value = "calendar002")
    public String calendar002(){
        return "calendar002";
    }

    /*ModelAndView 더 이상 사용하지 않음
    반환형을 String으로 주고 매개변수에 Model받아서
    addObject →  addAttribute
    setViewName → return 값으로 */



    /*calendar.get(calendar.DAY_OF_WEEK); //요일을 가져옴*/


    public static void main(String[] args) {
        //get date or time through calendar Class (caleandar class is Abstract Class)
        Calendar calendar = Calendar.getInstance();
        System.out.println(calendar.DAY_OF_MONTH);
        System.out.println(calendar.DAY_OF_YEAR);

        //날짜랑 년도를 구해와야 한다!!!!

    }


    @RequestMapping(value = "getCal")
    public String calendar(Model model){

        //get date or time through calendar Class (caleandar class is Abstract Class)
        Calendar calendar = Calendar.getInstance();



        CalendarVo calVo=getDateService.getCalendar(2016, 8);
        model.addAttribute("calVo", calVo);
        return "calendar003";
    }


    /*calendar 컨트롤러에서 현재값 구해서 넣어주고,
    otherMonth method 만들고, 파라미터 값으로 전달은 -1 다음달은 +1,
    년도랑 월 처리해서 서비스에 getCalendar로 넘겨줌.*/





} //end CalendarController class
