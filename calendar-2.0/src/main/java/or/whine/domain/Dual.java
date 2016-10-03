package or.whine.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by User on 2016-09-29.
 */
@Entity
@Table(name = "dual")
public class Dual {
    private int calendarnum;

    @Id
    public int getCalendarnum() {
        return calendarnum;
    }

    public void setCalendarnum(int calendarnum) {
        this.calendarnum = calendarnum;
    }
}
