package or.whine.mvc.reprsitory;

import or.whine.domain.Whineboard;

import java.util.List;

/**
 * Created by Winni on 2016-11-16.
 */
public interface BoardRepository {

    public List<Whineboard> findWhineBoardList();
} //end BoardRepository class
