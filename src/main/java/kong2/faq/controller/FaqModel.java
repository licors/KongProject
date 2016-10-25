package kong2.faq.controller;

public class FaqModel {

    private int faq_num;
    private String subject, content;

    public int getfaq_num() {
        return faq_num;
    }

    public void setfaq_num(int faq_num) {
        this.faq_num = faq_num;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
}
