package kong2.showcase;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShowcaseSearchController {

    @Autowired
    private ShowcaseService showcaseService;
    private static final Logger logger = LoggerFactory.getLogger(ShowcaseSearchController.class);
    private String imgPath = ShowcaseController.imgPath;

    @RequestMapping("/main/search/{keyword}")
    public String search(@PathVariable(name = "keyword") String keyword, Model model) throws Exception {
        ShowcaseSearchModel showcaseSearchModel = new ShowcaseSearchModel();
        showcaseSearchModel.setSubject("%" + keyword + "%");
        List<ShowcaseModel> list = showcaseService.search_subject(showcaseSearchModel);
        model.addAttribute("list", list);
        model.addAttribute("showcaseSearchModel", showcaseSearchModel);
        model.addAttribute("img", imgPath);
        logger.info(showcaseSearchModel.toString());
        return "mainlist";
    }

    @RequestMapping("/main/{showcase_category}/{keyword}")
    public String searchc(@PathVariable(name = "keyword") String keyword, @PathVariable(name = "showcase_category") String showcase_category, Model model) throws Exception {
        ShowcaseSearchModel showcaseSearchModel = new ShowcaseSearchModel();
        showcaseSearchModel.setSubject("%" + keyword + "%");
        showcaseSearchModel.setShowcase_category(category_chk(showcase_category));
        List<ShowcaseModel> list = showcaseService.search_subject_category(showcaseSearchModel);
        model.addAttribute("list", list);
        model.addAttribute("showcaseSearchModel", showcaseSearchModel);
        model.addAttribute("img", imgPath);
        logger.info(showcaseSearchModel.toString());
        return "mainlist";
    }

    @RequestMapping("/main/search/Tag/{keyword}")
    public String searchtag(@PathVariable(name = "keyword") String keyword, Model model) throws Exception {
        ShowcaseSearchModel showcaseSearchModel = new ShowcaseSearchModel();
        showcaseSearchModel.setTag("%" + keyword + "%");
        List<ShowcaseModel> list = showcaseService.search_tag(showcaseSearchModel);
        model.addAttribute("list", list);
        model.addAttribute("showcaseSearchModel", showcaseSearchModel);
        model.addAttribute("img", imgPath);
        logger.info(showcaseSearchModel.toString());
        return "mainlist";
    }

    @RequestMapping("/main/{showcase_category}/Tag/{keyword}")
    public String searchctag(@PathVariable(name = "keyword") String keyword, @PathVariable(name = "showcase_category") String showcase_category, Model model) throws Exception {
        ShowcaseSearchModel showcaseSearchModel = new ShowcaseSearchModel();
        showcaseSearchModel.setTag("%" + keyword + "%");
        showcaseSearchModel.setShowcase_category(category_chk(showcase_category));
        List<ShowcaseModel> list = showcaseService.search_category_tag(showcaseSearchModel);
        model.addAttribute("list", list);
        model.addAttribute("showcaseSearchModel", showcaseSearchModel);
        model.addAttribute("img", imgPath);
        logger.info(showcaseSearchModel.toString());
        return "mainlist";
    }

    protected String category_chk(String showcase_category) {
        switch (showcase_category) {
            case "aticle":
                return "전시";
            case "art":
                return "미술";
            case "event":
                return "이벤트";
            default:
                return "null";
        }
    }
}
