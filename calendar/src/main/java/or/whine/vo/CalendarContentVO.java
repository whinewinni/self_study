package or.whine.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Winni on 2016-09-05.
 */
@Entity
@Table(name = "calendarTable")   //연결할 Table
public class CalendarContentVO {

    /*create table calendarTable(
            calendatnum number primary key,
            title varchar(100) not null,
            content clob
    );
    create sequence calendarTable_seq start with 1 INCREMENT by 1;*/

    @Id   //시퀀스로 사용할 애는 어노테이션 id줌
    @Column(name = "calendatnum")  //각 컬럼에 컬럼 어노테이션이랑 컬럼명 이름으로 주기
    private int calendatnum;
    @Column(name = "title")
    private String title;
    @Column(name = "content")
    private String content;

    public int getCalendatnum() {
        return calendatnum;
    }

    public void setCalendatnum(int calendatnum) {
        this.calendatnum = calendatnum;
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
