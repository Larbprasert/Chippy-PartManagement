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
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.PRTREmission;
import th.co.portal.service.envi.PRTREmissionService;

@RestController
@RequestMapping("/PRTREmission/")
public class PRTREmissionCtrl {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PRTREmissionService service;

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public DataTableAjax<PRTREmission> search(@RequestParam("company") String company,
			@RequestParam("year") String year) throws ParseException {
		logger.info("PRTRChemicalCtrl => company :" + company + " year :" + year);

		DataTableAjax<PRTREmission> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = service.getDataTable(company, year);

		return dataTableAjax;
	}

	@RequestMapping(value = "save", method = RequestMethod.POST)
	public DataTableAjax<String> saveOrUpdate(@ModelAttribute("util") PRTREmission prtrEmission,
			RedirectAttributes redir) {
		logger.info("saveOrUpdate => status :" + prtrEmission);
		service.saveOrUpdate(prtrEmission);
		DataTableAjax<String> dataTableAjax = new DataTableAjax<>();

		// dataTableAjax.setData(null);
		return dataTableAjax;
	}

	@RequestMapping(value = "getDataChart")
	public ChartResponse<PRTREmission> getDataChart(@ModelAttribute("ambientAir") PRTREmission ambientAir)
			throws ParseException {

		ChartResponse<PRTREmission> data = new ChartResponse<>();
		data = service.getDataChart(ambientAir);
		return data;
	}

}
