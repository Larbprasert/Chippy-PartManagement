package th.co.keihin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.keihin.model.RequestBean;
import th.co.keihin.service.CheckToolService;
import th.co.keihin.service.LocationService;
import th.co.keihin.service.RequestService;
import th.co.keihin.service.RequestTypeService;
import th.co.keihin.service.SectionService;
import th.co.portal.model.gas.Requested;
import th.co.portal.model.gas.ResponseResult;


@RestController
public class RequestCtrl {
	
	@Autowired
	private RequestTypeService requestTypeService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private CheckToolService checkToolService;
	
	@Autowired
	private SectionService sectionService;
	
	@Autowired
	private RequestService requestService;
	
		
//	
	@RequestMapping("/request/requested_list.htm")
	public ModelAndView request_list(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("LOV_APPSTATUS",ApplicationCache.getLovAppStatus());
		mav.addObject("LOV_SECTION",sectionService.loadActiveSection());
		mav.addObject("LOV_REQUESTTYPE",requestTypeService.loadActiveRequestType());

		mav.setViewName("requested_list");
		return mav;
	}
	
	@RequestMapping("/request/requested_view.htm")
	public ModelAndView request_view(HttpServletRequest httpRequest, RequestBean bean) {
		ModelAndView mav = new ModelAndView();

//		mav.addObject("requestBean",requestService.getRequestBeanByID(bean.getPart_ID()));

		mav.setViewName("requested_view");
		return mav;
	}
	
	@RequestMapping(value ="/request/requested_detail/{reqId}", method = RequestMethod.GET)
	public ModelAndView requested_detail(HttpServletRequest httpRequest,@PathVariable String reqId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("requestedId", reqId);
		
		
		mav.addObject("LOV_REQUESTTYPE",requestTypeService.loadActiveRequestType());
		mav.addObject("LOV_LOCATION",locationService.loadActiveLocation());
		
		mav.addObject("LOV_CHECKTOOLBEFORE", checkToolService.loadCheckToolBefore());
		mav.addObject("LOV_CHECKTOOLAFTER", checkToolService.loadCheckToolAfter());
		
		mav.addObject("LOV_JUDMENT", ApplicationCache.getLovJudment());
		mav.addObject("LOV_MAINTENANCETYPE", ApplicationCache.getLovMaintenanceType());
		
//		ResponseResult responseResult = new ResponseResult();
//		responseResult = service.getDataRequestById(id);.
		
		mav.addObject("requestObj",requestService.getRequestedDetail(reqId));
		
		
		
		mav.setViewName("requested_detail");
		return mav;
	}
	
	@RequestMapping("/request/requested_new.htm")
	public ModelAndView request_create(HttpServletRequest httpRequest, RequestBean bean) {
		ModelAndView mav = new ModelAndView();
		
//		mav.addObject("requestBean",requestService.getRequestBeanByID(bean.getPart_ID()));
		
//		mav.addObject("LOV_SECTION",sectionService.loadActiveSection());
		
		mav.addObject("LOV_REQUESTTYPE",requestTypeService.loadActiveRequestType());
		mav.addObject("LOV_LOCATION",locationService.loadActiveLocation());
		
		mav.addObject("LOV_CHECKTOOLBEFORE", checkToolService.loadCheckToolBefore());
		mav.addObject("LOV_CHECKTOOLAFTER", checkToolService.loadCheckToolAfter());
		
		mav.addObject("LOV_JUDMENT", ApplicationCache.getLovJudment());
		mav.addObject("LOV_MAINTENANCETYPE", ApplicationCache.getLovMaintenanceType());
//		
		
		List ROLE_REQ_MNG =  requestService.findUserByRoleSec("ROLE_REQ_MNG", bean.getUserProfile().getSection().getSection_ID());
		List ROLE_MT_MNG = requestService.findUserByRoleSec("ROLE_MT_MNG",null);
		
		
		mav.addObject("APPROVE_LD", ROLE_REQ_MNG);
		mav.addObject("APPROVE_ACH", ROLE_MT_MNG);
		
//		mav.addObject("LOV_ACTIVE_FLG",ApplicationCache.getLovActiveFlag());
		
		mav.setViewName("requested_new");
		return mav;
	}
	
	@RequestMapping("/request/requested_edit/{reqId}")
	public ModelAndView request_edit(HttpServletRequest httpRequest,@PathVariable String reqId) {
		ModelAndView mav = new ModelAndView();
		 
		mav.addObject("LOV_REQUESTTYPE",requestTypeService.loadActiveRequestType());
		mav.addObject("LOV_LOCATION",locationService.loadActiveLocation());
		
		mav.addObject("LOV_CHECKTOOLBEFORE", checkToolService.loadCheckToolBefore());
		mav.addObject("LOV_CHECKTOOLAFTER", checkToolService.loadCheckToolAfter());
		
		mav.addObject("LOV_JUDMENT", ApplicationCache.getLovJudment());
		mav.addObject("LOV_MAINTENANCETYPE", ApplicationCache.getLovMaintenanceType());
		
//		ResponseResult responseResult = new ResponseResult();
//		responseResult = service.getDataRequestById(id);.
		RequestBean bean = requestService.getRequestedDetail(reqId);
		mav.addObject("requestObj",bean);
		

		List ROLE_REQ_MNG =  requestService.findUserByRoleSec("ROLE_REQ_MNG", bean.getSection().getSection_ID());
		List ROLE_MT_MNG = requestService.findUserByRoleSec("ROLE_MT_MNG",null);
		
		List ROLE_MT_STAFF = requestService.findUserByRoleSec("ROLE_MT_STAFF",null);
		List ROLE_QA = requestService.findUserByRoleSec("ROLE_QA",null);
		
		
		mav.addObject("APPROVE_LD", ROLE_REQ_MNG);
		mav.addObject("APPROVE_ACH", ROLE_MT_MNG);
		mav.addObject("ROLE_MT_STAFF", ROLE_MT_STAFF);
		mav.addObject("ROLE_QA", ROLE_QA);
		
				
		mav.setViewName("requested_modify");
		return mav;
	}
	
	@RequestMapping("/request/requested_save")
	public ModelAndView request_save(HttpServletRequest httpRequest, RequestBean bean, String rAction) {
		
		requestService.requestSave(bean);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:../request/requested_edit/"+bean.getrequest_ID());
		mav.addObject("status","S");
		
		return mav;
	}
	
	@RequestMapping(value = "/request/requestUpdate", method = RequestMethod.POST)
	public ResponseResult requestUpdate( RequestBean request,
			RedirectAttributes redir,HttpServletRequest httpRequest) {
		
		ResponseResult responseResult = new ResponseResult();
		responseResult = requestService.requestUpdate(httpRequest,request);
		
		return responseResult;
	}
	
	@RequestMapping("/request/search.json")
	public DataTableAjax<RequestBean> search(HttpServletRequest request, HttpServletResponse response,RequestBean bean) throws ServletException, IOException {
		DataTableAjax<RequestBean> dataTableAjax = requestService.getAll(bean);
		return dataTableAjax;
	}
}
