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
            MimeMessagePreparator preparator = new MimeMessagePreparator() {
                public void prepare(MimeMessage mimeMessage) throws Exception {
                    MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
                    message.setTo(model.getEmailTo());
                    message.setFrom(model.getEmailFrom());
                    message.setSubject(model.getSubject());
                    Map model2 = new HashMap();
                    model2.put("model", model);
                    model2.put("support_num", model.getSupport_num());
                    final String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "classpath:mail.html", "utf-8", model2);
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

    @Override
    public boolean adminsend(mailModel model) {
        logger.debug("Sending report by email...");
        boolean retVal = false;
        try {
            MimeMessagePreparator preparator = new MimeMessagePreparator() {
                public void prepare(MimeMessage mimeMessage) throws Exception {
                    MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
                    message.setTo(model.getEmailTo());
                    message.setFrom(model.getEmailFrom());
                    Map model2 = new HashMap();
                    model2.put("model", model);
                    model2.put("support_num", model.getSupport_num());
                    final String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "classpath:adminmail.html", "utf-8", model2);
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
