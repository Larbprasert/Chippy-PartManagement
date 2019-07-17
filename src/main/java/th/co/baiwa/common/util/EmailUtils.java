
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

import th.co.baiwa.common.ApplicationCache;
import th.co.tpcc.model.SysParam;

public class EmailUtils {

	/**TO Modify by properties ----- */   //FIXME
	private static boolean MAIL_ENABLE = true;
	private static String MAIL_DEBUG = "false";
	private static String MAIL_SMTP_AUTH = "true";
	private static String MAIL_SMTP_HOST = "smtp.gmail.com";
	private static String MAIL_SMTP_PORT = "587";
	private static String MAIL_PASS = "";
	private static String MAIL_FROM_ADDR= "kroekpong@gmail.com";
	private static String MAIL_FROM_NAME= "Part Management System";
	public static boolean TEST_SEND = true;

	public static boolean sendEmail(InternetAddress[] addressTo, InternetAddress[] addressCC,
			String subject, String body) {
		try {

			if(!TEST_SEND){
				
				SysParam CONFIG_MAIL_ENABLE = ApplicationCache.getParamGroupValue("EMAIL_CONFIG","mail.enable");
				SysParam CONFIG_MAIL_DEBUG = ApplicationCache.getParamGroupValue("EMAIL_CONFIG","mail.debug");
				SysParam CONFIG_MAIL_SMTP_AUTH = ApplicationCache.getParamGroupValue("EMAIL_CONFIG","mail.smtp.auth");
				SysParam CONFIG_MAIL_SMTP_HOST = ApplicationCache.getParamGroupValue("EMAIL_CONFIG","mail.smtp.host");
				SysParam CONFIG_MAIL_SMTP_PORT = ApplicationCache.getParamGroupValue("EMAIL_CONFIG","mail.smtp.port");
				SysParam CONFIG_MAIL_FROM = ApplicationCache.getParamGroupValue("EMAIL_CONFIG","mail.from.address");
				SysParam CONFIG_MAIL_NAME = ApplicationCache.getParamGroupValue("EMAIL_CONFIG","mail.from.name");
				SysParam CONFIG_MAIL_PASS = ApplicationCache.getParamGroupValue("EMAIL_CONFIG","mail.password");
	
				MAIL_ENABLE = "Y".equals(CONFIG_MAIL_ENABLE.getDescEn());
				MAIL_DEBUG = CONFIG_MAIL_DEBUG.getDescEn();
				MAIL_SMTP_AUTH = CONFIG_MAIL_SMTP_AUTH.getDescEn();
				MAIL_SMTP_HOST = CONFIG_MAIL_SMTP_HOST.getDescEn();
				MAIL_SMTP_PORT = CONFIG_MAIL_SMTP_PORT.getDescEn();
				MAIL_FROM_ADDR = CONFIG_MAIL_FROM.getDescEn();
				MAIL_FROM_NAME = CONFIG_MAIL_NAME.getDescEn();
				MAIL_PASS = CONFIG_MAIL_PASS.getDescEn();
		
			}
			
			System.out.println("MAIL_ENABLE : "+MAIL_ENABLE);
			System.out.println("MAIL_DEBUG : "+MAIL_DEBUG);
			System.out.println("MAIL_SMTP_AUTH : "+MAIL_SMTP_AUTH);
			System.out.println("MAIL_SMTP_HOST : "+MAIL_SMTP_HOST);
			System.out.println("MAIL_SMTP_PORT : "+MAIL_SMTP_PORT);
			System.out.println("MAIL_FROM_ADDR : "+MAIL_FROM_ADDR);
			System.out.println("MAIL_PASS : "+MAIL_PASS);
			
			if (!MAIL_ENABLE) {
				System.out.println("<<< TEST MODE ::: Email Sent Successfully!! >>>");
				return false;
			}
			
			//***** Authen Process *******
			Properties props = new Properties();
			props.put("mail.debug", MAIL_DEBUG);
			props.put("mail.smtp.auth", MAIL_SMTP_AUTH);
			props.put("mail.smtp.host", MAIL_SMTP_HOST);
			props.put("mail.smtp.port", MAIL_SMTP_PORT);
			
			if(MAIL_SMTP_HOST.indexOf("gmail")>=0){
				props.put("mail.smtp.socketFactory.port", MAIL_SMTP_PORT);
		        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		        props.put("mail.smtp.starttls.enable", "true");
			}
	        
			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(MAIL_FROM_ADDR, MAIL_PASS);
				}
			});

			try {
				MimeMessage msg = new MimeMessage(session);
				msg.addHeader("Content-type", "text/html; charset=UTF-8");
				msg.addHeader("Content-Transfer-Encoding", "8bit");
				//
				// Set the FROM message
				msg.setFrom(new InternetAddress(MAIL_FROM_ADDR,MAIL_FROM_NAME));

				// The recipients can be more than one so we use an array but
				// you can
				// use 'new InternetAddress(to)' for only one address.
				// InternetAddress[] addressTo = {new InternetAddress(to)};
				msg.setRecipients(Message.RecipientType.TO, addressTo);

				// InternetAddress[] addressCC = {new InternetAddress(cc)};
				msg.setRecipients(Message.RecipientType.CC, addressCC);

				msg.setSubject(subject, "UTF-8");
				msg.setSentDate(new Date());
				msg.setContent(body, "text/html; charset=UTF-8");
				

				// Send the message
				Transport.send(msg);

//				System.out.println("##### Email Sent Successfully!! #####");

			} catch (MessagingException mex) {
				mex.printStackTrace();
			}
			
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean isMAIL_ENABLE() {
		return MAIL_ENABLE;
	}

	public static void setMAIL_ENABLE(boolean mAIL_ENABLE) {
		MAIL_ENABLE = mAIL_ENABLE;
	}

	public static String getMAIL_DEBUG() {
		return MAIL_DEBUG;
	}

	public static void setMAIL_DEBUG(String mAIL_DEBUG) {
		MAIL_DEBUG = mAIL_DEBUG;
	}

	public static String getMAIL_SMTP_AUTH() {
		return MAIL_SMTP_AUTH;
	}

	public static void setMAIL_SMTP_AUTH(String mAIL_SMTP_AUTH) {
		MAIL_SMTP_AUTH = mAIL_SMTP_AUTH;
	}

	public static String getMAIL_SMTP_HOST() {
		return MAIL_SMTP_HOST;
	}

	public static void setMAIL_SMTP_HOST(String mAIL_SMTP_HOST) {
		MAIL_SMTP_HOST = mAIL_SMTP_HOST;
	}

	public static String getMAIL_SMTP_PORT() {
		return MAIL_SMTP_PORT;
	}

	public static void setMAIL_SMTP_PORT(String mAIL_SMTP_PORT) {
		MAIL_SMTP_PORT = mAIL_SMTP_PORT;
	}

}
