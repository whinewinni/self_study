package or.whine.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Winni on 2016-09-18.
 */

@Entity
@Table(name = "calendarTable")
public class CalendarDomain {

    @Id
    @Column(name = "calendarnum")
    private int calendarnum;
    @Column(name = "year")
    private int year;
    @Column(name = "month")
    private int month;
    @Column(name = "day")
    private int day;
    @Column(name = "title")
    private String title;
    @Column(name = "content")
    private String content;

    public int getCalendarnum() {
        return calendarnum;
    }

    public void setCalendarnum(int calendarnum) {
        this.calendarnum = calendarnum;
    }

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
