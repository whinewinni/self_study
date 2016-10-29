package or.whine.mvc.repository;

import or.whine.domain.CalendarTable;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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

    public List<CalendarTable> getListModalCalendarDomainList(CalendarTable calendarTable){
        return entityManager.createNamedQuery("getListModalCalendarDomainList").setParameter(1, calendarTable.getYear()).setParameter(2, calendarTable.getMonth()).setParameter(3, calendarTable.getDay()).getResultList();
    }

    public List<CalendarTable> getCalendarListAll(int year, int month) {
        return entityManager.createNamedQuery("getCalendarListALL").setParameter(1, year).setParameter(2, month).getResultList();
    }

    public CalendarTable getCalendarListOne(int calendarnum) {
        return (CalendarTable) entityManager.createNamedQuery("getCalendarListONE").setParameter(1, calendarnum).getSingleResult();
    }

    public int saveContent(CalendarTable calendarTable) {
        entityManager.persist(calendarTable);
        return calendarTable.getCalendarnum();
    }

    public void updateContent(CalendarTable calendarTable) {

    }

    @Transactional
    public void deleteContent(CalendarTable calendarTable) throws Exception {
        entityManager.remove(calendarTable);
    }
}
