package or.whine.mvc.controller;

import or.whine.bean.CalendarBean;
import or.whine.domain.CalendarTable;
import or.whine.mvc.service.CalendarServiceInterface;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Winni on 2016-10-23.
 */

@Controller
public class CalendarController {

    /*@RequestMapping("test")
    public String test(){
        return "calendarView";
    }*/

    @Autowired
    private CalendarServiceInterface calendarService;

    //Calendar variable declaration
    private Calendar calendar;

    @RequestMapping(value = "getListModalCalendarDomainList", method = RequestMethod.POST)
    public @ResponseBody String getEachDayContentList(CalendarTable calendarTable){
        //get ListModalCalendarDomainList
        List<CalendarTable> ListModalCalendarDomainList=calendarService.getListModalCalendarDomainList(calendarTable);

        //ObjectMapper 생성 (for Json)
        ObjectMapper objectMapper=new ObjectMapper();

        String jsonString="";
        try {
            jsonString=objectMapper.writeValueAsString(ListModalCalendarDomainList);
        } catch (IOException e) {
            System.out.println("getListModalCalendarDomainList-objectMapper-IOException");
            e.printStackTrace();
        }
        return jsonString;
    }

    @RequestMapping(value = "/deletecontent/{calendarnum}")
    public @ResponseBody String deleteContent(@PathVariable int calendarnum) throws Exception{
        /*deleteContent 메소드의 자료형이 bollean이다.
        실패했을 경우에 Ajax의 success가 fail을 받고 성공했을 경우에는 success를 받는다.*/
        boolean outcome=calendarService.deleteContent(calendarnum);
        if (outcome){
            System.out.println("sGFDGFFDGDGFZdzfg");
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping(value = "/")
    public String getCurrentCalendar(Model model){

        //declare calendar
        calendar=Calendar.getInstance();

        //get year and month from calendar variable
        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        //get CalendarTable domain from getCalendarListAll
        List<CalendarTable> calendarTables=calendarService.getCalendarListAll(year, month+1);
        model.addAttribute("calendarTables", calendarTables);

        //give year and month to getDateService
        //after then, get calendarVo
        CalendarBean calendarBean=calendarService.getCalendar(year, month);

        //Add the supplied name
        model.addAttribute("calBean", calendarBean);

        //return view name
        return "calendarView";
    }

    @RequestMapping(value = "otherMonth")
    public String getOtherMonthCalendar(Model model, int identifier){

        /*the identifier variable of previous month is "-1", next month is "1"
        add method can adds or subtracts the specified amount of time.*/
        calendar.add(Calendar.MONTH, identifier);

        //get year and month from calendar variable
        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        //get CalendarTable domain from getCalendarListAll
        List<CalendarTable> calendarTables=calendarService.getCalendarListAll(year, month+1);
        model.addAttribute("calendarTables", calendarTables);

        //give year and month to getDateService after then, get calendarBean
        CalendarBean calendarBean=calendarService.getCalendar(year, month);

        //Add the supplied name
        model.addAttribute("calBean", calendarBean);

        return "calendarView";
    }


}

