package kong2.common.mail;

public interface mailDAO {

    public boolean send(mailModel model);
    public boolean adminsend(mailModel model);
}
