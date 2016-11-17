package kong2.showcase;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kong2.comment.CommentController;
import kong2.comment.CommentModel;
import kong2.comment.CommentService;
import kong2.common.PagingActionRequestParam;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ShowcaseController {

    @Resource(name = "showcaseService")
    private ShowcaseService showcaseService;

    @Resource(name = "commentService")
    private CommentService commentService;
    
    @Autowired
    private CommentController commentController;

    private String uploadPath = path.path().p() + "../../../../resources/upload"; //이클립스 기준 업로드
    public static String imgPath = "/resources/upload/";

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
        model.addAttribute("img", imgPath);
        return "main";
    }

    @RequestMapping("/main/{showcase_category}")
    public String list(Model model, @PathVariable String showcase_category) throws Exception {
        ShowcaseModel category = new ShowcaseModel();
        String chk_category = category_chk(showcase_category); //영어를 한글로
        category.setShowcase_category(chk_category);
        List<ShowcaseModel> list = showcaseService.selectcategory(category);
        model.addAttribute("list", list);
        model.addAttribute("category", chk_category);
        model.addAttribute("img", imgPath);
        return "mainlist";
    }

    @RequestMapping("/admin/main/list")
    public String adminlist(Model model) throws Exception {
        List<ShowcaseModel> list = showcaseService.selectall();
        model.addAttribute("list", list);
        return "adminmainlist";
    }

    @RequestMapping("/main/view/{showcase_num}")
    public String view(Model model, @PathVariable int showcase_num, @RequestParam(required = false, value = "commentCheck", defaultValue = "false") String commentCheck,
            @RequestParam(required = false, value = "currentPage", defaultValue = "1") String currentPage, HttpServletRequest request) {
//    		@PathVariable(required=false, value="current_num") String current_num, HttpServletRequest request) {
        ShowcaseModel view = new ShowcaseModel();
        view.setShowcase_num(showcase_num);
        ShowcaseModel aticle = showcaseService.selectone(view);
        showcaseService.readcountup(view); //조회수
        model.addAttribute("view", aticle);
        model.addAttribute("img", imgPath);

        /*댓글*/
        model.addAttribute("commentCheck", commentCheck);
        commentController.commentList(model, showcase_num, currentPage);

        return "mainview";
    }

    @RequestMapping("/admin/main/view/{showcase_num}")
    public String adminview(Model model, @PathVariable int showcase_num) {
        ShowcaseModel view = new ShowcaseModel();
        view.setShowcase_num(showcase_num);
        ShowcaseModel aticle = showcaseService.selectone(view);
        model.addAttribute("view", aticle);
        model.addAttribute("img", imgPath);
        return "adminmainview";
    }

    @RequestMapping(value = "/admin/main/write", method = RequestMethod.GET)
    public String adminwriteform(Model model, HttpServletRequest request) {
//        model.addAttribute("showcaseModel", new ShowcaseModel());
        return "adminmainwrite";
    }

    @RequestMapping(value = "/admin/main/write", method = RequestMethod.POST)
    public String adminwrite(Model model, /*MultipartHttpServletRequest request,*/ ShowcaseModel showcaseModel, BindingResult result) throws IOException {
        new ShowcaseValidator().validate(showcaseModel, result);

        if (result.hasErrors()) {
            return "adminmainwrite";
        }
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

            file_savname += savimagename + ",";
        }
        showcaseModel.setFile_savname(file_savname);

        showcaseService.insert(showcaseModel);
        logger.info("insert complete");
        return "redirect:/admin/main/list";
    }

    @RequestMapping("/admin/main/delete/{showcase_num}")
    public String admindelete(Model model, @PathVariable int showcase_num) {
        ShowcaseModel view = new ShowcaseModel();
        view.setShowcase_num(showcase_num);
        view.setShow_status(-1);
        showcaseService.delete(view);
        logger.info("delete complete:" + showcase_num);
        return "redirect:/admin/main/list";
    }

    @RequestMapping(value = "/admin/main/modify/{showcase_num}", method = RequestMethod.GET)
    public String adminmodifyform(Model model, @PathVariable int showcase_num) {
        ShowcaseModel view = new ShowcaseModel();
        view.setShowcase_num(showcase_num);
        ShowcaseModel aticle = showcaseService.selectone(view);
        model.addAttribute("view", aticle);
        return "adminmodify";
    }

    @RequestMapping(value = "/admin/main/modify/{showcase_num}", method = RequestMethod.POST)
    public String adminmodify(Model model, @PathVariable int showcase_num, ShowcaseModel showcaseModel, BindingResult result) throws IOException {
        new ShowcaseValidator().validate(showcaseModel, result);

        if (result.hasErrors()) {
            return adminwriteform(model, null);
        }
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

            file_savname += savimagename + ",";
        }
        showcaseModel.setFile_savname(file_savname);
        showcaseModel.setShowcase_num(showcase_num);

        showcaseService.update(showcaseModel);
        logger.info("modify complete");
        return "redirect:/admin/main/list";
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
