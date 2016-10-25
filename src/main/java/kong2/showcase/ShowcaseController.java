package kong2.showcase;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShowcaseController {

    @Autowired
    private ShowcaseDAOService showcaseDAOService;

    private static final Logger logger = LoggerFactory.getLogger(ShowcaseController.class);

    @RequestMapping("/main")
    public String main(Model model) {
        logger.info("Welcome main.");

        ShowcaseModel aticleModel = new ShowcaseModel(); //전시글
        aticleModel.setShowcase_category("전시");
        List<ShowcaseModel> aticle = showcaseDAOService.selectmain(aticleModel);

        ShowcaseModel artModel = new ShowcaseModel(); //미술
        artModel.setShowcase_category("미술");
        List<ShowcaseModel> art = showcaseDAOService.selectmain(artModel);

        ShowcaseModel eventModel = new ShowcaseModel(); //이벤트
        eventModel.setShowcase_category("이벤트");
        List<ShowcaseModel> event = showcaseDAOService.selectmain(eventModel);

        model.addAttribute("aticle", aticle);
        model.addAttribute("art", art);
        model.addAttribute("event", event);
        return "/main/main";
    }
}
