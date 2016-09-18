package or.whine.bean;

/**
 * Created by Winni on 2016-09-18.
 * DB Connection 안하는 Bean
 */
public class CalendarBean {

    private int year;
    private int month;
    private int day;
    private int startWeekDay;
    private int endOfMonthDay;

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getStartWeekDay() {
        return startWeekDay;
    }

    public void setStartWeekDay(int startWeekDay) {
        this.startWeekDay = startWeekDay;
    }

    public int getEndOfMonthDay() {
        return endOfMonthDay;
    }

    public void setEndOfMonthDay(int endOfMonthDay) {
        this.endOfMonthDay = endOfMonthDay;
    }
} //end of CalendarBean class
