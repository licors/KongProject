/*package kong2.order.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderDAOService orderDAOService;
	
	@Resource(name="showcaseService")
	private ShowcaseService showcaseService;
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="basketService")
	private BasketService basketService;
	
	ShowcaseModel showModel = new ShowcaseModel();
	OrderModel orderParam = new OrderModel();
	OrderModel orderResult = new OrderModel();
	MemberModel memberModel = new MemberModel();
	
	private List<OrderModel> orderList = new ArrayList<OrderModel>();
	private List<BasketModel> basketList = new ArrayList<BasketModel>();
	
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping("/list")
	public Model orderList(Model model) throws Exception {
		
	}
}
*/