package or.whine.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Winni on 2016-08-28.
 */
@Controller
public class MainController {

    @RequestMapping(value = "main")
    public String test(){
        return "calendar002";
    }
}
