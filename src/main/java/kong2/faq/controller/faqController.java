package kong2.faq.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import kong2.common.PagingAction;
import kong2.faq.controller.faqModel;



/*import com.mycom.util.Paging;
import com.mycom.validator.QnAValidator;
import com.mycom.validator.ReviewValidator;*/

@Controller
@RequestMapping("/faq")
public class faqController {
	
	  private int currentPage = 1; 
	    private int totalCount;
	    private int blockCount = 10;
	    private int blockPage = 3;
	    private String pagingHtml;
	    private PagingAction page;
	    private int num = 0;
	
	
	
	@Resource(name="faqService")
	private faqService faqService;
	
	private List<faqModel> list;
	

	@RequestMapping("/list")
	public String faqList(Model model) throws Exception{
		
		
		
		
		
		
		//페이징
		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, "faq_list");
        pagingHtml = page.getPagingHtml().toString();
        int lastCount = totalCount;
		
        if (page.getEndCount() < totalCount) {
            lastCount = page.getEndCount() + 1;
        }
        
        list = list.subList(page.getStartCount(), lastCount);
        
        model.addAttribute("pagingHtml",pagingHtml);
        model.addAttribute("list",list);
        
        //보여줄 tiles
		return "faq_list";
		
	}
	
	
	
	
}
