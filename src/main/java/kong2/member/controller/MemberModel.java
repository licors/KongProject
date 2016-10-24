package kong2.member.controller;

public class MemberModel {

	private int member_num;
    private String id_email;
    private String password;
    private String name;
    private String zipcode;
    private String address;
    private String address2;
    private String company;
    private int admin;
    
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getId_email() {
		return id_email;
	}
	public void setId_email(String id_email) {
		this.id_email = id_email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int gm) {
		this.admin = gm;
	}
    
}
