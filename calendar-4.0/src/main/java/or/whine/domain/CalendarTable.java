package or.whine.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Winni on 2016-10-23.
 */
@NamedQueries({
    @NamedQuery(name = "getCalendarListALL", query = "SELECT ct FROM CalendarTable AS ct WHERE ct.year=?1 AND ct.month=?2"),
    @NamedQuery(name = "getCalendarListONE", query = "SELECT ct FROM CalendarTable AS ct WHERE ct.calendarnum=?1"),
    @NamedQuery(name = "getListModalCalendarDomainList", query = "SELECT ct FROM CalendarTable AS ct WHERE ct.year=?1 AND ct.month=?2 AND ct.day=?3")
})
@Entity
@Table(name = "CalendarTable")
public class CalendarTable {

    @Id
    @GeneratedValue(generator = "calendarnum")
    @SequenceGenerator(name = "calendarnum", sequenceName = "calendarTable_seq", allocationSize = 1)
    @Column(name = "calendarnum")
    private int calendarnum;

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Column(name = "year")
    private int year;

    @Column(name = "month")
    private int month;

    @Column(name = "day")
    private int day;

    @Temporal(TemporalType.DATE)
    @Column(name = "scheduleTime")
    private Date scheduleTime;

    public int getCalendarnum() {
        return calendarnum;
    }

    public void setCalendarnum(int calendarnum) {
        this.calendarnum = calendarnum;
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

    public Date getScheduleTime() {
        return scheduleTime;
    }

    public void setScheduleTime(Date scheduleTime) {
        this.scheduleTime = scheduleTime;
    }

}
