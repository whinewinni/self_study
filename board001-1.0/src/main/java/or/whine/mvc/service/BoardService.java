package or.whine.mvc.service;

import or.whine.domain.Whineboard;

import java.util.List;

/**
 * Created by Winni on 2016-11-16.
 */
public interface BoardService {

    public List<Whineboard> findWhineBoardList();

    public Whineboard findWhineBoardDetail(int boardNum);

    public int saveBoard(Whineboard whineboard);

    public void updateBoard(Whineboard whineboard);
} //edn BoardService
