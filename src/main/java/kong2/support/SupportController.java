package kong2.support;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import kong2.common.mail.mailModel;
import kong2.common.mail.mailService;
import kong2.member.MemberModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SupportController {

    @Autowired
    private SupportService supportService;
    @Autowired
    private mailService mailSender;

    Calendar today = Calendar.getInstance();

    private static final Logger logger = LoggerFactory.getLogger(SupportController.class);

    @RequestMapping("/support/list/{member_num}")
    public String supportmain(Model model, @PathVariable int member_num) {
        MemberModel member = (MemberModel) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (member.getMember_num() != member_num) {
            return "main";
        }
        SupportModel supportModel = new SupportModel();
        supportModel.setMember_num(member_num);
        List<SupportModel> list = supportService.selectmember(supportModel);

        model.addAttribute("list", list);
        return "supportlist";
    }

    @RequestMapping(value = "/support/write/{member_num}", method = RequestMethod.GET)
    public String supportwriteform(Model model, HttpServletRequest request, @PathVariable int member_num) {
        MemberModel member = (MemberModel) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (member.getMember_num() != member_num) {
            return "main";
        }
        model.addAttribute("member", member);
        return "supportwrite";
    }

    @RequestMapping(value = "/support/write/{member_num}", method = RequestMethod.POST)
    public String supportwrite(Model model, SupportModel supportModel, BindingResult result, @PathVariable int member_num) throws IOException {
        MemberModel member = (MemberModel) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (member.getMember_num() != member_num) {
            return "main";
        }
        logger.info(supportModel.toString());
        supportModel.setReg_date(today.getTime());
        supportService.insert(supportModel);
        logger.info("insert complete");
        mailModel mailmodel = new mailModel();
        mailmodel.setEmailFrom("server@nyang.kr");
        mailmodel.setEmailTo(supportModel.getEmail());
        mailmodel.setSubject("문의 주신 내용이 접수되었습니다. (문의번호: #" + supportModel.getSupport_num() + ")");
        mailmodel.setSupport_num(supportModel.getSupport_num());
        if (mailSender.send(mailmodel)) {
            logger.info("mailsend complete");
        } else {
            logger.info("mailsend fall !");
        }
        return "redirect:/support/list/" + member_num;
    }

    @RequestMapping("/support/view/{support_num}")
    public String supportview(Model model, @PathVariable int support_num) {
        SupportModel supportModel = new SupportModel();
        supportModel.setSupport_num(support_num);
        SupportModel view = supportService.selectone(supportModel);

        model.addAttribute("view", view);
        return "supportview";
    }

    /**
     * 어드민 구간
     */
    @RequestMapping("/admin/support/list")
    public String adminsupportmain(Model model) {
        List<SupportModel> list = supportService.selectall();

        model.addAttribute("list", list);
        return "adminsupportlist";
    }

    //원본글의 support_num 을 전송받음
    @RequestMapping(value = "/admin/support/write/{support_num}", method = RequestMethod.GET)
    public String adminsupportwriteform(Model model, HttpServletRequest request, @PathVariable int support_num) {
        model.addAttribute("support_num", support_num);
        return "adminsupportwrite";
    }

    //원본글의 support_num 을 전송받음
    @RequestMapping(value = "/admin/support/write/{support_num}", method = RequestMethod.POST)
    public String adminsupportwrite(Model model, SupportModel supportModel, BindingResult result, @PathVariable int support_num) throws IOException {
        logger.info(supportModel.toString());
        SupportModel supportModel2 = new SupportModel();
        if (supportModel.getRef() == 0) {
            supportModel2.setRe_step(0);
            supportModel2.setRe_level(0);
        } else {
            SupportModel supportModel3 = new SupportModel();
            supportModel3.setRef(supportModel.getRef());
            supportModel3.setRe_step(supportModel.getRe_step());
            supportService.updateReplyStep(supportModel3);

            supportModel2.setRe_step(supportModel.getRe_step() + 1);
            supportModel2.setRe_level(supportModel.getRe_level() + 1);
            supportModel2.setRef(supportModel.getRef());
        }
        supportModel2.setReg_date(today.getTime());
        logger.info("insert complete");

        mailModel mailmodel = new mailModel();
        mailmodel.setEmailFrom("server@nyang.kr");
        mailmodel.setEmailTo(supportModel.getEmail());
        mailmodel.setSubject("문의의 상태가 “답변완료”로 변경되었습니다. (문의번호: " + support_num + ")");
        mailmodel.setSupport_num(supportModel.getSupport_num());
        if (mailSender.send(mailmodel)) {
            logger.info("mailsend complete");
        } else {
            logger.info("mailsend fall !");
        }
        return "redirect:/admin/support/list";
    }
}
