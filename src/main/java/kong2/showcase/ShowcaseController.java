package kong2.showcase;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import kong2.common.LoginCheckBeforeFunctionStart;
import kong2.common.path;
import kong2.validator.ShowcaseValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ShowcaseController {

    @Autowired
    private ShowcaseService showcaseService;

    private String uploadPath = path.path().p() + "../../../../resources/upload"; //이클립스 기준 업로드
    private String imgPath = "/resources/upload/";

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
        List<ShowcaseModel> aticle = showcaseService.selectmain(aticleModel);

        ShowcaseModel artModel = new ShowcaseModel(); //미술
        artModel.setShowcase_category("미술");
        List<ShowcaseModel> art = showcaseService.selectmain(artModel);

        ShowcaseModel eventModel = new ShowcaseModel(); //이벤트
        eventModel.setShowcase_category("이벤트");
        List<ShowcaseModel> event = showcaseService.selectmain(eventModel);

        model.addAttribute("aticle", aticle);
        model.addAttribute("art", art);
        model.addAttribute("event", event);
        return "/main/main";
    }

    @RequestMapping("/main/{showcase_category}")
    public String list(Model model, @PathVariable String showcase_category) throws Exception {
        ShowcaseModel category = new ShowcaseModel();
        category.setShowcase_category(category_chk(showcase_category));
        List<ShowcaseModel> list = showcaseService.selectcategory(category);
        model.addAttribute("list", list);
        return "/main/list";
    }

//    @LoginCheckBeforeFunctionStart
    @RequestMapping("/main/view/{showcase_num}")
    public String view(Model model, @PathVariable int showcase_num) {
        ShowcaseModel view = new ShowcaseModel();
        view.setShowcase_num(showcase_num);
        ShowcaseModel aticle = showcaseService.selectone(view);
        model.addAttribute("view", aticle);
        model.addAttribute("img", imgPath);
        return "/main/view";
    }

    @RequestMapping(value = "/admin/main/write", method = RequestMethod.GET)
    public String writeform(Model model, HttpServletRequest request) {
        return "/admin/main/form";
    }

    @RequestMapping(value = "/admin/main/write", method = RequestMethod.POST)
    public String insert(Model model, /*MultipartHttpServletRequest request,*/ ShowcaseModel showcaseModel, BindingResult result) throws IOException {
        logger.info(showcaseModel.toString());
        Iterator<MultipartFile> file = showcaseModel.getUpload_file().iterator();
        String file_savname = "";
        int i = 0;
        while (file.hasNext()) {
            i++;
            /**
             * 파일의 이름이 "" 공백이 아닌지 체크 공백일경우 패스하면서 파일이름에, 찍음
             */
            MultipartFile next = file.next();
            String originalFileName = next.getOriginalFilename();
            if (originalFileName == null || originalFileName.equals("")) {
                file_savname += ",";
                continue;
            }
            chk_IDE(); //ide를 구분해서 uploadPath 를 자동으로 바꿈
            File dir = new File(uploadPath);
            if (!dir.isDirectory()) {
                dir.mkdirs();
            }
            /**
             * 업로드 된 파일을 처리하는 부분
             */
            String savimagename = "";
            String filename = next.getOriginalFilename();
            String exc = filename.substring(filename.lastIndexOf(".") + 1, filename.length());
            try {
                savimagename = new Random().nextInt(99999999) + "_" + filename.substring(filename.lastIndexOf(".") - 7, filename.lastIndexOf(".")) + "." + exc;
            } catch (StringIndexOutOfBoundsException ex) {
                savimagename = new Random().nextInt(99999999) + "_" + new Random().nextInt(9999999) + "." + exc;
            }
            File destFile = new File(uploadPath + "/" + savimagename);
            next.transferTo(destFile);
            /**
             * 업로드된 파일의 이름을 처리하여 db에 넣기위한 부분 ,넣기가 주된 처리
             */
            file_savname += savimagename + ",";
            if (i == 4) {
                int index = file_savname.lastIndexOf(',');
                file_savname = file_savname.substring(0, index);
                showcaseModel.setFile_savname(file_savname);
            }
            /**
             * 처리된 이름을 객체에 넣는부분
             */
        }
        new ShowcaseValidator().validate(showcaseModel, result);

        if (result.hasErrors()) {
            return writeform(model, null);
        }

        showcaseService.insert(showcaseModel);
        logger.info("insert complete");
        return "redirect:/main";
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

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    protected void chk_IDE() {
        try {
            /**
             * C:/workspace/.metadata/.plugins/org.eclipse.wst.server.core 검색
             * 없으면 넷빈경로를 사용
             */
            String chkdir = new File(path.path().p() + "../../../../../../../").getCanonicalPath();
            if (!chkdir.substring(chkdir.lastIndexOf('\\') + 1, chkdir.length()).equals("org.eclipse.wst.server.core")) {
                uploadPath = path.path().p() + "../../../../../../src/main/webapp/resources/upload"; //넷빈 기준 업로드
//    String uploadPath = path.path().p() + "../../../../../../src/main/webapp/resources/upload"; //넷빈 기준 업로드
//    C:/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/Kong2/WEB-INF/classes/kong2/common/
//    C:/Users/user2/Documents/khproject/target/Kong2-1.0.0-BUILD-SNAPSHOT/WEB-INF/classes/kong2/common/
            } else {
            }
        } catch (IOException ex) {
        }
    }
}
