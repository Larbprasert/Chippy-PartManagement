package th.co.tpcc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.co.tpcc.dao.HistoryReportDao;
import th.co.tpcc.model.CourseTraining;


@Service("historyReportService")
public class HistoryReportService{

	@Autowired
	private HistoryReportDao historyReportDao;
	

	public List getReport01(CourseTraining courseTraining) {
		return historyReportDao.getReport01(courseTraining);
	}

	
}
