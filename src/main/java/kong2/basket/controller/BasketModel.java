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
	private Date basket_date;
	private String subject;
	private String file_orgname;
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
	public Date getBasket_date() {
		return basket_date;
	}
	public void setBasket_date(Date basket_date) {
		this.basket_date = basket_date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFile_orgname() {
		return file_orgname;
	}
	public void setFile_orgname(String file_orgname) {
		this.file_orgname = file_orgname;
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
