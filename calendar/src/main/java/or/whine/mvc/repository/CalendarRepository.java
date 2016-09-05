package or.whine.mvc.repository;

import or.whine.vo.CalendarContentVO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Winni on 2016-09-05.
 */
@Repository                //Dao
public class CalendarRepository {

    @Autowired    //SqlSessionTemplate랑 비슷한다 보다.
    private SessionFactory sessionFactory;

    public void insertCalendatContent(CalendarContentVO calendarContentVO){
        //Bean에 설정한 애들임
        Session session=sessionFactory.openSession();   //session 얻어옴
        Transaction transaction=session.beginTransaction();
        session.save(calendarContentVO);   //insert
        session.getTransaction().commit(); //commit
        if (session!=null){
            session.close();
        }
    }
}
