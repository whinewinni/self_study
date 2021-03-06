package or.whine.mvc.service;

import or.whine.domain.Whineboard;
import or.whine.mvc.reprsitory.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Winni on 2016-11-16.
 */
@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardRepository boardRepository;

    public List<Whineboard> findWhineBoardList() {
        return boardRepository.findWhineBoardList();
    }

    public Whineboard findWhineBoardDetail(int boardNum) {
        return boardRepository.findWhineBoardDetail(boardNum);
    }

    public int saveBoard(Whineboard whineboard) {
        whineboard.setBoardDate(new Date());
        return boardRepository.saveBoard(whineboard);
    }

    public void updateBoard(Whineboard whineboard) {
        boardRepository.updateBoard(whineboard);
    }
}
