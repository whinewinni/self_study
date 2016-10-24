package or.whine.mvc.repository;

import or.whine.domain.CalendarTable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Winni on 2016-10-23.
 */
@Repository
public class CalendarRepositoryImple implements CalendarRepositoryInterface{

    @PersistenceContext(unitName = "calendar")
    private EntityManager entityManager;

    public List<CalendarTable> getCalendarListAll(int year, int month) {
        return entityManager.createNamedQuery("getCalendarListALL").setParameter(1, year).setParameter(2, month).getResultList();
    }

    public CalendarTable getCalendarListOne(int calendarnum) {
        return null;
    }

    public int saveContent(CalendarTable calendarTable) {
        return 0;
    }

    public void updateContent(CalendarTable calendarTable) {

    }

    public void deleteContent(CalendarTable calendarTable) throws Exception {

    }
}
