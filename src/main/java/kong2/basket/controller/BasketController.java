package kong2.basket.controller;


import java.io.UnsupportedEncodingException;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kong2.common.LoginCheckBeforeFunctionStart;
import kong2.common.PagingAction;
import kong2.faq.controller.FaqModel;
import kong2.faq.controller.FaqService;
import kong2.order.OrderModel;
import kong2.order.OrderService;
import kong2.showcase.ShowcaseController;

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
	private String show_imgPath = ShowcaseController.imgPath; // 기준
	
	@Resource(name = "basketService")
	private BasketService basketService;
	
	@Resource(name = "orderService")
	private OrderService orderService;
	
	@LoginCheckBeforeFunctionStart
	@RequestMapping(value = "/list/{currentPage}")
	public String basketList(@PathVariable int currentPage,Model model,HttpServletRequest request) throws Exception {

	List<BasketModel> list=null;
		OrderModel orderModel = new OrderModel();

		
		
		HttpSession session = request.getSession();
		int member_num =(int) session.getAttribute("session_member_num");
		
		
		
		list = basketService.BasketList(member_num);
		
		
		
		
		
		
		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, "/basket/list");
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
		model.addAttribute("show_img", show_imgPath);
		model.addAttribute("currentPage", currentPage);
		// 보여줄 tiles
		return "basketList";

	}
	
	
	@LoginCheckBeforeFunctionStart
	@RequestMapping(value="/add/{showcase_num}",method = RequestMethod.GET)
	public String basketAdd(Model model,HttpServletRequest request,@PathVariable int showcase_num)throws Exception{
		HttpSession session = request.getSession();
		int member_num =(Integer) session.getAttribute("session_member_num");
		Calendar today = Calendar.getInstance();
		
		OrderModel orderModel=new OrderModel();
		BasketModel basketModel= new BasketModel();
		BasketModel basketModel_I= new BasketModel();
/*		orderParam.setMember_num(member_num);
		orderParam.setShowcase_num(showcase_num);
		orderParam.setOrder_status("티켓 신청");

		OrderModel orderModel = new OrderModel();
		orderModel = orderService.order_check(orderParam);*/
		
		orderModel.setMember_num(member_num);
		orderModel.setShowcase_num(showcase_num);
		orderModel.setOrder_status("티켓 신청");
		
		orderModel =orderService.order_check(orderModel);
		
		
		if (orderModel != null) {
			return "orderCheckFail";
		}
		else{
		basketModel.setMember_num(member_num);
		basketModel.setShowcase_num(showcase_num);		
		basketModel=basketService.basket_check(basketModel);
		if(basketModel!=null){
			System.out.println("1");
			return "/basket/basketCheck";
			
		}else{
			System.out.println("2");
			basketModel_I.setMember_num(member_num);
			basketModel_I.setShowcase_num(showcase_num);
			basketModel_I.setBasket_date(today.getTime());
			basketService.basketInsert(basketModel_I);
			return "/basket/addBasket";
		}					
		}
	}
	
	
	@LoginCheckBeforeFunctionStart
	@RequestMapping("/deleteBasket")
	public String deleteBasket(Model model,HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
	
		
		
		
		
		BasketModel basketModel=new BasketModel();
	
		basketModel.setBasket_num(Integer.parseInt(request.getParameter("basket_num")));
		basketService.basketDelete(basketModel);
		model.addAttribute("currentPage", currentPage);
		return "/basket/deleteBasket";
		
		
	}
	
	
	
	@RequestMapping("/deleteAllBasket/{currentPage}")
	public String deleteAllBasket(@PathVariable int currentPage,Model model,HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
	int member_num =(int) session.getAttribute("session_member_num");
		
		
		
		
		basketService.basketDelete_all(member_num);
		model.addAttribute("currentPage", currentPage);
		return "/basket/deleteBasket";
		
		
	}

	
	

}
