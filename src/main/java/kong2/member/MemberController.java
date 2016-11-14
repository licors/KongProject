package kong2.member;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kong2.validator.MemberValidator;

@Controller
@RequestMapping("/member")
public class MemberController {
	Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
//	@Autowired
//	private PasswordEncoder passwordEncoder;

	@RequestMapping("/login")
	public String loginForm(Model model) {
//		model.addAttribute("member", new MemberModel());
		// Sha 암호값을 보기 위한 테스트용.
//        String guest_password = passwordEncoder.encodePassword("guest", null);
//        String admin_password = passwordEncoder.encodePassword("admin", null);
//
//        logger.info(guest_password + "//" + admin_password);
		return "/member/memberLoginForm";
	}

	@RequestMapping(value="/denied", method=RequestMethod.GET)
	public String denied() {
		return "/member/denied";
	}
	
	@RequestMapping(value = "/memberPwFind", method = RequestMethod.GET)
	public String memberPwFindForm(@ModelAttribute("member") MemberModel member, Model model) {
		model.addAttribute("member", member);	
		return "/member/passwordfindForm";
	}

	@RequestMapping(value = "/memberPwFind", method = RequestMethod.POST)
	public String memberPwFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request, Model model) {
		
		String findPassword = memberService.passwordFind(member);

		if (findPassword == null) {
			return "member/pwFindError";

		} else {

			if (findPassword.equals(member.getId_email())) {
				model.addAttribute("password", findPassword);
				return "member/pwFindOk";
			} else {
				return "member/pwFindError";
			}
		}
	}

	@RequestMapping(value="/memberJoin", method = RequestMethod.GET)
	public String memberJoin(@ModelAttribute("member") MemberModel member, Model model) {
		model.addAttribute("member", member);	
		return "ti_joinForm";
	}
	
	@RequestMapping(value="/memberJoin", method = RequestMethod.POST)
	public String memberJoin(@Valid @ModelAttribute("member") MemberModel member, BindingResult result, Model model,
								BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "ti_joinForm";
		}

  		String id_email = memberService.idCheck(member.getId_email());
  		if(id_email == null) {
  			memberService.MemberAdd(member);
			return "redirect:/main";
  		} else {
  			//validator error(아이디 중복)
  			return "redirect:/member/memberJoin";
  		}

	}
	
	@RequestMapping("/memberModifyForm")
	public String memberModifyForm(@ModelAttribute("member") MemberModel member, HttpSession session, Model model) {
	
		if (session.getAttribute("session_member_id") != null) {
			String id = (String) session.getAttribute("session_member_id");
			member = memberService.getMember(id);

			model.addAttribute("member", member);
			return "ti_memberModify";
		} else {
			return "ti_loginForm";
		}
	}

	@RequestMapping("/memberModify")
	public String memberModify(@Valid @ModelAttribute("member") MemberModel member, BindingResult bindingResult) {

		if(bindingResult.hasErrors()) {
			return "ti_memberModify";
		}
		System.out.println("memberModify : " + member);
		memberService.memberModify(member);
		return "redirect:/main";
	}

	@RequestMapping(value="/memberDeleteForm", method=RequestMethod.GET)
	public String memberDeleteForm(@ModelAttribute("member") MemberModel member, Model model) {
		model.addAttribute("member", member);
		return "ti_memberPasswordCheck";
	}
	
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public String memberDelete(@ModelAttribute("member") MemberModel member, HttpSession session, Model model) {

		String id = session.getAttribute("session_member_id").toString();
		MemberModel result = memberService.getMember(id);
		
		if(result.getPassword().equals(member.getPassword()) && result.getName().equals(member.getName())) {
			memberService.memberDelete(id);
			session.removeAttribute("session_member_id");
			session.removeAttribute("session_member_name");
			session.removeAttribute("session_member_num");
			return "/member/memberDeleteSuccess";
		} else {
			return "/member/memberDeleteError"; //비밀번호 다름
		}
	}
	
	@RequestMapping("/admin/list")
	public String memberAdminList(Model model) {
		ArrayList<MemberModel> list = memberService.memberList();
		model.addAttribute("list", list);
		return "ti_admin_memberList";
	}
	
	@RequestMapping("/admin/modifyForm/{id_email}")
	public String memberAdminModifyForm(@PathVariable String id_email, Model model) {

		MemberModel result = memberService.getMember(id_email);
		model.addAttribute("member", result);
		return "ti_admin_memberModify";
	}
	
	@RequestMapping("/admin/memberModify")
	public String memberAdminModify(@Valid @ModelAttribute("member") MemberModel member, BindingResult bindingResult) {
		// Validation Binding
		/* new MemberValidator().validate(member, result); */
		if(bindingResult.hasErrors()) {
			return "ti_admin_memberModify";
		}
		System.out.println("memberModify : " + member);
		memberService.memberModify(member);
		return "redirect:/member/admin/list";
	}
	
	@RequestMapping(value="admin/delete/{id_email}")
	public String memberAdminDelete(@PathVariable String id_email, Model model) {

		logger.info("delete member");
		memberService.memberDelete(id_email);
		return "redirect:/member/admin/list";
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new MemberValidator());
	}

	@RequestMapping("/loginFail")
	public String loginFail(HttpSession session) {
		return "member/loginFail";
	}
	
	@RequestMapping(value = "/login_duplicate", method = RequestMethod.GET)
	public void login_duplicate() {		
		logger.info("Welcome login_duplicate!");
	}
}
