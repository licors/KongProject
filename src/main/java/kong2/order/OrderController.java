/*package kong2.order;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kong2.basket.controller.BasketModel;
import kong2.basket.controller.BasketService;
import kong2.member.controller.MemberModel;
import kong2.member.controller.MemberService;
import kong2.showcase.ShowcaseModel;
import kong2.showcase.ShowcaseService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Resource(name = "showcaseService")
	private ShowcaseService showcaseService;

	@Resource(name = "orderService")
	private OrderService orderService;

	@Resource(name = "memberService")
	private MemberService memberService;

	@Resource(name = "basketService")
	private BasketService basketService;

	ShowcaseModel showModel = new ShowcaseModel();
	OrderModel orderParam = new OrderModel();
	OrderModel orderResult = new OrderModel();
	MemberModel memberModel = new MemberModel();

	private List<OrderModel> orderList = new ArrayList<OrderModel>();
	private List<BasketModel> basketList = new ArrayList<BasketModel>();

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	// 신청 폼
	@RequestMapping(value = "/form")
	public String orderForm(Model model, ShowcaseModel showcaseModel, Locale locale, HttpServletRequest request,
			HttpSession session) throws Exception {
		logger.info("welcom order form.", locale);

		session = request.getSession();

		int showcase_num = showcaseModel.getShowcase_num();
		String id = (String) session.getAttribute("session_member_id");

		if (id != null) {
			showcaseModel = showcaseService.showcaseView(showcase_num); // 전시회 1개 불러오기
			memberModel = memberService.getMember(id);
			
			model.addAttribute("showcaseModel", showcaseModel);
			model.addAttribute("memberModel", memberModel);

			return "orderForm";
		} else {
			return "orderError"; // 로그인 안돼있을 때 이동
		}
		//1차 폼에서 입력 처리 가능
		//id, name, zipcode, company, phone(member에서 불러올수 있는 정보)
		//sex, area (입력받을 정보)
		
		//2차 폼에서 처리해야 될 기능
		//barcode, order_date, order_status, total_price, payment_date, ordercount(내가 설정)
		//bank_account, payment_type, payment_payer
	}

	// 1차 신청 처리
	@RequestMapping(value = "/pro1")
	public String orderInsert(Model model, ShowcaseModel showcaseModel, OrderModel orderModel, MemberModel memberModel,
			HttpServletRequest request, HttpSession session, Locale locale) {
		logger.info("welcom order process.", locale);

		session = request.getSession();

		int showcase_num = showcaseModel.getShowcase_num();
		String id = (String) session.getAttribute("session_member_id");
		
		orderModel.setShowcase_num(showcase_num);
		orderModel.setMember_num(memberModel.getMember_num());
		orderModel.setId_email(id);
		
		showcaseModel = showcaseService.showcaseView(showcase_num);
		
		model.addAttribute("showcaseModel", showcaseModel);
		model.addAttribute("orderModel", orderModel);
		
		return "orderPro";
		//1차 폼에서 입력 처리 가능
		//id, name, zipcode, company, phone(member에서 불러올수 있는 정보)
		//sex, area (입력받을 정보)
				
		//2차 폼에서 처리해야 될 기능
		//bank_account, payment_type, payment_payer
		
		//3차 신청 처리(폼X)
		//order_num, barcode, order_date, order_status, total_price, payment_date, ordercount(내가 설정)
	}

	//신청 완료 처리
	@RequestMapping(value = "/orderSuccess")
	public String orderSuccess(Model model, OrderModel orderModel, ShowcaseModel showcaseModel, Locale locale,
			HttpSession session, HttpServletRequest request) {
		logger.info("welcom order success.", locale);
		
		session = request.getSession();

		int showcase_num = showcaseModel.getShowcase_num();
		int member_num = (int) session.getAttribute("session_member_num");
		
		orderModel.setOrder_status("티켓 신청");
		
		//바코드 넘버 생성
		String str1 = Integer.toString(member_num);
		String str2 = Integer.toString(showcase_num);
		Long str3 = Calendar.getInstance().getTimeInMillis();
		
		String codeStr = str1 + str2 + str3;
		
		try {
			Barcode barcode = BarcodeFactory.
		}
		orderModel.setBarcode(barcode);
		orderModel.setOrder_date(order_date);
		orderModel.setTotal_price(total_price);
		orderModel.setPayment_date();
		orderModel.setOrdercount(ordercount);
		
		
	}
	// 회원용 신청 리스트
	@RequestMapping("/list")
	public String orderList(Locale locale, HttpServletRequest request, HttpSession session, Model model)
			throws Exception {
		logger.info("welcome order list.", locale);

		session = request.getSession();
		OrderModel orderModel = new OrderModel();

		int id = (int) session.getAttribute("member_num");

		orderModel.setMember_num(id);

		orderList = orderService.orderList(orderModel);

		model.addAttribute("orderList", orderList);

		return "orderList";

	}

}
*/