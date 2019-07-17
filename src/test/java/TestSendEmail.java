
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import th.co.baiwa.common.util.EmailUtils;

public class TestSendEmail {

	public static void main(String[] args) throws AddressException {

		System.out.println("SimpleEmail Start");

		
		String to1 = "kroekpong@baiwa.co.th";
		String cc1 = "partner_marut.la@saicmotor-cp.com";
//		String cc2 = "partner_wongwithit.ru@saicmotor-cp.com";

		InternetAddress[] addressTo = { 
				new InternetAddress(to1)
//				,new InternetAddress(to2) 
		};
//		
		InternetAddress[] addressCC = { 
				new InternetAddress(cc1) 
//				,new InternetAddress(cc2) 
		};
		
		String body = "</br>"
//				+ "<p><strong>Dear Users,</strong></p> "
				+ "<p style=\"margin-left: 25px;\">Your requested has been <strong style=\"color: #0000ff;\">Approve</strong>.</p> "
				+ "<p style=\"margin-left: 25px;\">"
				+ "<ul> "
				+ "<li><strong>Request No.</strong> : {request_ID}</li> "
				+ "<li><strong>Request Type</strong> : {requestType}</li> "
				+ "<li><strong>Description</strong> : {description}</li>"
				+ "</ul> "
				+ "<p style=\"margin-left: 30px;\"> Link URL : <a href=\"http://{url}\">  View Request  </a></p> "
				+ "</br>";
		
		EmailUtils.sendEmail(addressTo, addressCC,
				"[Approve] Request Number : XXXXXXXXXXXX", // Subject
				body
		);
	}

}
