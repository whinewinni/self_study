package or.whine.mvc.reprsitory;

import or.whine.domain.Whineboard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by Winni on 2016-11-16.
 */
@Repository
public class BoardRepositoryImpl implements BoardRepository{

    @PersistenceContext(unitName = "whineboard")
    private EntityManager entityManager;

    public List<Whineboard> findWhineBoardList() {
        StringBuffer sqlQuery = new StringBuffer();

        sqlQuery.append("SELECT * FROM whineboard");

        Query query=null;

        try {
            query= entityManager.createNativeQuery(sqlQuery.toString(), Whineboard.class);
        }catch (NullPointerException nullException){
            System.out.println("nullException");
            nullException.printStackTrace();
        }catch (Exception e){
            System.out.println("Exception");
            e.printStackTrace();
        }

        return query.getResultList();
    }
}
