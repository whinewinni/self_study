package or.whine.domain;



import javax.persistence.*;
import java.util.Date;

/**
 * Created by User on 2016-10-03.
 */
@Entity
@NamedQueries({
        /*@NamedQuery(name = "getCalendarListALL", query = "SELECT calendarnum, title, content, year, month, day, scheduleTime FROM CalendarTable ORDER BY calendarnum"),
        @NamedQuery(name = "getCalendarListONE", query = "SELECT calendarnum, title, content, year, month, day, scheduleTime FROM CalendarTable WHERE calendarnum=?1")*/

        @NamedQuery(name = "getCalendarListALL", query = "SELECT ctall FROM CalendarTable AS ctall ORDER BY calendarnum"),
        @NamedQuery(name = "getCalendarListONE", query = "SELECT ctone FROM CalendarTable AS ctone WHERE calendarnum=?1")
})
@Table(name = "CalendarTable")
public class CalendarTable {
/*    create table calendarTable(
            calendarnum number primary key,
            title varchar(100) not null,
    content clob,
    year number(10),
    month number(10),
    day number(10),
    scheduleTime date
  );*/
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
