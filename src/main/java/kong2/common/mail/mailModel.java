package kong2.common.mail;

import java.io.File;

public class mailModel {

    private String emailTo;
    private String emailFrom;
    private String subject;
    private String message;
    private int support_num;
    private File file;

    public String getEmailTo() {
        return emailTo;
    }

    public void setEmailTo(String emailTo) {
        this.emailTo = emailTo;
    }

    public String getEmailFrom() {
        return emailFrom;
    }

    public void setEmailFrom(String emailFrom) {
        this.emailFrom = emailFrom;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public int getSupport_num() {
        return support_num;
    }

    public void setSupport_num(int support_num) {
        this.support_num = support_num;
    }

    @Override
    public String toString() {
        return "mailModel{" + "emailTo=" + emailTo + ", emailFrom=" + emailFrom + ", subject=" + subject + ", message=" + message + ", support_num=" + support_num + ", file=" + file + '}';
    }

}
