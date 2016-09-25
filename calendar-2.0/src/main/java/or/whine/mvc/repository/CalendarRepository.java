package or.whine.mvc.repository;

import or.whine.domain.CalendarTable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Winni on 2016-09-18.
 */
@Repository
public class CalendarRepository {

    @Autowired    //like SqlSessionTemplate
    private SessionFactory sessionFactory;

    public void insertContents(CalendarTable calendarTable){
        Session session=sessionFactory.openSession();
        Transaction transaction=session.beginTransaction();
        session.save(calendarTable);
        session.getTransaction().commit();
        if (session!=null){
            session.close();
        }
    }

    public List<CalendarTable> listAll(int year, int month){
        Session session=sessionFactory.openSession();
        session.beginTransaction();
        Query query=session.createQuery("from CalendarTable where year=:year and month=:month");
        query.setParameter("year" , year);
        query.setParameter("month" , month);
        List<CalendarTable> list=query.list();
        session.getTransaction().commit();
        if (session!=null){
            session.close();
        }
        return list;
    }

    public void update(CalendarTable calendarTable){
        Session session=sessionFactory.openSession();
        session.beginTransaction();
        String updateQuery="UPDATE CalendarTable set title=:title, content=:content WHERE calendarnum=:calendarnum";
        Query query=session.createQuery(updateQuery);
        query.setParameter("title", calendarTable.getTitle());
        query.setParameter("content", calendarTable.getContent());
        query.setParameter("calendarnum", calendarTable.getCalendarnum());
        int q=query.executeUpdate();
        System.out.println(q);
        //session.update(calendarTable);
        session.getTransaction().commit();
        if (session!=null){
            session.close();
        }
    }




} //end CalendarRepository class