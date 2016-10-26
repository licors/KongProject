package kong2.showcase;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ShowcaseController {

    @Autowired
    private ShowcaseDAOService showcaseDAOService;

    String uploadPath = "classpath:/1";

    private static final Logger logger = LoggerFactory.getLogger(ShowcaseController.class);

    @RequestMapping("/admin/main")
    public String adminmain() {
        return "adminmain";
    }

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

    @RequestMapping("/admin/form")
    public String writeform() {
        return "/admin/form";
    }

    @RequestMapping(value = "/admin/main/write", method = RequestMethod.POST)
    public String insert(MultipartHttpServletRequest request, ShowcaseModel showcaseModel) throws IOException {
        System.out.println(showcaseModel.toString());
        List<MultipartFile> files = request.getFiles("file");
        System.out.println("f:" + files);
        if (files.size() > 0) { //파일 업로드가 안비었으면
            String file_savname = "";
            for (int i = 0; i < files.size(); i++) {
                String savimagename = System.currentTimeMillis() + "_" + files.get(i).getOriginalFilename();
                FileCopyUtils.copy(files.get(i).getInputStream(), new FileOutputStream(uploadPath + "/" + savimagename));
            }
            if (files.size() > 0) {
                file_savname = System.currentTimeMillis() + "_" + files.get(0).getOriginalFilename() + ",";
                for (int i = 1; i < files.size(); i++) {
                    file_savname += files.get(i) + ",";
                }
                int index = file_savname.lastIndexOf(',');
                file_savname = file_savname.substring(0, index);
            }
            showcaseModel.setFile_savname(file_savname);
        }

        showcaseDAOService.insert(showcaseModel);

        logger.info("insert complete");
        return "/admin/main";
    }
    
    @InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

}
