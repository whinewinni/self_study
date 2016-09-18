package or.whine.mvc.repository;

import or.whine.domain.CalendarDomain;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Winni on 2016-09-18.
 */
@Repository
public class CalendarRepository {

    @Autowired    //like SqlSessionTemplate
    private SessionFactory sessionFactory;

    public void insertContents(CalendarDomain calendarDomain){
        Session session=sessionFactory.openSession();
        Transaction transaction=session.beginTransaction();
        session.save(calendarDomain);
        session.getTransaction().commit();
        if (session!=null){
            session.close();
        }
    }

} //end CalendarRepository class
