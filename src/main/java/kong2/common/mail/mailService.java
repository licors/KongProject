package kong2.common.mail;

import java.util.HashMap;
import java.util.Map;
import javax.mail.internet.MimeMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "mailService")
public class mailService implements mailDAO {

//    @Autowired
    private JavaMailSender mailSender;
//    @Autowired
    private VelocityEngine velocityEngine;
//    @Inject
//    private JavaMailSender mailSender;
//    @Inject
//    private VelocityEngine velocityEngine;

    private static final Logger logger = LoggerFactory.getLogger(mailService.class);

    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void setVelocityEngine(VelocityEngine velocityEngine) {
        this.velocityEngine = velocityEngine;
    }

    @Override
    public boolean send(mailModel model) {
        logger.debug("Sending report by email...");
        boolean retVal = false;
        try {
            final String emailTo = model.getEmailTo();
            final String emailFrom = model.getEmailFrom();
            final String subject = model.getSubject();
            final String message = model.getMessage();

            MimeMessagePreparator preparator = new MimeMessagePreparator() {
                public void prepare(MimeMessage mimeMessage) throws Exception {
                    MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
                    message.setTo(emailTo);
                    message.setFrom(emailFrom); // 파라미터화할 수 있다...
                    Map model = new HashMap();
                    model.put("model", model);
                    final String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "classpath:mail.html", "utf-8", model);
                    message.setText(text, true);
                }
            };
            this.mailSender.send(preparator);

            retVal = true;
        } catch (Exception e) {
            logger.error("Can't send email... " + e.getMessage(), e);
        }
        return retVal;
    }

}
