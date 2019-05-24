package th.co.portal.controller.envi;

import java.text.ParseException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.portal.model.envi.PRTRChemical;
import th.co.portal.service.envi.PRTRChemicalService;

@RestController
@RequestMapping("/PRTRChemical/")
public class PRTRChemicalCtrl {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PRTRChemicalService service;

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public DataTableAjax<PRTRChemical> search(@RequestParam("name") String name, @RequestParam("status") String status)
			throws ParseException {
		logger.info("PRTRChemicalCtrl => status :" + status + " name :" + name);

		DataTableAjax<PRTRChemical> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(name, status);
		return dataTableAjax;
	}

	@RequestMapping(value = "save", method = RequestMethod.POST)
	public DataTableAjax<String> saveOrUpdate(@ModelAttribute("util") PRTRChemical prtrChemical,
			RedirectAttributes redir) {
		logger.info("saveOrUpdate => status :" + prtrChemical);
		service.saveOrUpdate(prtrChemical);
		DataTableAjax<String> dataTableAjax = new DataTableAjax<>();

		// dataTableAjax.setData(null);
		return dataTableAjax;
	}

	@RequestMapping(value = "getDataOnSelect", method = RequestMethod.GET)
	public DataTableAjax<PRTRChemical> getDataOnSelect() {
		logger.info("saveOrUpdate => status ");

		DataTableAjax<PRTRChemical> dataTableAjax = new DataTableAjax<>();

		dataTableAjax = service.getDataOnSelect();
		return dataTableAjax;
	}

}
