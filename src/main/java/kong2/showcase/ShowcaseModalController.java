package kong2.showcase;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RestController
public class ShowcaseModalController {
    
    @Autowired
    private ShowcaseService showcaseService;
    
    private static final Logger logger = LoggerFactory.getLogger(ShowcaseModalController.class);
    
    @RequestMapping(value = "/test/{showcase_num}", method = RequestMethod.GET, headers = "Accept=application/json")
    public ShowcaseModel getOnj(@PathVariable int showcase_num) {
        ShowcaseModel category = new ShowcaseModel();
        category.setShowcase_num(showcase_num);
        ShowcaseModel date = showcaseService.selectone(category);
        logger.info("load showcase_num:" + showcase_num + "date:" + date.toString());
        return date;
    }
}
