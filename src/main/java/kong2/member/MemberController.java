package kong2.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.logging.impl.Log4JLogger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kong2.validator.MemberValidator;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Resource(name = "memberService")
	private MemberService memberService;

	private List<ZipcodeModel> zipcodeList = new ArrayList<ZipcodeModel>();

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(Model model) {
		model.addAttribute("member", new MemberModel());	
		return "ti_loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String memberLogin(HttpServletRequest request,@ModelAttribute("member") MemberModel member, Model model) {

		MemberModel result = memberService.memberLogin(member);
		HttpSession session = request.getSession();
		if (result != null) {

			session.setAttribute("session_member_id", result.getId_email());
			session.setAttribute("session_member_name", result.getName());
			session.setAttribute("session_member_num", result.getMember_num());

			if(result.getAdmin() > 0) {
				return "/admin/adminPage";
			}
			
			String uri = (String) session.getAttribute("uri");
			if(uri != null) {
				session.setAttribute("uri", null);
				System.out.println("login aop uri : " + uri);
				return "redirect:"+uri;
			}
			
			
			return "member/loginSuccess";
		}
		return "member/loginError";
	}

	@RequestMapping("/logout")
	public String memberLogout(HttpServletRequest request, MemberModel mem) {

		HttpSession session = request.getSession(false);

		if (session != null) {
			session.invalidate();
		}

		return "redirect:/main";
	}
	
	@RequestMapping(value = "/memberPwFind", method = RequestMethod.GET)
	public String memberPwFindForm(Model model) {
		model.addAttribute("member", new MemberModel());
		return "ti_passwordFindForm";
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
	public String memberModify(@ModelAttribute("member") MemberModel member, HttpSession session, Model model) {
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
		// Validation Binding
		/* new MemberValidator().validate(member, result); */
		if(bindingResult.hasErrors()) {
			return "ti_memberModify";
		}
		System.out.println("memberModify : " + member);
		memberService.memberModify(member);
		return "redirect:/main";
	}

	@RequestMapping(value = "/zipcodeCheckForm")
	public String zipcodeCheckForm(HttpServletRequest req) throws Exception {
		return "check/zipcodeCheck";
	}

//	@RequestMapping(value = "/zipcodeCheck")
//	public String zipcodeCheck(@ModelAttribute ZipcodeModel zipcodeModel, Model model)
//			throws Exception {
//		int chk = 100;
//
//		zipcodeList = memberService.zipcodeCheck(zipcodeModel);
//		model.addAttribute("zipcode", zipcodeList);
//
//		if (zipcodeList.size() == 0) {
//			chk = 0;
//		} else {
//			chk = 1;
//		}
//		model.addAttribute("chk", chk);
//		return "check/zipcodeCheck";
//	}

	@RequestMapping(value="/memberDeleteForm", method=RequestMethod.GET)
	public String memberDeleteForm(@ModelAttribute("member") MemberModel member, Model model) {
		model.addAttribute("member", member);
		return "ti_memberPasswordCheck";
	}
	
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public String memberDelete(@ModelAttribute("member") MemberModel member, HttpSession session, Model model) {

		String id = session.getAttribute("session_member_id").toString();
		MemberModel result = (MemberModel) memberService.getMember(id);
		
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
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new MemberValidator());
	}

}
