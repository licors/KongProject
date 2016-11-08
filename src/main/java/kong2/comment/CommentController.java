package kong2.comment;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kong2.common.LoginCheckBeforeFunctionStart;
import kong2.common.PagingAction;

@Controller
@RequestMapping("/main/view")
public class CommentController {
	
//	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingAction page;
	
	@Resource(name = "commentService")
	private CommentService commentService;
	
	@RequestMapping("/{showcase_num}/commentList/{current_num}")
	public String commentList(Model model, @PathVariable int showcase_num, @PathVariable int current_num) {
		
		List<CommentModel> list = null;
		list = commentService.selectAll(showcase_num);
		page = new PagingAction(current_num, totalCount, blockCount, blockPage, "{"+showcase_num+"}/commentList");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		list = list.subList(page.getStartCount(), lastCount);
		
		model.addAttribute("pagingHtml", pagingHtml);
		model.addAttribute("list", list);
		model.addAttribute("showcase_num", showcase_num);
		
		return "ti_commentList";
	}
	
//	@RequestMapping(value="/{showcase_num}/write", method=RequestMethod.GET)
//	public String commentWriteForm(Model model, @PathVariable int showcase_num)throws Exception{
//
//		model.addAttribute("showcase_num", showcase_num);
//		return "commentWriteform";
//	}
	
	@RequestMapping(value="/{showcase_num}/commentWrite", method=RequestMethod.POST)
	public String commentWrite(Model model, @PathVariable int showcase_num, CommentModel commentModel, BindingResult result)throws Exception{

		commentService.insert(commentModel);
		return "redirect:/"+showcase_num + "/commentList/1";
	}
	
	@RequestMapping(value="/{showcase_num}/commentModify", method=RequestMethod.GET)
	public String commentModifyForm(Model model, @PathVariable int showcase_num, HttpServletRequest request)throws Exception{
		
		CommentModel commentModel =commentService.selectOne(Integer.parseInt(request.getParameter("comment_num")));
		model.addAttribute("commentModel", commentModel);
		model.addAttribute("showcase_num", showcase_num);
		return "ti_commentModifyForm";
	}
	
	
	
	@RequestMapping(value="/{showcase_num}/commentModify", method=RequestMethod.POST)
	public String commentModify(Model model, @PathVariable int showcase_num, HttpServletRequest request,CommentModel commentModel,BindingResult result)throws Exception{
	
		commentService.update(commentModel);
		return "redirect:/"+showcase_num + "/commentList/1";
	}
	
	@LoginCheckBeforeFunctionStart
	@RequestMapping(value="/{showcase_num}/commentDelete")
	public String commentDelete(Model model, @PathVariable int showcase_num, HttpServletRequest request)throws Exception{
		commentService.delete(Integer.parseInt(request.getParameter("comment_num")));	
		return "redirect:/"+showcase_num + "/commentList/1";
	}
}
