package kong2.comment;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import kong2.common.PagingActionRequestParam;
import kong2.member.MemberModel;

@Controller
@RequestMapping("/main/view")
public class CommentController {

	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingAction page;
	
	@Resource(name = "commentService")
	private CommentService commentService;
	
//	@RequestMapping("/{showcase_num}/commentList/{current_num}")
//	public void commentList(Model model, @PathVariable int showcase_num, @PathVariable int current_num) {
	public void commentList(Model model, int showcase_num, String currentPage) {
		
		List<CommentModel> list = null;
        list = commentService.selectAll(showcase_num);
        int totalCount = list.size();
        PagingActionRequestParam.PagingAction(Integer.parseInt(currentPage), totalCount, 10, 3, "/main/view/" + showcase_num + "?commentCheck=true");
        String pagingHtml = PagingActionRequestParam.getPagingHtml().toString();
        int lastCount = totalCount;

        if (PagingActionRequestParam.getEndCount() < totalCount) {
            lastCount = PagingActionRequestParam.getEndCount() + 1;
        }

        list = list.subList(PagingActionRequestParam.getStartCount(), lastCount);

        model.addAttribute("pagingHtml", pagingHtml);
        model.addAttribute("list", list);
        model.addAttribute("showcase_num", showcase_num);
	}
	
	@RequestMapping(value="/{showcase_num}/commentWrite", method=RequestMethod.POST)
	public String commentWrite(Model model, @PathVariable int showcase_num, CommentModel commentModel, BindingResult result)throws Exception{
		
		MemberModel member = (MemberModel) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    commentModel.setMember_num(member.getMember_num());
	    commentModel.setReg_date(new Date(System.currentTimeMillis()));
		commentService.insert(commentModel);
		return "redirect:/main/view/"+showcase_num+"?commentCheck=true";
	}
	
	
	@RequestMapping(value="/{showcase_num}/commentModify/{comment_num}")
	public String commentModify(Model model, @PathVariable int showcase_num, @PathVariable int comment_num,
			HttpServletRequest request,CommentModel commentModel,BindingResult result)throws Exception{
		commentModel.setComment_num(comment_num);
		
		commentService.update(commentModel);
		return "redirect:/main/view/"+showcase_num+"?commentCheck=true";
	}
	
	
	@RequestMapping(value="/{showcase_num}/commentDelete/{comment_num}")
	public String commentDelete(Model model, @PathVariable int showcase_num, @PathVariable int comment_num, HttpServletRequest request)throws Exception{
		commentService.delete(comment_num);	
		return "redirect:/main/view/"+showcase_num+"?commentCheck=true";
	}
}
