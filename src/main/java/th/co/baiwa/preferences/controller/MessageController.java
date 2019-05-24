package th.co.baiwa.preferences.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.bean.EditDataTableRespone;
import th.co.baiwa.common.constant.CommonConstants.ANGULAR2;
import th.co.baiwa.preferences.entity.Message;
import th.co.baiwa.preferences.service.MessageService;

@Controller
@RequestMapping(value = "/admin")
public class MessageController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value = "/message.htm", method = RequestMethod.GET)
	public ModelAndView param(HttpServletRequest httpRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(ANGULAR2.VIWE_NAME);
		mav.addObject(ANGULAR2.APP_NAME, "baiwa/message.main");
		
		return mav;
	}
	
	@RequestMapping(value = "/getMessageAll.json", method = RequestMethod.POST)
	public @ResponseBody DataTableAjax<Message> getMessageAll(Integer start,Integer length) {
		DataTableAjax<Message> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = messageService.getMessageAll(start,length);
		
		return dataTableAjax;
	}
	
	@RequestMapping(value = "/getMessageAction.json", method = RequestMethod.POST)
	public @ResponseBody EditDataTableRespone<Message> getMessageAction(@RequestBody EditDataTableRespone<Message> editDataTable) {
		logger.info("editDataTable");
		try{
			messageService.getMessageAction(editDataTable);
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			editDataTable.setError( e.getMessage());
		}
		
		return editDataTable;
	}
	
}
