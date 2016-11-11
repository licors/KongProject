package kong2.common;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kong2.showcase.ShowcaseModel;
import kong2.showcase.ShowcaseService;

@Controller
@RestController
public class ShowcaseBest_10 {
    
    @Autowired
    private ShowcaseService showcaseService;
    
    private static final Logger logger = LoggerFactory.getLogger(ShowcaseBest_10.class);
    
    @RequestMapping(value = "/best", headers = "Accept=application/json")
    public ArrayList<ShowcaseModel> getOnj() {
        
        ArrayList<ShowcaseModel> date = showcaseService.best_10();
        
        return date;
    }
}