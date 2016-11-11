package kong2.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	/*@RequestMapping(value = "/check", method = RequestMethod.POST)
	 public void check(HttpServletRequest request, HttpServletResponse resp) throws Exception {
	 
	 String name = request.getParameter("name");
	 
	 JSONObject obj = new JSONObject();
	 JSONArray ja = new JSONArray();
	 
	 ja.add(name);
	 
	 PrintWriter out = resp.getWriter();
	 out.print(ja.toString());
	 
	 }*/


	
}
