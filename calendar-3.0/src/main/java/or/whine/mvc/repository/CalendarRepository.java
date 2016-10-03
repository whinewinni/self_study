package or.whine.mvc.repository;

import or.whine.domain.CalendarTable;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by Winni on 2016-10-03.
 */
@Repository
@Transactional
public class CalendarRepository {

    @PersistenceContext(unitName = "calendar")
    private EntityManager entityManager;

    @Transactional
    public void saveTest(CalendarTable calendarTable) {
        entityManager.persist(calendarTable);
    }

    @Transactional
    public CalendarTable getCalendarListONE(){
        return (CalendarTable) entityManager.createNamedQuery("getCalendarListONE").setParameter(1, 37).getResultList();
    }
} //end of CalendarRepository class
