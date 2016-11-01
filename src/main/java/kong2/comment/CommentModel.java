package kong2.comment;

import java.util.Date;

public class CommentModel {
	private int comment_num;
	private int member_num;
	private int showcase_num;
	private String content;
	private Date reg_date;
	private String name;
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getShowcase_num() {
		return showcase_num;
	}
	public void setShowcase_num(int showcase_num) {
		this.showcase_num = showcase_num;
	}
	
	
}
