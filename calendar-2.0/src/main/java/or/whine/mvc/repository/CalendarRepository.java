package or.whine.mvc.repository;

import or.whine.domain.CalendarTable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
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
        try {
            Transaction transaction=session.beginTransaction();
            session.save(calendarTable);
            session.getTransaction().commit();
        }catch (Exception e){
            System.out.println("CalendarRepository insertContents Exception");
            e.printStackTrace();
        }finally {
            session.close();
        } //end try catch
    } //end of insertContents method

    public List<CalendarTable> listAll(int year, int month){
        Session session=sessionFactory.openSession();
        List<CalendarTable> list=null;
        try {
            session.beginTransaction();
            Query query=session.createQuery("from CalendarTable where year=:year and month=:month");
            query.setParameter("year" , year);
            query.setParameter("month" , month);
            list=query.list();
            session.getTransaction().commit();
        }catch (Exception e){
            System.out.println("CalendarRepository listAll Exception");
            e.printStackTrace();
        }finally {
            session.close();
        } //end try catch
        return list;
    } //end listAll method

    public void update(CalendarTable calendarTable){
        Session session=sessionFactory.openSession();
        try {
            session.beginTransaction();
            String updateQuery="UPDATE CalendarTable set title=:title, content=:content WHERE calendarnum=:calendarnum";
            Query query=session.createQuery(updateQuery);
            query.setParameter("title", calendarTable.getTitle());
            query.setParameter("content", calendarTable.getContent());
            query.setParameter("calendarnum", calendarTable.getCalendarnum());
            query.executeUpdate();
            //session.update(calendarTable);
            session.getTransaction().commit();
        }catch (Exception e){
            System.out.println("CalendarRepository update Exception");
            e.printStackTrace();
        }finally {
            session.close();
        } //end try catch
    } //end update method

    public void delete(int calendarnum){
        Session session=sessionFactory.openSession();
        try {
            session.beginTransaction();
            String deleteQuery="DELETE CalendarTable WHERE calendarnum=:calendarnum";
            Query query=session.createQuery(deleteQuery);
            query.setParameter("calendarnum", calendarnum);
            int q=query.executeUpdate();
            session.getTransaction().commit();
        }catch (Exception e){
            System.out.println("CalendarRepository Delete error");
            e.printStackTrace();
        }finally {
            session.close();
        } //end ret catch
    } //end delete method

    public int getSeq(){
        int getNowSeq=0;
        Session session=sessionFactory.openSession();
        try{
            session.beginTransaction();
            String currvalSeq="select calendarTable_seq.CURRVAL as calendarnum from dual";
            Query query=session.createQuery(currvalSeq);
            List tempList=query.list();
            getNowSeq=(Integer)tempList.get(0);
            session.getTransaction().commit();
        }catch (Exception e){
            System.out.println("getSeq Exception");
            e.printStackTrace();
        }finally {
            session.close();
        }
        return getNowSeq;
    }


    public int getSqlInsertQuery(CalendarTable calendarTable){
        int getNowSeq=0;
        Session session=sessionFactory.openSession();
        try{
            session.beginTransaction();
            session.save(calendarTable);
           /* String currvalSeq="select calendarTable_seq.CURRVAL as calendarnum from Dual";
            Query query=session.createQuery(currvalSeq);
            List tempList=query.list();
            getNowSeq=(Integer)tempList.get(0);*/
           getNowSeq = calendarTable.getCalendarnum();

            System.out.println(calendarTable.getCalendarnum());
            System.out.println(calendarTable.getCalendarnum());
            session.getTransaction().commit();
            System.out.println(calendarTable.getCalendarnum());
            System.out.println(calendarTable.getCalendarnum());
        }catch (Exception e){
            System.out.println("getSqlInsertQuery Exception");
            e.printStackTrace();
        }finally {
            session.close();
        }
        return getNowSeq;
    }





} //end CalendarRepository class
