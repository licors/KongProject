package kong2.showcase;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.rmi.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import javax.servlet.http.HttpServletRequest;
import kong2.common.path;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ShowcaseController {

    @Autowired
    private ShowcaseService showcaseService;

    String uploadPath = path.path().p() + "../../../../resources/upload";
    //path:/C:/Users/user2/Documents/khproject/target/Kong2-1.0.0-BUILD-SNAPSHOT/WEB-INF/classes/kong2/common/
    //resources

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

    @RequestMapping(value = "/admin/main/write", method = RequestMethod.GET)
    public String writeform() {
        System.out.println("path:" + uploadPath);
        return "/admin/main/form";
    }

    @RequestMapping(value = "/admin/main/write", method = RequestMethod.POST)
    public String insert(/*MultipartHttpServletRequest request,*/ShowcaseModel showcaseModel) throws IOException {
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
            File dir = new File(uploadPath);
            if (!dir.isDirectory()) {
                dir.mkdirs();
            }
            /**
             * 업로드 된 파일을 처리하는 부분
             */
            String savimagename = "";
            String exc = next.getOriginalFilename().substring(next.getOriginalFilename().lastIndexOf(".") + 1, next.getOriginalFilename().length());
            try {
                savimagename = new Random().nextInt(99999999) + "_" + next.getOriginalFilename().substring(0, 7) + "." + exc;
            } catch (StringIndexOutOfBoundsException ex) {
                savimagename = new Random().nextInt(99999999) + "_" + new Random().nextInt(9999999) + "." + exc;
            }
            File destFile = new File(uploadPath + "/" + savimagename);
            System.out.println("file:" + destFile.toString());
            next.transferTo(destFile);
            /**
             * 업로드된 파일의 이름을 처리하여 db에 넣기위한 부분 ,넣기가 주된 처리
             */
            file_savname += savimagename + ",";
            if (i == 4) {
                int index = file_savname.lastIndexOf(',');
                file_savname = file_savname.substring(0, index);
            }
            /**
             * 처리된 이름을 객체에 넣는부분
             */
            showcaseModel.setFile_savname(file_savname);
        }
        showcaseService.insert(showcaseModel);
        logger.info("insert complete");
        return "/main/main";
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
