package or.whine.mvc.controller;

import or.whine.domain.Whineboard;
import or.whine.mvc.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Winni on 2016-11-16.
 */
@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @RequestMapping(value = "/test")
    public String test(){
        return "write";
    }

    @RequestMapping(value = "/getWhineBoardList")
    public String getWhineBoardList(Model model){
        List<Whineboard> findWhineBoardList=boardService.findWhineBoardList();

        model.addAttribute("findWhineBoardList", findWhineBoardList);
        return "mainBoardList";
    }
} //end  BoardController class
