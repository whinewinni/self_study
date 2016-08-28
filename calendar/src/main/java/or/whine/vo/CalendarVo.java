package or.whine.vo;

public class CalendarVo {

    private int year;
    private int month;
    private int startWeekDay; //요일
    private int endOfMonth;

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
    public int getStartWeekDay() {
        return startWeekDay;
    }

    public void setStartWeekDay(int startWeekDay) {
        this.startWeekDay = startWeekDay;
    }
    public int getEndOfMonth() {
        return endOfMonth;
    }
    public void setEndOfMonth(int endOfMonth) {
        this.endOfMonth = endOfMonth;
    }
}
