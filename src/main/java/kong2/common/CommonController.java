package kong2.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class CommonController {

	@RequestMapping("/loginCheck")
	public String loginCheck(Model model, HttpServletRequest request) throws Exception {
		return "/common/loginCheck";
	}
	
	
	@RequestMapping("/adminCheck")
	public String adminCheck(Model model, HttpServletRequest request) throws Exception {
		return "/common/adminCheck";
	}
	
}
