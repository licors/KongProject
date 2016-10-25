/*package kong2.order;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kong2.basket.controller.basketModel;
import kong2.basket.controller.basketService;
import kong2.member.controller.MemberModel;
import kong2.member.controller.MemberService;
import kong2.showcase.ShowcaseModel;
import kong2.showcase.controller.ShowcaseService;
@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource(name="showcaseService")
	private ShowcaseService showcaseService;
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="basketService")
	private basketService basketService;
	
	ShowcaseModel showModel = new ShowcaseModel();
	OrderModel orderParam = new OrderModel();
	OrderModel orderResult = new OrderModel();
	MemberModel memberModel = new MemberModel();
	
	private List<OrderModel> orderList = new ArrayList<OrderModel>();
	private List<basketModel> basketList = new ArrayList<basketModel>();
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping("/list")
	public Model orderList(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		session = request.getSession();
		OrderModel orderModel = new OrderModel();
		
		String id = (String)session.getAttribute(")
	}
}
*/