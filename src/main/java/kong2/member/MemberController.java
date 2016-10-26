package kong2.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Resource(name = "memberService")
	private MemberService memberService;

	private List<ZipcodeModel> zipcodeList = new ArrayList<ZipcodeModel>();

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String memberLogin(HttpServletRequest request, MemberModel mem, Model model) {

		MemberModel result = memberService.memberLogin(mem);

		if (result != null) {

			HttpSession session = request.getSession();

//			session.setAttribute("mem", result);
			session.setAttribute("session_member_id", result.getId_email());
			session.setAttribute("session_member_name", result.getName());
			session.setAttribute("session_member_num", result.getMember_num());

			model.addAttribute("mem");
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
		return "main";
	}
	
	@RequestMapping(value = "/memberPwFind", method = RequestMethod.GET)
	public String memberPwFindForm() {
		return "passwordFindForm";
	}

	@RequestMapping(value = "/memberPwFind", method = RequestMethod.POST)
	public String memberPwFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request, Model model) {

		int memberFindChk;

		String findPassword = memberService.passwordFind(member);

		if (findPassword == null) {
			memberFindChk = 0; 
			model.addAttribute("memberFindChk", memberFindChk);
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
	public String memberJoin(Model model) {
		model.addAttribute("member", new MemberModel());	
		return "joinForm";
	}
	
	@RequestMapping(value="/memberJoin", method = RequestMethod.POST)
	public String memberJoin(@ModelAttribute("member") MemberModel member, BindingResult result, Model model) {
		try {
			memberService.MemberAdd(member);
			return "redirect:"+"/main";
		} catch (DuplicateKeyException e) {
			result.reject("invalid", null);
			return "joinForm";
		}
	}
	@RequestMapping("/memberModify")
	public String memberModify(@ModelAttribute("member") MemberModel member, HttpSession session, Model model) {
		session.getAttribute("session_member_id");

		if (session.getAttribute("session_member_id") != null) {
			String id = (String) session.getAttribute("session_member_id");
			member = memberService.getMember(id);

			model.addAttribute("member", member);
			return "memberModify";
		} else {
			return "loginConfirm";
		}
	}

	@RequestMapping("/memberModifyEnd")
	public String memberModifyEnd(@ModelAttribute("member") MemberModel member, BindingResult result) {
		// Validation Binding
		/* new MemberValidator().validate(member, result); */

		try {
			memberService.memberModify(member);
			return "memberModifyEnd";
		} catch (DuplicateKeyException e) {
			result.reject("invalid", null);
			return "memberModify";
		}

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

	@RequestMapping("/memberDelete")
	public String memberDelete(@ModelAttribute("member") MemberModel member, 
				HttpSession session, HttpServletRequest request, Model model) {

		MemberModel memberModel; 

		String id;
		String password;
		password = request.getParameter("password");
		int deleteCheck;

		id = session.getAttribute("session_member_id").toString();
		memberModel = (MemberModel) memberService.getMember(id);

		if (memberModel.getPassword().equals(password)) {

			deleteCheck = 1;

			memberService.memberDelete(id);
			session.removeAttribute("session_member_id");
			session.removeAttribute("session_member_name");
			/* session.removeAttribute("session_member_no"); */
		} else {
			deleteCheck = -1; 
		}

		model.addAttribute("deleteCheck", deleteCheck);
		return "deleteResult";
	}

}
