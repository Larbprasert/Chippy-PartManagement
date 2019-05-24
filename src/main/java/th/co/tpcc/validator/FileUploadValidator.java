package th.co.tpcc.validator;

import java.io.IOException;
import java.util.logging.Logger;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadValidator implements Validator {
	
	// Content types the user can upload
		private static final String[] ACCEPTED_CONTENT_TYPES = new String[] {
				"application/pdf",
				"application/doc",			
				"application/msword",
				"application/rtf",			
				"text/richtext" , 
				"text/rtf" , 
				"text/plain" , 
				"application/vnd.openxmlformats-officedocument.wordprocessingml.document" , 
				"application/vnd.sun.xml.writer" ,
				"application/x-soffice" ,
				};
		
		private static final String[] ACCEPTED_EXTENSIONS = new String[] {
			"doc",
			"pdf",
			"docx",
			"rtf",	
			"txt",	
		};

		@Override
		public boolean supports(Class<?> arg0) {
			// TODO Auto-generated method stub
			return false;
		}

		@Override
		public void validate(Object arg0, Errors arg1) {
			// TODO Auto-generated method stub
			
		}
		
}
