package or.whine.mvc.repository;

import or.whine.domain.CalendarTable;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Winni on 2016-10-03.
 */
@Repository
@Transactional
public class CalendarRepository {

    @PersistenceContext(unitName = "calendar")
    private EntityManager entityManager;

    /*-------------------------------------Testing CODE----------------------------------------*/
    /*@Transactional
    public void saveTest(CalendarTable calendarTable) {
        entityManager.persist(calendarTable);
    }*/

    @Transactional
    public CalendarTable getCalendarListONE(){
        return (CalendarTable) entityManager.createNamedQuery("getCalendarListONE").setParameter(1, 37).getSingleResult();
    }
    /*-----------------------------------------------------------------------------------------*/


    @Transactional
    public List<CalendarTable> getcalendarListAll(int year, int month){
        return entityManager.createNamedQuery("getCalendarListALL").setParameter(1, year).setParameter(2, month).getResultList();
    }
    @Transactional
    public int saveContent(CalendarTable calendarTable) {
        entityManager.persist(calendarTable);
        return calendarTable.getCalendarnum();
    }
    @Transactional
    public void updateContent(CalendarTable calendarTable){
        entityManager.merge(calendarTable);
    }

    @Transactional
    public void deletecontent(CalendarTable calendarTable){
        entityManager.remove(calendarTable);
    }


} //end of CalendarRepository class
