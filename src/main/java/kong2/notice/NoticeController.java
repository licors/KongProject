package kong2.notice;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kong2.common.PagingAction;
import kong2.notice.NoticeModel;
import kong2.notice.NoticeService;
import kong2.validator.NoticeValidator;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingAction page;
	private int num = 0;

	@Resource(name = "noticeService")
	private NoticeService noticeService;

	

	@RequestMapping("/list")
	public String noticeList(Model model) throws Exception {

		List<NoticeModel> list=null;
		

		list = noticeService.selectall();
		// 페이징
		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, "notice_list");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		list = list.subList(page.getStartCount(), lastCount);

		model.addAttribute("pagingHtml", pagingHtml);
		model.addAttribute("list", list);

		// 보여줄 tiles
		return "notice_list";

	}
	
	
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String noticeWriteForm(Model model)throws Exception{
		return "notice_form";
	}
	

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String noticeWrite(Model model, NoticeModel noticeModel, BindingResult result)throws Exception{
		new NoticeValidator().validate(noticeModel, result);
		//유효성 검증
		//에러 있으면 폼으로
		if(result.hasErrors())
			return noticeWriteForm(model);
       	    

		//에러 없으면 글 등록
		noticeService.insert(noticeModel);
		
		//리스트로이동
		return noticeList(model);
	}
	
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String noticeModifyForm(Model model,HttpServletRequest request)throws Exception{
		//글 번호 넣어줌 
		NoticeModel noticeModel =noticeService.selectOne(Integer.parseInt(request.getParameter("notice_num")));
						
		//맵에 저장
		model.addAttribute("noticeModel", noticeModel);
		
		return "notice_m_form";
	}
	
	
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String noticeModify(Model model,HttpServletRequest request,NoticeModel noticeModel_m,BindingResult result)throws Exception{
		new NoticeValidator().validate(noticeModel_m, result);
		//유효성 검증
		//에러 있으면 폼으로


		
		if(result.hasErrors())
			return "notice_m_form";

		
		

		noticeModel_m.setContent(request.getParameter("content"));
		noticeModel_m.setSubject(request.getParameter("subject"));
		noticeModel_m.setNotice_num(Integer.parseInt(request.getParameter("notice_num")));
		noticeService.update(noticeModel_m);
		//리스트로
		return noticeList(model);
	}
	
	
	@RequestMapping(value="/delete")
	public String noticeDelete(Model model,HttpServletRequest request)throws Exception{
		noticeService.delete(Integer.parseInt(request.getParameter("notice_num")));
		
		return noticeList(model);
	}
	
	
	
	

}



