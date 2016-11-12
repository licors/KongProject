package kong2.support;

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
public class SupportreplyController {

    @Autowired
    private SupportService supportService;

    private static final Logger logger = LoggerFactory.getLogger(SupportreplyController.class);

    @RequestMapping(value = "/support/reply/{support_num}", method = RequestMethod.GET, headers = "Accept=application/json")
    public SupportModel reply(@PathVariable int support_num) {
        SupportModel supportModel = new SupportModel();
        supportModel.setRef(support_num);
        supportModel.setRe_step(1);
        SupportModel date = supportService.selectreply(supportModel);

        logger.info("load support_num:" + support_num + "date:" + date.toString());
        return date;
    }
}
