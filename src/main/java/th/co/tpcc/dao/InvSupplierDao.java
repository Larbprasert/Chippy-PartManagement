
package th.co.tpcc.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import th.co.baiwa.common.persistence.dao.AbstractCommonJdbcDao;
import th.co.tpcc.model.InvSupplier;

@Repository("invSupplierDao")
public class InvSupplierDao extends AbstractCommonJdbcDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;
    protected final static String SQL_SELECT = buildSelectStatement();
    protected final static String SQL_INSERT = buildInsertStatement();
    protected final static String SQL_UPDATE = buildUpdateStatement();
    protected final static String SQL_DELETE = buildDeleteStatement();

    private final static String buildSelectStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("   SUP_ID ");
        sql.append("   ,SUP_CODE ");
        sql.append("   ,SUP_NAME_TH ");
        sql.append("   ,SUP_NAME_EN ");
        sql.append("   ,CREATE_DATE ");
        sql.append("   ,CREATE_BY ");
        sql.append("   ,UPDATE_DATE ");
        sql.append("   ,UPDATE_BY ");
        sql.append(" FROM inv_supplier");
        return sql.toString();
    }

    private final static String buildInsertStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO inv_supplier ( ");
        sql.append("   SUP_CODE ");
        sql.append("   ,SUP_NAME_TH ");
        sql.append("   ,SUP_NAME_EN ");
        sql.append("   ,CREATE_DATE ");
        sql.append("   ,CREATE_BY ");
        sql.append("   ,UPDATE_DATE ");
        sql.append("   ,UPDATE_BY ");
        sql.append(" ) ");
        sql.append(" VALUES (?,?,?,?,?,?,?) ");
        return sql.toString();
    }

    private final static String buildUpdateStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE inv_supplier ");
        sql.append(" SET ");
        sql.append("   SUP_CODE = ? ");
        sql.append("   ,SUP_NAME_TH = ? ");
        sql.append("   ,SUP_NAME_EN = ? ");
        sql.append("   ,CREATE_DATE = ? ");
        sql.append("   ,CREATE_BY = ? ");
        sql.append("   ,UPDATE_DATE = ? ");
        sql.append("   ,UPDATE_BY = ? ");
        sql.append(" WHERE ");
        sql.append("   SUP_ID = ? ");
        return sql.toString();
    }

    private final static String buildDeleteStatement() {
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM inv_supplier ");
        sql.append(" WHERE ");
        sql.append("   SUP_ID = ? ");
        return sql.toString();
    }

    
    public List<InvSupplier> selectAll() {
        List<InvSupplier> resultList = jdbcTemplate.query(SQL_SELECT, BeanPropertyRowMapper.newInstance(InvSupplier.class));
        return resultList;
    }

    
    public InvSupplier selectById(Integer supId) {
        StringBuilder sql = new StringBuilder();
        sql.append(SQL_SELECT);
        sql.append(" WHERE ");
        sql.append("   SUP_ID = ? ");
        InvSupplier result = jdbcTemplate.queryForObject(sql.toString(), BeanPropertyRowMapper.newInstance(InvSupplier.class), new Object[] {supId });
        return result;
    }

    
    public int insert(InvSupplier invSupplier) {
        int insertRecord = jdbcTemplate.update(SQL_INSERT, new Object[] {invSupplier.getSupCode(), invSupplier.getSupNameTh(), invSupplier.getSupNameEn(), invSupplier.getCreateDate(), invSupplier.getCreateBy(), invSupplier.getUpdateDate(), invSupplier.getUpdateBy()});
        return insertRecord;
    }

    
    public int update(InvSupplier invSupplier) {
        int updateRecord = jdbcTemplate.update(SQL_UPDATE, new Object[] {invSupplier.getSupCode(), invSupplier.getSupNameTh(), invSupplier.getSupNameEn(), invSupplier.getCreateDate(), invSupplier.getCreateBy(), invSupplier.getUpdateDate(), invSupplier.getUpdateBy(), invSupplier.getSupId()});
        return updateRecord;
    }

    
    public int delete(Integer supId) {
        int deleteRecord = jdbcTemplate.update(SQL_DELETE, new Object[] {supId });
        return deleteRecord;
    }

}
