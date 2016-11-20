package or.whine.mvc.reprsitory;

import or.whine.domain.Whineboard;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by Winni on 2016-11-16.
 */
@Repository
public class BoardRepositoryImpl implements BoardRepository{

    @PersistenceContext(unitName = "board")
    private EntityManager entityManager;

    @Transactional
    public List<Whineboard> findWhineBoardList() {
        StringBuffer sqlQuery = new StringBuffer();

        sqlQuery.append(" SELECT * FROM whineboard ORDER BY boardNum DESC ");

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

    @Transactional
    public Whineboard findWhineBoardDetail(int boardNum) {

        StringBuffer sqlQuery=new StringBuffer();

        sqlQuery.append(" SELECT * FROM whineboard WHERE boardNum = :boardNum ");

        Query query=null;

        try{
            query=entityManager.createNativeQuery(sqlQuery.toString(), Whineboard.class)
                    .setParameter("boardNum", boardNum);
        }catch (Exception e){
            System.out.println("findWhineBoardDetail Exception");
            e.printStackTrace();
        }

        return (Whineboard) query.getSingleResult();
    }

    @Transactional
    public int saveBoard(Whineboard whineboard) {
        entityManager.persist(whineboard);
        return whineboard.getBoardNum();
    }

    @Transactional
    public void updateBoard(Whineboard whineboard) {
        entityManager.merge(whineboard);
    }

}
