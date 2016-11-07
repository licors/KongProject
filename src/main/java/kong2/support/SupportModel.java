/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kong2.support;

import java.util.Date;

/**
 *
 * @author user2
 */
public class SupportModel {

    private int support_num;
    private int member_num;
    private String type;
    private String email;
    private String content;
    private Date reg_date;
    private int ref;
    private int re_step;
    private int re_level;

    public int getSupport_num() {
        return support_num;
    }

    public void setSupport_num(int support_num) {
        this.support_num = support_num;
    }

    public int getMember_num() {
        return member_num;
    }

    public void setMember_num(int member_num) {
        this.member_num = member_num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public int getRef() {
        return ref;
    }

    public void setRef(int ref) {
        this.ref = ref;
    }

    public int getRe_step() {
        return re_step;
    }

    public void setRe_step(int re_step) {
        this.re_step = re_step;
    }

    public int getRe_level() {
        return re_level;
    }

    public void setRe_level(int re_level) {
        this.re_level = re_level;
    }

    @Override
    public String toString() {
        return "SupportModel{" + "support_num=" + support_num + ", member_num=" + member_num + ", type=" + type + ", email=" + email + ", content=" + content + ", reg_date=" + reg_date + ", ref=" + ref + ", re_step=" + re_step + ", re_level=" + re_level + '}';
    }

}
