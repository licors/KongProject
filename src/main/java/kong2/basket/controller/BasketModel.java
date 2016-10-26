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
	private int showboard_num;
	private Date start_date;
	private Date end_date;
	private int show_status;
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

	private String subject;
	
	private String file_savname;
	private String date;
	private String address2;
	private int readcount;
	private int ordercount;
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	private String showboard_category;
	private int price;
	
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
	public int getShowboard_num() {
		return showboard_num;
	}
	public void setShowboard_num(int showboard_num) {
		this.showboard_num = showboard_num;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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

	public String getShowboard_category() {
		return showboard_category;
	}
	public void setShowboard_category(String showboard_category) {
		this.showboard_category = showboard_category;
	}
	
	
	
	
}
