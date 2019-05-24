package th.co.portal.service.gas;

import java.util.List;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import th.co.baiwa.common.util.EmailUtils;
import th.co.baiwa.common.util.UserLoginUtils;
import th.co.portal.constant.GasConstants;
import th.co.portal.dao.gas.EquipmentHistoryDao;
import th.co.portal.dao.gas.GasRequestDao;
import th.co.portal.model.gas.Equipment;
import th.co.portal.model.gas.Requested;
import th.co.portal.model.gas.RequestedHistory;
import th.co.portal.model.gas.ResponseResult;

@Service("gasRequestService")
public class GasRequestService {

	@Autowired
	private GasRequestDao dao;
	
	@Autowired
	private EquipmentHistoryDao historyDao;

	public ResponseResult getDataRequest() {
		ResponseResult responseResult = new ResponseResult();
		responseResult.setData(dao.getDataPersonalEquipmentCreate(UserLoginUtils.getCurrentUser().getUserProfile().getProfile().getUserId()));
		responseResult.setUserProfile(UserLoginUtils.getCurrentUser().getUserProfile().getProfile());
		responseResult.setCode(GasConstants.RESPONSE.SUCCESS_CODE);
		responseResult.setMessage(GasConstants.RESPONSE.SUCCESS_MSG);
		return responseResult;
	}

	
	public ResponseResult getDataRequestById(String userIds) {

		ResponseResult responseResult = new ResponseResult();
		responseResult.setData(dao.getDataPersonalEquipmentCreate(userIds));
		
		responseResult.setCode(GasConstants.RESPONSE.SUCCESS_CODE);
		responseResult.setMessage(GasConstants.RESPONSE.SUCCESS_MSG);
		return responseResult;
	}
	
	public ResponseResult saveOrUpdate(Requested requested) {

		ResponseResult responseResult = new ResponseResult();
		
		try {
			
			requested.setRequestStatus(GasConstants.REQUEST_STATUS.CREATED);
			requested.setEqType(GasConstants.EQUIPMENT_TYPE.GAS_DETECTOR);
			
			String jobNo = dao.genNextJobNo(); //  Get JobNo from DB ;
			requested.setJobNo(jobNo); 
			
			dao.insertRequest(requested);
			
			/**-- Insert History records ---*/
			RequestedHistory history = new RequestedHistory(requested);
			historyDao.insertHistory(history);
			
			/**--Send Email ---*/
			sendEmail();
//			EmailUtils.sendEmail(from, frompass, addressTo, addressCC, subject, body);
	
			responseResult.setCode(GasConstants.RESPONSE.SUCCESS_CODE);
			responseResult.setMessage(GasConstants.RESPONSE.SUCCESS_MSG);
			responseResult.setData(requested);
		
		} catch (Exception e) {
			responseResult.setCode(GasConstants.RESPONSE.ERROR_CODE);
			responseResult.setMessage(GasConstants.RESPONSE.ERROR_MSG);
		}
		
		return responseResult;
	}
	
	public boolean sendEmail() throws AddressException{
	
		String from = "sheadmin@baiwa.co.th";
		String password = "buckwa12";
		
		String to1 = "kroekpong@baiwa.co.th";
		String to2 = "partner_kroekpong.sa@saicmotor-cp.com";
		String cc1 = "wongwithit@baiwa.co.th";
//		String cc2 = "partner_wongwithit.ru@saicmotor-cp.com";
	
		InternetAddress[] addressTo = { 
				new InternetAddress(to1)
				,new InternetAddress(to2) 
		};
	//	
		InternetAddress[] addressCC = { 
				new InternetAddress(cc1) 
//				,new InternetAddress(cc2) 
		};
		
		EmailUtils.sendEmail(from,password, addressTo, addressCC,
				"Sending_Portable Gas Detector Calibration", // Subject
				"Dear Users, Please be arranged to be sent the following gas detectors to SHE within 3 days " // Body
		);
		
		return true;
	}
	
	public List<Equipment> getUserEquipmentCreate(String userId) {
		return dao.getDataPersonalEquipmentCreate(userId);
	}
	public Requested getRequestedDetail(String id) {
		return dao.getRequestedDetail(id);
	}

	
}
