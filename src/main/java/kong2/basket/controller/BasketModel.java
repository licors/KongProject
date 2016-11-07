package kong2.basket.controller;

import java.util.Date;

/*CREATE TABLE BASKET
(
	BASKET_NUM NUMBER PRIMARY KEY,
	MEMBER_NUM number NOT NULL,
	SHOWBOARD_NUM number NOT NULL,
	BASKET_DATE DATE NOT NULL
)*/
public class BasketModel {
	private int basket_num;
	private int member_num;
	private int showcase_num;	//showboard_num으로 돼있어서 showcase_num으로 변경했어요 <유진1101>
	private Date start_date;
	private Date end_date;
	private int show_status;
	private String subject;	
	private String file_savname;
	private Date basket_date;	//date 라는이름 매퍼에 없음 , date -> basket_date로 수정
	private String address2;
	private int readcount;
	private int ordercount;
	private String showcase_category; //여기두<유진1101>
	private int price;
	
	public int getShow_status() {
		return show_status;
	}
	public void setShow_status(int show_status) {
		this.show_status = show_status;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getBasket_num() {
		return basket_num;
	}
	public void setBasket_num(int basket_num) {
		this.basket_num = basket_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getShowcase_num() {
		return showcase_num;
	}
	public void setShowcase_num(int showcase_num) {
		this.showcase_num = showcase_num;
	}

	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getFile_savname() {
		return file_savname;
	}
	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getOrdercount() {
		return ordercount;
	}
	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}

	public String getShowcase_category() {
		return showcase_category;
	}
	public void setShowcase_category(String showcase_category) {
		this.showcase_category = showcase_category;
	}
	public Date getBasket_date() {
		return basket_date;
	}
	public void setBasket_date(Date basket_date) {
		this.basket_date = basket_date;
	}

	
	
	
	
}
