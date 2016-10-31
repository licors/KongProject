package kong2.faq.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kong2.common.LoginCheckBeforeFunctionStart;
import kong2.common.PagingAction;
import kong2.faq.controller.FaqModel;
import kong2.validator.FaqValidator;

/*import com.mycom.util.Paging;
import com.mycom.validator.QnAValidator;
import com.mycom.validator.ReviewValidator;*/

@Controller
@RequestMapping("/faq")
public class FaqController {

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingAction page;
	private int num = 0;

	@Resource(name = "faqService")
	private FaqService faqService;

	

	@RequestMapping("/list")
	public String faqList(Model model) throws Exception {

		List<FaqModel> list=null;
		

		list = faqService.selectall();
		// 페이징
		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, "faq_list");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		list = list.subList(page.getStartCount(), lastCount);

		model.addAttribute("pagingHtml", pagingHtml);
		model.addAttribute("list", list);

		// 보여줄 tiles
		return "faq_list";

	}
	
	
	@LoginCheckBeforeFunctionStart
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String faqWriteForm(Model model)throws Exception{
		
/*		HttpSession session =request.getSession();
		System.out.println(session.getAttribute("session_member_num"));*/
		return "faq_form";
	}
	

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String faqWrite(Model model, FaqModel faqModel, BindingResult result)throws Exception{
		new FaqValidator().validate(faqModel, result);
		//유효성 검증
		//에러 있으면 폼으로
		if(result.hasErrors())
			return faqWriteForm(model);
       	    

		//에러 없으면 글 등록
		faqService.insert(faqModel);
		
		//리스트로이동
		return faqList(model);
	}
	
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String faqModifyForm(Model model,HttpServletRequest request)throws Exception{
		//글 번호 넣어줌 
		FaqModel faqModel =faqService.selectOne(Integer.parseInt(request.getParameter("faq_num")));
						
		//맵에 저장
		model.addAttribute("faqModel", faqModel);
		
		return "faq_m_form";
	}
	
	
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String faqModify(Model model,HttpServletRequest request,FaqModel faqModel_m,BindingResult result)throws Exception{
		new FaqValidator().validate(faqModel_m, result);
		//유효성 검증
		//에러 있으면 폼으로


		
		if(result.hasErrors())
			return "faq_m_form";

		
		

		faqModel_m.setContent(request.getParameter("content"));
		faqModel_m.setSubject(request.getParameter("subject"));
		faqModel_m.setfaq_num(Integer.parseInt(request.getParameter("faq_num")));
		faqService.update(faqModel_m);
		//리스트로
		return faqList(model);
	}
	
	
	@RequestMapping(value="/delete")
	public String faqDelete(Model model,HttpServletRequest request)throws Exception{
		faqService.delete(Integer.parseInt(request.getParameter("faq_num")));
		
		return faqList(model);
	}
	
	
	
	

}
