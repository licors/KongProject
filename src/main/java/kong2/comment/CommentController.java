package kong2.comment;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kong2.common.LoginCheckBeforeFunctionStart;
import kong2.common.PagingAction;
import kong2.member.MemberModel;

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
	
//	@RequestMapping("/{showcase_num}/commentList/{current_num}")
//	public void commentList(Model model, @PathVariable int showcase_num, @PathVariable int current_num) {
	public void commentList(Model model, int showcase_num, int current_num) {
		
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
		
//		return "redirect:/main/view/" + showcase_num +"?commentCheck=true";
	}
	
//	@RequestMapping(value="/{showcase_num}/write", method=RequestMethod.GET)
//	public String commentWriteForm(Model model, @PathVariable int showcase_num)throws Exception{
//
//		model.addAttribute("showcase_num", showcase_num);
//		return "commentWriteform";
//	}
	
	@RequestMapping(value="/{showcase_num}/commentWrite", method=RequestMethod.POST)
	public String commentWrite(Model model, @PathVariable int showcase_num, CommentModel commentModel, BindingResult result)throws Exception{
		
		MemberModel member = (MemberModel) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    commentModel.setMember_num(member.getMember_num());
	    commentModel.setReg_date(new Date(System.currentTimeMillis()));
		commentService.insert(commentModel);
		return "redirect:/main/view/"+showcase_num+"?commentCheck=true";
	}
	
//	@RequestMapping(value="/{showcase_num}/commentModify", method=RequestMethod.GET)
//	public String commentModifyForm(Model model, @PathVariable int showcase_num, HttpServletRequest request)throws Exception{
//		
//		CommentModel commentModel =commentService.selectOne(Integer.parseInt(request.getParameter("comment_num")));
//		model.addAttribute("commentModel", commentModel);
//		model.addAttribute("showcase_num", showcase_num);
//		return "ti_commentModifyForm";
//	}
	
	
	
	@RequestMapping(value="/{showcase_num}/commentModify/{comment_num}/{content}")
	public String commentModify(Model model, @PathVariable int showcase_num, @PathVariable int comment_num, @PathVariable String content, 
			HttpServletRequest request,CommentModel commentModel,BindingResult result)throws Exception{
		commentModel.setComment_num(comment_num);
		commentModel.setContent(content);
		
		commentService.update(commentModel);
		return "redirect:/main/view/"+showcase_num+"?commentCheck=true";
	}
	
	
	@RequestMapping(value="/{showcase_num}/commentDelete/{comment_num}")
	public String commentDelete(Model model, @PathVariable int showcase_num, @PathVariable int comment_num, HttpServletRequest request)throws Exception{
		commentService.delete(comment_num);	
		return "redirect:/main/view/"+showcase_num+"?commentCheck=true";
	}
}
