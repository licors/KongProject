/*package kong2.order;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import kong2.basket.controller.BasketModel;
import kong2.basket.controller.BasketService;
import kong2.member.MemberModel;
import kong2.member.MemberService;
import kong2.showcase.ShowcaseModel;
import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;
import kong2.showcase.ShowcaseService;
import kong2.common.PagingAction;

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

	ShowcaseModel showcaseModel = new ShowcaseModel();
	OrderModel orderParam = new OrderModel();
	MemberModel memberModel = new MemberModel();

	private List<OrderModel> orderList = new ArrayList<OrderModel>();
	private List<BasketModel> basketList = new ArrayList<BasketModel>();
	private List<String> show_savimage = new ArrayList<String>();

	Calendar today = Calendar.getInstance();

	// 각 기능 키 값
	private int order_num;
	private int member_num;
	private int showcase_num;
	private String id_email;

	// 페이징
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingAction page;
	private int num = 0;

	// 날짜검색관련
	private String datepicker1; // start date
	private String datepicker2; // end date
	private String searchKeyword;
	private int searchNum;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	// 장바구니에 넣을때, 한개 주문할때 실행 됨
	@RequestMapping(value = "/check")
	public String orderCheck(Model model, @RequestParam int showcase_num, Locale locale, HttpServletRequest request,
			HttpSession session) throws Exception {
		logger.info("welcome order check.", locale);

		session = request.getSession();

		member_num = (Integer) session.getAttribute("session_member_num");

		orderParam.setMember_num(member_num);
		orderParam.setShowcase_num(showcase_num);
		orderParam.setOrder_status("티켓 신청");

		OrderModel orderModel = new OrderModel();
		orderModel = orderService.order_check(orderModel);

		if (orderModel != null) {
			return ""; // 팝업띄우고 전화면으로 돌아가는 jsp
		} else {
			model.addAttribute(orderModel);
			return ""; /// order/form으로 이동 (가진 정보 그대로 가지고)
		}
		// AOP사용해보기, 포워딩
	}

	// (1개 전시) 신청 폼 (showcase, main, 장바구니 신청 시 showcase_num이나 showcaseModel
	// 전달받기)
	@RequestMapping(value = "/form")
	public String orderForm(Model model, @RequestParam int showcase_num, Locale locale, HttpServletRequest request,
			HttpSession session) throws Exception {
		logger.info("welcome order form.", locale);

		session = request.getSession();

		id_email = (String) session.getAttribute("session_member_id");

		if (id_email != null) {
			showcaseModel = showcaseService.selectone(showcaseModel); // 전시회 1개
																		// 불러오기
			memberModel = memberService.getMember(id_email);

			model.addAttribute("showcaseModel", showcaseModel);
			model.addAttribute("memberModel", memberModel);

			return "order/orderForm";
		} else {
			return "order/orderError"; // 로그인 안돼있을 때 이동
		}
		// 1차 폼에서 입력 처리 가능
		// id_email, name, zipcode, company, phone(member에서 불러올수 있는 정보)
		// sex, area (입력받을 정보)

		// 2차 폼에서 처리해야 될 기능
		// barcode, order_date, order_status, total_price, payment_date,
		// ordercount(내가 설정)
		// bank_account, payment_type, payment_payer
	}

	// (1개 전시) 1차 신청 처리
	@RequestMapping(value = "/pro")
	public String orderPro(Model model, ShowcaseModel showcaseModel, OrderModel orderModel, MemberModel memberModel,
			HttpServletRequest request, HttpSession session, Locale locale) {
		logger.info("welcome order process.", locale);

		session = request.getSession();

		showcase_num = showcaseModel.getShowcase_num();
		int member_num = (Integer) session.getAttribute("session_member_num");

		orderModel.setShowcase_num(showcase_num);
		orderModel.setMember_num(member_num);

		showcaseModel = showcaseService.selectone(showcaseModel);

		model.addAttribute("showcaseModel", showcaseModel);
		model.addAttribute("orderModel", orderModel);

		return "order/orderPro";
		// 1차 폼에서 입력 처리 가능
		// id_email, name, zipcode, company, phone(member에서 불러올수 있는 정보)
		// total price 계산
		// sex, area (입력받을 정보)

		// 2차 폼에서 처리해야 될 기능
		// bank_account, payment_type, payment_payer

		// 3차 신청 처리(폼X)
		// order_num, barcode, order_date, order_status, total_price,
		// payment_date, ordercount(내가 설정)
	}

	// (1개 전시) 신청 완료 처리
	@RequestMapping(value = "/orderInsert")
	public String orderInsert(Model model, OrderModel orderModel, ShowcaseModel showcaseModel, Locale locale,
			HttpSession session, HttpServletRequest request) {
		logger.info("welcome order success.", locale);

		session = request.getSession();

		showcase_num = showcaseModel.getShowcase_num();
		member_num = (Integer) session.getAttribute("session_member_num");

		// 바코드 넘버 생성
		String str1 = Integer.toString(member_num);
		String str2 = Integer.toString(showcase_num);
		Long str3 = Calendar.getInstance().getTimeInMillis();

		String codeStr = str1 + str2 + str3;

		try {
			Barcode barcode = BarcodeFactory.createCode128B(codeStr);
			File file = new File("위치" + codeStr + ".png"); // 수정
			BarcodeImageHandler.savePNG(barcode, file);
		} catch (Exception e) {
			e.printStackTrace();
		}

		orderModel.setBarcode(codeStr);
		orderModel.setOrder_status("티켓 신청");
		orderModel.setOrder_date(today.getTime());
		orderService.ordercountPlus(showcaseModel);

		orderModel.setTotal_price(showcaseModel.getPrice());

		orderModel.setPayment_date(today.getTime()); // 수정하기

		return "order/orderSuccess";
	}

	// basket(다수) 신청 폼
	@RequestMapping(value = "/form_B")
	public String orderForm_B(Model model, Locale locale, HttpServletRequest request, HttpSession session) {
		logger.info("welcome basket order", locale);

		session = request.getSession();
		BasketModel basketModel = new BasketModel();

		id_email = (String) session.getAttribute("session_member_id");
		member_num = (Integer) session.getAttribute("session_member_num");// 둘중
																			// 필요없는거
																			// 삭제

		if (id_email != "") {
			basketModel.setMember_num(member_num);

			basketList = basketService.BasketList(member_num);
			memberModel = memberService.getMember(id_email);

			model.addAttribute("basketList", basketList);
			model.addAttribute("memberModel", memberModel);

			return "order/orderForm";
		} else {
			return "order/orderError";
		}
	}

	// basket(다수) 신청처리
	@RequestMapping(value = "/pro_B")
	public String orderPro_B(Model model, Locale locale, HttpServletRequest request, HttpSession session,
			ShowcaseModel showcaseModel, OrderModel orderModel, MemberModel memberModel) {
		logger.info("welcome basket order progress...", locale);

		session = request.getSession();
		BasketModel basketModel = new BasketModel();

		id_email = (String) session.getAttribute("session_member_id");
		member_num = (Integer) session.getAttribute("session_member_num");

		basketModel.setMember_num(member_num);
		basketList = basketService.BasketList(member_num);

		orderModel.setMember_num(member_num);
		orderModel.setId_email(id_email);

		model.addAttribute("memberModel", memberModel);
		model.addAttribute("basketList", basketList);
		model.addAttribute("orderModel", orderModel);

		return "order/orderPro";
	}

	// basket(다수) DB insert
	@RequestMapping(value = "/insert_B")
	public String orderInsert_B(Locale locale, HttpServletRequest reqeust, OrderModel orderModel) {

		logger.info("welcome basket order insert...", locale);

		BasketModel basketModel = new BasketModel();
		basketModel.setMember_num(orderModel.getMember_num());

		basketList = basketService.BasketList(orderModel.getMember_num());

		// 총 가격 계산 장바구니(
		
		 * for (int i = 0; i < basketList.size(); i++) { basketModel =
		 * basketList.get(i);
		 * showcaseModel.setShowcase_num(basketModel.getShowboard_num());
		 * showcaseModel = showcaseService.selectone(showcaseModel);
		 * 
		 * totalPrice += showcaseModel.getPrice(); }
		 

		for (int i = 0; i < basketList.size(); i++) {
			basketModel = basketList.get(i);
			showcaseModel.setShowcase_num(basketModel.getShowboard_num());
			showcaseModel = showcaseService.selectone(showcaseModel);

			// 바코드 넘버 생성
			String str1 = Integer.toString(orderModel.getMember_num());
			String str2 = Integer.toString(basketModel.getShowboard_num());
			Long str3 = Calendar.getInstance().getTimeInMillis();

			String codeStr = str1 + str2 + str3;

			try {
				Barcode barcode = BarcodeFactory.createCode128B(codeStr);
				File file = new File("위치" + codeStr + ".png"); // 수정
				BarcodeImageHandler.savePNG(barcode, file);
			} catch (Exception e) {
				e.printStackTrace();
			}

			orderModel.setBarcode(codeStr);
			orderModel.setShowcase_num(basketModel.getShowboard_num());
			orderModel.setOrder_status("티켓 신청");
			orderModel.setOrder_date(today.getTime());
			orderService.ordercountPlus(showcaseModel);

			orderModel.setPayment_date(today.getTime()); // 수정하기

		}
		return "order/orderSuccess";
	}

	// 회원용 신청 리스트
	@RequestMapping(value = "/list")
	public String orderList(Locale locale, HttpServletRequest request, HttpSession session, Model model)
			throws Exception {
		logger.info("welcome order list.", locale);

		session = request.getSession();
		OrderModel orderModel = new OrderModel();

		member_num = (Integer) session.getAttribute("session_member_num");

		orderModel.setMember_num(member_num);

		orderList = orderService.orderList(orderModel);

		// paging
		totalCount = orderList.size();

		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, "orderList");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		orderList = orderList.subList(page.getStartCount(), lastCount);

		model.addAttribute("orderList", orderList);

		return "order/orderList";

	}

	// 신청 상세보기
	@RequestMapping(value = "/view")
	public String orderView(Model model, Locale locale, HttpServletRequest request, HttpSession session) {
		logger.info("welcome order list.", locale);

		session = request.getSession();

		// orderList.jsp 에서 get방식으로 order_num 넘겨준다.
		order_num = Integer.parseInt(request.getParameter("order_num"));

		member_num = (Integer) session.getAttribute("member_num");

		OrderModel orderModel = new OrderModel();
		orderParam.setOrder_num(order_num);
		orderParam.setMember_num(member_num);
		orderModel = orderService.orderView(orderParam);

		if (orderModel.getFile_savname() != null) {
			String images = orderModel.getFile_savname();
			StringTokenizer st = new StringTokenizer(images, ",");
			while (st.hasMoreTokens()) {
				show_savimage.add(st.nextToken());
			}
		}

		model.addAttribute("orderModel", orderModel);

		// 취소버튼 필요한 정보 : order_num, member_num
		return "order/orderView";
	}

	// 주문 상품 삭제
	@RequestMapping(value = "/orderCancel")
	public String orderCancel(Locale locale, HttpServletRequest request, OrderModel orderModel,
			ShowcaseModel showcaseModel) {
		// 원래는 리스트에서 order_num 넘겨줬는데 이제는 number를 넣어서 VO를 넘겨줄것
		// showcaseModel도 넘겨줄것
		// 아니면 showcase_num을 orderModel에 넣어서 service로 showcase모델 불러올것

		// 신청수 감소
		orderService.ordercountMinus(showcaseModel);

		// 티켓 상태 변경(delete 아닌 update)
		orderModel.setOrder_status("티켓 취소");
		orderService.update_order(orderModel);

		// 바코드 이미지 파일 지우기
		String str = orderModel.getBarcode();
		File file = new File("위치" + str + ".png");

		if (file.delete()) {
			logger.info("바코드 이미지 파일 지우기 성공" + str, locale);

		} else {
			logger.info("바코드 이미지 파일 지우기 실패" + str, locale);
		}

		orderModel.setBarcode("");

		// order테이블 수정
		orderService.update_order(orderModel);

		logger.info("티켓 취소완료", locale);

		return "redirect:/order/list";
	}

	// 관리자용 회원 오더리스트(페이징, 검색)
	@RequestMapping(value = "/adminList")
	public String adminOrderList(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		session = request.getSession();
		OrderModel orderModel = new OrderModel();

		// id_email = (String) session.getAttribute("session_member_id");

		orderList = orderService.order_selectAll();

		// paging
		totalCount = orderList.size();

		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, "orderList");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		orderList = orderList.subList(page.getStartCount(), lastCount);

		model.addAttribute("orderList", orderList);

		return "/adminList";
	}

	// 리스트 검색
	@RequestMapping(value = "/search")
	public String search(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		session = request.getSession();
		OrderModel orderModel = new OrderModel();

		// member_num = (Integer) session.getAttribute("session_member_num");

		if (datepicker1.isEmpty() || datepicker2.isEmpty() || datepicker1.equals("") || datepicker2.equals("")) {
			orderParam.setDatepicker1("16-09-01");
			orderParam.setDatepicker2("16-12-31");
		} else {
			orderParam.setDatepicker1(datepicker1);
			orderParam.setDatepicker2(datepicker2);
		}

		if (searchKeyword == null) { // 기간검색
			orderList = orderService.search_date(orderParam);
		} else if (searchNum == 0) { // 회원 + 기간검색
			orderParam.setEmail("%" + getSearchKeyword() + "%");
			orderList = sqlMapper.queryForList("order.search_id", orderParam);
		} else if (searchNum == 1) { // 전시 + 기간검색
			orderParam.setSubject("%" + getSearchKeyword() + "%");
			orderList = sqlMapper.queryForList("order.search_subject", orderParam);
		} else if (searchNum == 2) { // 신청상태 + 기간검색
			orderParam.setStatus("%" + getSearchKeyword() + "%");
			orderList = sqlMapper.queryForList("order.search_status", orderParam);
		}

		totalCount = orderList.size(); // 전체 글 갯수를 구한다.
		// pagingAction 객체생성
		adpage = new AdminOrderPagingAction(currentPage, totalCount, blockCount, blockPage, searchNum,
				getSearchKeyword());
		pagingHtml = adpage.getPagingHtml().toString(); // 페이지HTML 생성.

		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 lastCount를 +1 번호로 설정.
		if (adpage.getEndCount() < totalCount)
			lastCount = adpage.getEndCount() + 1;

		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		orderList = orderList.subList(adpage.getStartCount(), lastCount);

		return "/adminList";
	}

}
*/