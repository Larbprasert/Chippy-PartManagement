
package th.co.baiwa.common.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class EmailUtils {
 
	@Autowired
    private static Environment env;
	
	public static void sendEmail(String from, String frompass, InternetAddress[] addressTo, InternetAddress[] addressCC, String subject, String body) {
		try {

			String enable =  env==null? "N":env.getProperty("mail.enable");
			System.out.println("env : "+env);
			System.out.println("enable : "+enable);
			if(null==enable || "N".equals(enable)){
				System.out.println("<<< TEST MODE ::: Email Sent Successfully!! >>>");
				return;
			}
			
			Properties props = new Properties();
			props.put("mail.debug",  env.getProperty("mail.debug") );
			props.put("mail.smtp.auth",env.getProperty("mail.smtp.auth") );
	        props.put("mail.smtp.host", env.getProperty("mail.smtp.host"));
	        props.put("mail.smtp.port", env.getProperty("mail.smtp.port"));
			 
			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, frompass);
				}
			});

			
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
				msg.addHeader("format", "flowed");
				msg.addHeader("Content-Transfer-Encoding", "8bit");
//			 
			    // Set the FROM message
			    msg.setFrom(new InternetAddress(from));
			 
			    // The recipients can be more than one so we use an array but you can
			    // use 'new InternetAddress(to)' for only one address.
//			    InternetAddress[] addressTo = {new InternetAddress(to)};
			    msg.setRecipients(Message.RecipientType.TO, addressTo);
			 
//			    InternetAddress[] addressCC = {new InternetAddress(cc)};
			    msg.setRecipients(Message.RecipientType.CC, addressCC);
			    
				msg.setSubject(subject, "UTF-8");
				msg.setSentDate(new Date());
				msg.setText(body, "UTF-8");
			 
				System.out.println(" >> Message is ready");
				
			    // Send the message
			    Transport.send(msg);
			    
			    System.out.println("##### Email Sent Successfully!! #####");
			    
			}
			catch (MessagingException mex) {
			    mex.printStackTrace();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
