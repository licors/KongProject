package kong2.support;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import kong2.common.mail.mailService;
import kong2.common.memberBeforeFunctionStart;
import kong2.member.MemberModel;
import kong2.member.MemberService;
import kong2.showcase.ShowcaseModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Resource(name = "memberService")
    private MemberService memberService;
    @Autowired
    private mailService mailSender;

    private static final Logger logger = LoggerFactory.getLogger(SupportController.class);

    @memberBeforeFunctionStart
    @RequestMapping("/support/list/{member_num}")
    public String supportmain(Model model, @PathVariable int member_num, HttpSession session) {
//        String session_member_id = (String) session.getAttribute("session_member_id");
//        MemberModel member = memberService.getMember(session_member_id);
//        if (!session_member_id.equals(member.getId_email())) {
//            return "main";
//        }
        SupportModel supportModel = new SupportModel();
        supportModel.setMember_num(member_num);
        List<SupportModel> list = supportService.selectmember(supportModel);

        model.addAttribute("list", list);
        return "supportlist";
    }

    @memberBeforeFunctionStart
    @RequestMapping(value = "/support/write/", method = RequestMethod.GET)
    public String supportwriteform(Model model, HttpServletRequest request, HttpSession session) {
//        String session_member_id = (String) session.getAttribute("session_member_id");
//        MemberModel member = memberService.getMember(session_member_id);
//        if (!session_member_id.equals(member.getId_email())) {
//            return "main";
//        }
//        model.addAttribute("member", member);
        return "supportwrite";
    }

    @memberBeforeFunctionStart
    @RequestMapping(value = "/support/write/", method = RequestMethod.POST)
    public String supportwrite(Model model, SupportModel supportModel, BindingResult result) throws IOException {
        logger.info(supportModel.toString());
        return "redirect:/main";
    }
}
