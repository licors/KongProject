package kong2.faq.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kong2.faq.controller.faqModel;



/*import com.mycom.util.Paging;
import com.mycom.validator.QnAValidator;
import com.mycom.validator.ReviewValidator;*/

@Controller
@RequestMapping("/faq")
public class faqController {

	private faqService faqService;
	
	@RequestMapping(value = "/list")
	public ModelAndView qnaList(HttpServletRequest request, faqModel faqModel) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView("qna_list");
		
		List<faqModel> list;
		
		list = faqService.faqList();
		mav.addObject("list", list);
		
		return mav;
}
}
