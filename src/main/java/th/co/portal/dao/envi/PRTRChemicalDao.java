package th.co.portal.dao.envi;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.baiwa.common.util.DateUtils;
import th.co.portal.model.envi.ChartResponse;
import th.co.portal.model.envi.PRTRChemical;

@Repository("PRTRChemicalDao")
public class PRTRChemicalDao extends AbstractCommonJdbcDao {
	protected final static String SQL_INSERT = buildInsertStatement();
	protected final static String SQL_UPDATE = buildUpdateStatement();

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public DataTableAjax<PRTRChemical> getDataTable(String name, String status) {
		logger.info("### getDataTable :PRTRChemical ");
		DataTableAjax result = new DataTableAjax<>();

		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT * FROM she_prtr_chemical WHERE 1 = 1 ");

		List wh = new ArrayList<>();

		if (StringUtils.isNotEmpty(name)) {
			wh.add("%" + name + "%");
			sql.append(" AND NAME_OF_CHEMICAL LIKE   ? ");
		}

		if (StringUtils.isNotEmpty(status)) {
			wh.add(status);
			sql.append(" AND STATUS =   ? ");
		}

		sql.append(" ORDER BY CREATE_DATE ASC ");

		List<PRTRChemical> list = (List<PRTRChemical>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		int total = list != null ? list.size() : 0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}

	public DataTableAjax<PRTRChemical> getDataOnSelect() {
		logger.info("### getDataTable :PRTRChemical ");
		DataTableAjax result = new DataTableAjax<>();

		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT * FROM she_prtr_chemical WHERE 1 = 1 ");

		List wh = new ArrayList<>();

//		if (StringUtils.isNotEmpty(id)) {
//			wh.add(id);
//			sql.append(" AND ID =   ? ");
//		}

//		if (StringUtils.isNotEmpty(status)) {
//			wh.add(status);
			sql.append(" AND STATUS =   'Y' ");
//		}

//		if (StringUtils.isNotEmpty(type)) {
//			if ("tpcc".equalsIgnoreCase(type)) {
//				sql.append(" AND TPCC_ACTIVE ='A' ");
//			} else {
//				sql.append(" AND TPAC_ACTIVE ='A' ");
//			}
//
//		}

		sql.append(" ORDER BY NAME_OF_CHEMICAL desc ");

		List<PRTRChemical> list = (List<PRTRChemical>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		int total = list != null ? list.size() : 0;
		result.setRecordsTotal(total);
		result.setRecordsFiltered(total);
		result.setData(list);
		return result;
	}

	public ChartResponse<PRTRChemical> getDataChart(PRTRChemical param) {
		ChartResponse result = new ChartResponse<>();

		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT * FROM she_prtr_chemical WHERE 1 = 1");

		List wh = new ArrayList<>();

		// if(StringUtils.isNotEmpty(param.getPeriodFrom())){
		// wh.add( param.getPeriodFrom() );
		// sql.append(" AND period >= ? ");
		// }
		//
		// if(StringUtils.isNotEmpty(param.getPeriodTo())){
		// wh.add( param.getPeriodTo() );
		// sql.append(" AND period <= ? ");
		// }
		//
		// if(StringUtils.isNotEmpty(param.getCompanyName())){
		// wh.add( param.getCompanyName() );
		// sql.append(" AND company_code = ? ");
		// }
		//
		// if(StringUtils.isNotEmpty(param.getParameter_code())){
		// wh.add( param.getParameter_code() );
		// sql.append(" AND parameter_code = ? ");
		// }
		sql.append(" ORDER BY period ASC ");

		List<PRTRChemical> list = (List<PRTRChemical>) executeQuery(sql.toString(), wh.toArray(), DB_ROW_MAPPER);
		result.setData(list);
		return result;

	}

	public int insert(PRTRChemical prtrChemical) {
		Long insertRecord = executeInsert(SQL_INSERT,
				new Object[] { prtrChemical.getNameOfChemical(), prtrChemical.getMoleculaFormular(),
						prtrChemical.getCasNo(), prtrChemical.getTpccActive(), prtrChemical.getTpacActive(),
						prtrChemical.getStatus(), prtrChemical.getCreateBy() });
		return insertRecord.intValue();
	}

	public int update(PRTRChemical prtrChemical) {
		int updateRecord = jdbcTemplate.update(SQL_UPDATE,
				new Object[] { prtrChemical.getNameOfChemical(), prtrChemical.getMoleculaFormular(),
						prtrChemical.getCasNo(), prtrChemical.getTpccActive(), prtrChemical.getTpacActive(),
						prtrChemical.getStatus(), prtrChemical.getUpdateBy(), prtrChemical.getId() });
		return updateRecord;
	}

	private final static String buildInsertStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" INSERT INTO she_prtr_chemical ( ");
		sql.append(" NAME_OF_CHEMICAL              ");
		sql.append(",MOLECULA_FORMULAR              ");
		sql.append(",CAS_NO      ");
		sql.append(",TPCC_ACTIVE       ");
		sql.append(",TPAC_ACTIVE      ");
		sql.append(",STATUS 		 ");
		sql.append(",CREATE_DATE      ");
		sql.append(",CREATE_BY        ");
		sql.append(" ) ");
		sql.append(" VALUES (?,?,?,?,?,?,GETDATE(),?) ");
		return sql.toString();
	}

	private final static String buildUpdateStatement() {
		StringBuilder sql = new StringBuilder();
		sql.append(" UPDATE she_prtr_chemical ");
		sql.append(" SET ");
		sql.append(" NAME_OF_CHEMICAL    =?  ");
		sql.append(" ,MOLECULA_FORMULAR    =?  ");
		sql.append(" ,CAS_NO    =?   ");
		sql.append(" ,TPCC_ACTIVE 	 =?	 ");
		sql.append(" ,TPAC_ACTIVE =?     ");
		sql.append(" ,STATUS =? 		 ");
		sql.append(" ,UPDATE_DATE = GETDATE() ");
		sql.append(" ,UPDATE_BY = ? ");
		sql.append(" WHERE ");
		sql.append("   ID = ? ");
		return sql.toString();
	}

	private RowMapper DB_ROW_MAPPER = new RowMapper() {
		@Override
		public PRTRChemical mapRow(ResultSet rs, int rowNum) throws SQLException {
			PRTRChemical m = new PRTRChemical();
			m.setId(rs.getInt("ID"));
			m.setNameOfChemical(rs.getString("NAME_OF_CHEMICAL"));
			m.setMoleculaFormular(rs.getString("MOLECULA_FORMULAR"));
			m.setCasNo(rs.getString("CAS_NO"));
			m.setTpccActive(rs.getString("TPCC_ACTIVE"));
			m.setTpacActive(rs.getString("TPAC_ACTIVE"));
			m.setStatus(rs.getString("STATUS"));

			m.setCreateBy(rs.getString("CREATE_BY"));
			m.setCreateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("CREATE_DATE")));
			m.setCreateDate(rs.getDate("CREATE_DATE"));

			m.setUpdateBy(rs.getString("UPDATE_BY"));
			m.setUpdateDateStr(DateUtils.get_current_ddMMyyyy__from_date(rs.getTimestamp("UPDATE_DATE")));
			m.setUpdateDate(rs.getDate("UPDATE_DATE"));

			return m;
		}
	};

}
