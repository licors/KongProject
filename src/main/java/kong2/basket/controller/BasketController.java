package kong2.basket.controller;


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
import kong2.faq.controller.FaqService;
import kong2.order.OrderModel;

@Controller
@RequestMapping("/basket")
public class BasketController {
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingAction page;
	private int num = 0;
	
	
	@Resource(name = "basketService")
	private BasketService basketService;
	
	@LoginCheckBeforeFunctionStart
	@RequestMapping("/list")
	public String basketList(Model model,HttpServletRequest request) throws Exception {

		List<BasketModel> list=null;
		OrderModel orderModel = new OrderModel();

		/*세션로 넘겨 받아야함*/
		
		HttpSession session = request.getSession();
		//int member_num =(Integer) session.getAttribute("session_member_num");
		
		//테스트용으로 관리자 계정을 넣음 멤버 번호 999
		list = basketService.BasketList(999);   
		// 페이징
		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, "basketList");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		

		//페이지에 맞게끔 
		list = list.subList(page.getStartCount(), lastCount);
		
		
		//합계 금액
		int total_price=0;
		for(int i=0;i<list.size();i++)
		{
			total_price+=list.get(i).getPrice();
		}
		
		
		model.addAttribute("total_price",total_price);
		model.addAttribute("pagingHtml", pagingHtml);
		model.addAttribute("list", list);
		model.addAttribute("orderModel", orderModel);

		// 보여줄 tiles
		return "basketList";

	}
	
	
	@LoginCheckBeforeFunctionStart
	@RequestMapping("/add")
	public String basketAdd(Model model,HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		int member_num =(Integer) session.getAttribute("session_member_num");
		int showboard_num = (Integer) session.getAttribute("showcase_num");
		
		BasketModel basketModel= new BasketModel();
		basketModel.setMember_num(member_num);
		basketModel.setShowcase_num(showboard_num);
		
		basketModel=basketService.basket_check(basketModel);
		
		
		
		if(basketModel!=null){
			return "/basket/basketCheck";
		}else{
			basketService.basketInsert(basketModel);
			return "/basket/addBasket";
		}					
		
	}
	
	
	@LoginCheckBeforeFunctionStart
	@RequestMapping("/deleteBasket")
	public String deleteBasket(Model model,HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
	/*	int member_num =(int) session.getAttribute("session_member_num");*/
		
		
		
		
		BasketModel basketModel=new BasketModel();
	/*	List<BasketModel> list=null;
		//테스트용으로 관리자 계정을 넣음 멤버 번호 999
		list = basketService.BasketList(999);*/
		basketModel.setBasket_num(Integer.parseInt(request.getParameter("basket_num")));
		basketService.basketDelete(basketModel);
		return "/basket/deleteBasket";
		
		
	}
	
	
	@LoginCheckBeforeFunctionStart
	@RequestMapping("/deleteAllBasket")
	public String deleteAllBasket(Model model,HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
	/*	int member_num =(int) session.getAttribute("session_member_num");*/
		
		//테스트용으로 관리자 계정을 넣음 멤버 번호 999
		
		
		basketService.basketDelete_all(999);
		return "/basket/deleteBasket";
		
		
	}

	
	
/*	basketAdd()
	
	deleteBasket()
	deleteAllBasket()*/
}
