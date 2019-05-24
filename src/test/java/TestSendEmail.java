
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import th.co.baiwa.common.util.EmailUtils;

public class TestSendEmail {

	public static void main(String[] args) throws AddressException {

		System.out.println("SimpleEmail Start");

		String from = "sheadmin@baiwa.co.th";
		String password = "buckwa12";
		
		String to1 = "kroekpong@baiwa.co.th";
//		String to2 = "partner_kroekpong.sa@saicmotor-cp.com";
		String cc1 = "wongwithit@baiwa.co.th";
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
		
		EmailUtils.sendEmail(from,password, addressTo, addressCC,
				"SimpleEmail Testing Subject : SHE Project", // Subject
				"SHE Project : SHE Project : SHE Project SimpleEmail Testing Body " // Body
		);
	}

}
