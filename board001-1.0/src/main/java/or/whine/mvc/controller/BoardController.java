package or.whine.mvc.controller;

import or.whine.domain.Whineboard;
import or.whine.mvc.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "/main")
    public String getWhineBoardList(Model model){
        List<Whineboard> findWhineBoardList=boardService.findWhineBoardList();

        model.addAttribute("findWhineBoardList", findWhineBoardList);
        return "mainBoardList";
    }

    @RequestMapping(value = "/getDetail", method = RequestMethod.GET)
    public String getWhineBoardDetail(Model model, int boardNum){
        Whineboard getBoardDetail=boardService.findWhineBoardDetail(boardNum);

        model.addAttribute("getBoardDetail", getBoardDetail);
        return "detail";
    }

    @RequestMapping(value = "/getWritePage")
    public String getWritePage(){
        return "write";
    }

    @RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
    public String saveBoard(Model model, Whineboard whineboard){
        int boardNumFromSEQ=boardService.saveBoard(whineboard);
        return "redirect:/getDetail?boardNum="+boardNumFromSEQ;
    }

    @RequestMapping(value = "/getModifyForm", method = RequestMethod.GET)
    public String getModifyForm(Model model, int boardNum){
        Whineboard getModifyForm=boardService.findWhineBoardDetail(boardNum);
        model.addAttribute("modifyData",getModifyForm);
        return "update";
    }

    @RequestMapping(value = "/modifyBoard", method = RequestMethod.POST)
    public String modifyDone(Whineboard whineboard){
        System.out.println("Log 01");
        System.out.println(whineboard.getBoardNum());
        boardService.updateBoard(whineboard);
        System.out.println("Log 02");
        return "redirect:/getDetail?boardNum="+whineboard.getBoardNum();
    }
} //end  BoardController class
