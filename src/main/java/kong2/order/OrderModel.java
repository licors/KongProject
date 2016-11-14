package kong2.order;

import java.util.Date;

public class OrderModel {
	//각 기능 키 값 
	private int order_num;		
	private int member_num;
	private int showcase_num;
	
	//회원정보
	private String name;
	private String area; //회원 지역
	private String sex;
	private String company;
	private String id_email;
	private String phone;
	
	//결제 및 신청 정보
	private String barcode;
	private Date order_date;
	private String order_status;
	private String bank_account;
	private int total_price;
	private double change_price;
	private String payment_type;
	private Date payment_date;
	private String payment_payer;
	
	//신청 전시회 정보
	private String show_subject; //subject
	private int show_price;		//price
	private int show_status;
	private String file_savname;
	private Date start_date;
	private Date end_date;
	private String show_addr; //address2
	private int readcount;
	private int ordercount;
	
	//신청 기간 검색시 필요
	private String datepicker1;
	private String datepicker2;
	
	//장바구니에서 주문한건지 확인
	private int flag;
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getId_email() {
		return id_email;
	}
	public void setId_email(String id_email) {
		this.id_email = id_email;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getBank_account() {
		return bank_account;
	}
	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_payer() {
		return payment_payer;
	}
	public void setPayment_payer(String payment_payer) {
		this.payment_payer = payment_payer;
	}
	public String getShow_subject() {
		return show_subject;
	}
	public void setShow_subject(String show_subject) {
		this.show_subject = show_subject;
	}
	public int getShow_price() {
		return show_price;
	}
	public void setShow_price(int show_price) {
		this.show_price = show_price;
	}
	public int getShow_status() {
		return show_status;
	}
	public void setShow_status(int show_status) {
		this.show_status = show_status;
	}
	public String getFile_savname() {
		return file_savname;
	}
	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
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
	public String getShow_addr() {
		return show_addr;
	}
	public void setShow_addr(String show_addr) {
		this.show_addr = show_addr;
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
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDatepicker1() {
		return datepicker1;
	}
	public void setDatepicker1(String datepicker1) {
		this.datepicker1 = datepicker1;
	}
	public String getDatepicker2() {
		return datepicker2;
	}
	public void setDatepicker2(String datepicker2) {
		this.datepicker2 = datepicker2;
	}
	@Override
	public String toString() {
		return "OrderModel [order_num=" + order_num + ", member_num=" + member_num + ", showcase_num=" + showcase_num
				+ ", name=" + name + ", area=" + area + ", sex=" + sex + ", company=" + company + ", id_email="
				+ id_email + ", phone=" + phone + ", barcode=" + barcode + ", order_date=" + order_date
				+ ", order_status=" + order_status + ", bank_account=" + bank_account + ", total_price=" + total_price
				+ ", payment_type=" + payment_type + ", payment_date=" + payment_date + ", payment_payer="
				+ payment_payer + ", show_subject=" + show_subject + ", show_price=" + show_price + ", show_status="
				+ show_status + ", file_savname=" + file_savname + ", start_date=" + start_date + ", end_date="
				+ end_date + ", show_addr=" + show_addr + ", readcount=" + readcount + ", ordercount=" + ordercount
				+ ", datepicker1=" + datepicker1 + ", datepicker2=" + datepicker2 + "]";
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public double getChange_price() {
		return change_price;
	}
	public void setChange_price(double change_price) {
		this.change_price = change_price;
	}	
	
	
}
