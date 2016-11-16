package or.whine.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Winni on 2016-11-16.
 */
/*@NamedQueries({
    @NamedQuery(name = "getBoardList", query = "SELECT * FROM whineboard ORDER BY boardnum DESC")
})*/
@Entity
@Table(name = "whineboard")
public class Whineboard {

    /*
    create table whineboard(
            boardnum number primary key,
            title varchar(100) not null,
            writer varchar(50) not null,
            content clob,
            boarddate date,
            hit number
     );
    create sequence whineboard_seq start with 1 INCREMENT by 1;
    */
    @Id
    @GeneratedValue(generator = "boardnum")
    @SequenceGenerator(name = "boardnum", sequenceName = "whineboard_seq", allocationSize = 1)
    @Column(name = "boardnum")
    private int boardNum;

    @Column(name = "title")
    private String title;

    @Column(name = "writer")
    private String writer;

    @Column(name = "content")
    private String content;

    @Column(name = "hit")
    private int hit;

    @Temporal(TemporalType.DATE)
    @Column(name = "boarddate")
    private Date boardDate;

    public int getBoardNum() {
        return boardNum;
    }

    public void setBoardNum(int boardNum) {
        this.boardNum = boardNum;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public Date getBoardDate() {
        return boardDate;
    }

    public void setBoardDate(Date boardDate) {
        this.boardDate = boardDate;
    }
}
