package kong2.showcase;

public class ShowcaseSearchModel {

    private String showcase_category;
    private String subject;
    private String tag;

    public String getShowcase_category() {
        return showcase_category;
    }

    public void setShowcase_category(String showcase_category) {
        this.showcase_category = showcase_category;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Override
    public String toString() {
        return "ShowcaseSearchModel{" + "showcase_category=" + showcase_category + ", subject=" + subject + ", tag=" + tag + '}';
    }

}
