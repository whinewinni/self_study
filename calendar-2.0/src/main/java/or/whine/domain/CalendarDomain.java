package or.whine.domain;

import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by Winni on 2016-09-18.
 */

@Entity
@Table(name = "calendarTable")
public class CalendarDomain {

    @Id      //시퀀스  //아래는 nextVal처럼, 시퀀스를 증가하게 해주는 어노테이션 설정해줘야함-_-!
    @GeneratedValue(generator = "calendarnumNextVal", strategy = GenerationType.SEQUENCE)
    //시퀀스가 서버가 끊어졌다가 다시 연결되면 reset됨, 아래 주석이 이를 해결할수 있다고 했지만
    //해결되지 않음. 시퀀스를 해결할수 있는 jqp 어노테이션을 찾아야함.
    /*@GenericGenerator(name = "calendarnumNextVal", strategy = "SEQUENCE",
                      parameters ={@org.hibernate.annotations.Parameter(name="SEQUENCE", value = "calendarTable_seq")})*/
    @SequenceGenerator(name = "calendarnumNextVal", sequenceName = "calendarTable_seq")
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
