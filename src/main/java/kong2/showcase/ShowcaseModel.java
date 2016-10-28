package kong2.showcase;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class ShowcaseModel {

    private int showcase_num;
    private String subject;
    private String address1;
    private String address2;
    private Date start_date;
    private Date end_date;
    private int price;
    private String tel;
    private String tag;
    private String content;
    private String file_savname;
    private int readcount;
    private int ordercount;
    private String map;
    private int show_status; //글 상태여부 기본 -1 삭제, 0 예정중, 1 계최중
    private String showcase_category;
    private List<MultipartFile> upload_file;

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

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFile_savname() {
        return file_savname;
    }

    public void setFile_savname(String file_savname) {
        this.file_savname = file_savname;
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

    public String getMap() {
        return map;
    }

    public void setMap(String map) {
        this.map = map;
    }

    public int getShow_status() {
        return show_status;
    }

    public void setShow_status(int show_status) {
        this.show_status = show_status;
    }

    public String getShowcase_category() {
        return showcase_category;
    }

    public void setShowcase_category(String showcase_category) {
        this.showcase_category = showcase_category;
    }

    public List<MultipartFile> getUpload_file() {
        return upload_file;
    }

    public void setUpload_file(List<MultipartFile> upload_file) {
        this.upload_file = upload_file;
    }

    @Override
    public String toString() {
        return "ShowcaseModel{" + "showcase_num=" + showcase_num + ", subject=" + subject + ", address1=" + address1 + ", address2=" + address2 + ", start_date=" + new SimpleDateFormat("yyyy-MM-dd").format(start_date) + ", end_date=" + new SimpleDateFormat("yyyy-MM-dd").format(end_date) + ", price=" + price + ", tel=" + tel + ", tag=" + tag + ", content=" + content + ", file_savname=" + file_savname + ", readcount=" + readcount + ", ordercount=" + ordercount + ", map=" + map + ", show_status=" + show_status + ", showcase_category=" + showcase_category + ", upload_file=" + upload_file + '}';
    }

}
