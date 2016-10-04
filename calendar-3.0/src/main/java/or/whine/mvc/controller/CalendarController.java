package or.whine.mvc.controller;

import or.whine.bean.CalendarBean;
import or.whine.domain.CalendarTable;
import or.whine.mvc.service.CalendarService;
import or.whine.mvc.service.CalendarServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Calendar;
import java.util.Date;
import java.util.List;


/**
 * Created by Winni on 2016-10-03.
 */
@Controller
public class CalendarController {

    @Autowired
    private CalendarService calendarService;


    /*-------------------------------------Testing CODE----------------------------------------*/
    /*@RequestMapping(value = "/a")
    public String uiTestMethod(Model model){
        System.out.println("Log1");
        CalendarTable calendarTable=calendarService.getCalendarListONE();
        model.addAttribute("TestList", calendarTable);

        return "calendarView";
    }*/

    @RequestMapping(value = "saveTestRequestMapping", method = RequestMethod.POST)
    public String saveTest(Model model, CalendarTable calendarTable) {
        /*System.out.println("Log 01");*/
        calendarTable.setScheduleTime(new Date());
        calendarService.saveContent(calendarTable);
        return "redirect:/a";
    }
    /*-----------------------------------------------------------------------------------------*/

    /*----------------------------------------------------------------------------------------------------------------*/
    //Calendar variable declaration
    private Calendar calendar;

    @RequestMapping(value = "/")
    public String getCurrentCalendar(Model model){
        //declare calendar
        calendar=Calendar.getInstance();

        //get year and month from calendar variable
        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH);

        //get CalendarTable domain from listCalendartitle
        List<CalendarTable> listAll=calendarService.getCalendarListALL(year, month+1);
        model.addAttribute("listAll", listAll);

        //give year and month to getDateService
        //after then, get calendarVo
        CalendarBean calendarBean=calendarService.getCalendar(year, month);

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

        //get CalendarTable domain from listCalendartitle
        List<CalendarTable> listAll=calendarService.getCalendarListALL(year, month+1);
        //listAll value is for showing title
        model.addAttribute("listAll", listAll);

        //give year and month to getDateService after then, get calendarBean
        CalendarBean calendarBean=calendarService.getCalendar(year, month);

        //Add the supplied name
        model.addAttribute("calBean", calendarBean);

        //return view name
        return "calendarView";
    }

    /*    @ResponseBody 바디로 응답;
    리턴되는 값은 View 를 통해 출력되지 않고 HTTP Response Body 에 직접 씀*/
    @RequestMapping(value = "saveContents", method= RequestMethod.POST)
    public @ResponseBody String saveContent(CalendarTable calendarTable){
        /*System.out.println("calendarTable.getTitle() : "+calendarTable.getTitle());
        System.out.println("calendarTable.getContent() : "+calendarTable.getContent());*/
        //send calendarTable(parameter) Domain to saveContent method in CalendarService class
        int getSeq=calendarService.saveContent(calendarTable);
        System.out.println("getSeq : "+getSeq);

        //return "{'result':'" + getSeq + "'}";
        return String.valueOf(getSeq);
    }

    @RequestMapping(value = "updateContent", method= RequestMethod.POST)
    public @ResponseBody void updateContent(CalendarTable calendarTable){
        calendarService.updateCotent(calendarTable);
    }

    @RequestMapping(value = "deletecontent")
    public @ResponseBody void deleteContent(int calendarnum){
        System.out.println("delete Controller calendarnum - "+calendarnum);
        calendarService.deleteContent(calendarnum);
        System.out.println("Log : Delete Done!!!");
    }





} //end of CalendarController class
