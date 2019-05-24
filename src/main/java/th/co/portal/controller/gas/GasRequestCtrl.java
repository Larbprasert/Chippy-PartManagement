package th.co.portal.controller.gas;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import th.co.portal.model.gas.Requested;
import th.co.portal.model.gas.ResponseResult;
import th.co.portal.service.gas.GasRequestService;

@RestController
@RequestMapping("/GasRequest/")
public class GasRequestCtrl {
	
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private GasRequestService service;
	
	
	@RequestMapping(value = "getDataRequest", method = RequestMethod.GET)
	public ResponseResult getDataRequest() throws ParseException {
		logger.info("GasRequestCtrl :=> getDataRequest ");

		ResponseResult responseResult = new ResponseResult();
		responseResult = service.getDataRequest();
		logger.debug("GasRequestCtrl :=> search :=> Result ="+responseResult.toString());
		return responseResult;
	}
	
	
	
	@RequestMapping(value = "getDataRequests/{id}", method = RequestMethod.GET)
	public ResponseResult getDataRequestById(@PathVariable String id) throws ParseException {
		logger.info("GasRequestCtrl :=> getDataRequest ");

		ResponseResult responseResult = new ResponseResult();
		responseResult = service.getDataRequestById(id);
		logger.debug("GasRequestCtrl :=> search :=> Result ="+responseResult.toString());
		return responseResult;
	}
	
	@RequestMapping(value ="gas_requested_modify/{id}", method = RequestMethod.GET)
	public ModelAndView gas_requested_view(HttpServletRequest httpRequest,@PathVariable String id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("requestedId", id);
		
		mav.addObject("requestObj",service.getRequestedDetail(id));
		
		mav.setViewName("gas_requested_modify");
		return mav;
	}
	
	@RequestMapping(value ="gas_requested_detail/{id}", method = RequestMethod.GET)
	public ModelAndView gas_request_detail(HttpServletRequest httpRequest,@PathVariable String id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("requestedId", id);
		
		
//		ResponseResult responseResult = new ResponseResult();
//		responseResult = service.getDataRequestById(id);.
		
		mav.addObject("requestObj",service.getRequestedDetail(id));
		
		
		mav.setViewName("gas_requested_detail");
		return mav;
	}
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ResponseResult saveOrUpdate(@ModelAttribute("util") Requested request,
			RedirectAttributes redir) {
		logger.info("GasRequestCtrl :=> saveOrUpdate"+request);

		ResponseResult responseResult = new ResponseResult();
		responseResult = service.saveOrUpdate(request);
		return responseResult;
	}
	

}
