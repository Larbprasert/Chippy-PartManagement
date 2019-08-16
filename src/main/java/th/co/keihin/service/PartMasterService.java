package th.co.keihin.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import th.co.baiwa.common.bean.DataTableAjax;
import th.co.keihin.model.UnitTypeBean;
import th.co.portal.model.gas.ResponseResult;
import th.co.keihin.model.LocationBean;
import th.co.keihin.model.MachineBean;
import th.co.keihin.model.MakerBean;
import th.co.keihin.model.MoldTypeBean;
import th.co.keihin.model.PartMasterBean;
import th.co.keihin.model.RepairDetail;

//*********************************************Excel
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


@Repository("partMasterService")
public class PartMasterService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private RowMapper PARTMASTER_MAPPER = new RowMapper(){
		
		
		public PartMasterBean mapRow(ResultSet rs, int rowNum) throws SQLException {

			PartMasterBean partMaster = new PartMasterBean();
			UnitTypeBean unitType = new UnitTypeBean();
			LocationBean location = new LocationBean();
			MakerBean maker = new MakerBean();
			MoldTypeBean moldType = new MoldTypeBean();
			
			
			partMaster.setSysPart_ID(rs.getString("sysPart_ID"));
			
			partMaster.setPart_ID(rs.getString("part_ID"));
			partMaster.setPart_name(rs.getString("part_name"));
			
			partMaster.setMin_stock(rs.getInt("min_stock"));
			partMaster.setMax_stock(rs.getInt("max_stock"));
			partMaster.setQty(rs.getInt("qty"));
			
			partMaster.setPrice(rs.getFloat("price"));				
			
			partMaster.setActiveFlag(rs.getInt("activeFlag"));				
			partMaster.setActiveFlag_name(rs.getString("activeFlag_name"));
			
			partMaster.setCreateBy(rs.getString("createBy"));
			partMaster.setCreateDate(rs.getDate("createDate"));
			partMaster.setUpdateBy(rs.getString("updateBy"));
			partMaster.setUpdateDate(rs.getDate("updateDate"));
		
			unitType.setUnitType_ID(rs.getString("unitType_ID"));
			unitType.setUnitType_name(rs.getString("unitType_name"));
			partMaster.setUnitType(unitType);
			
			location.setLocation_ID(rs.getString("location_ID"));
			location.setLocation_name(rs.getString("location_name"));
			partMaster.setLocation(location);;
			
			maker.setMaker_ID(rs.getString("maker_ID"));
			maker.setMaker_name(rs.getString("maker_name"));
			partMaster.setMaker(maker);
			
			moldType.setMoldType_ID(rs.getString("moldType_ID"));
			moldType.setMoldType_name(rs.getString("moldType_name"));
			partMaster.setMoldType(moldType);
			
//			partMaster.setMovementCode(rs.getInt("movementCode"));
//			partMaster.setMovement_name(rs.getString("movement_name"));
			
//			partMaster.setQty_before(rs.getInt("qty_before"));

			partMaster.setRank(rs.getInt("rank"));				
			partMaster.setRank_name(rs.getString("rank_name"));

					
			return partMaster;
		}
	};
	
	
	public PartMasterBean getPartMasterBeanByID(String partMaster_ID) {
		// TODO Auto-generated method stub
				
		String query = "Select pm.* "
				+ ",ut.unitType_name "
				+ ",lc.location_name "
				+ ",mk.maker_name "
				+ ",mt.moldType_Name "
				+ ",act.value1 as activeFlag_name "
				+ ",rank.value1 as rank_name "
				+ "From tb_partMaster pm "
				+ "LEFT JOIN tb_UnitType ut ON pm.unitType_ID = ut.unitType_ID "
				+ "LEFT JOIN tb_Location lc ON pm.location_ID = lc.location_ID "
				+ "LEFT JOIN tb_Maker mk ON pm.maker_ID = mk.maker_ID COLLATE database_default "
				+ "LEFT JOIN tb_MoldType mt ON pm.moldType_ID = mt.moldType_ID "
				+ "LEFT JOIN tbm_misc_data act on pm.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' "
				+ "LEFT JOIN tbm_misc_data rank on pm.rank = rank.misc_code and rank.misc_type = 'Ranking' "
				+ "where 1=1 "
				+ "and pm.activeFlag <> 2 " 
				+ "and pm.part_ID='" + partMaster_ID +"'"; 
		List<PartMasterBean> list = jdbcTemplate.query(query,PARTMASTER_MAPPER);
		 
	    return  list!=null&& list.size()>0? list.get(0) : new PartMasterBean();
	}

	
	public DataTableAjax<PartMasterBean> getAll(PartMasterBean bean) {
		// TODO Auto-generated method stub
		
		DataTableAjax<PartMasterBean> listPartMaster = new DataTableAjax<PartMasterBean>();
		
		//String query = "select * from tb_PartMaster where 1=1 and activeFlag <> 2 order by Part_ID";
		String query = "Select pm.* "
				+ ",ut.unitType_name "
				+ ",lc.location_name "
				+ ",mk.maker_name "
				+ ",mt.moldType_Name "
				+ ",act.value1 as activeFlag_name "
				+ ",rank.value1 as rank_name "
				+ "From tb_partMaster pm "
				+ "LEFT JOIN tb_UnitType ut ON pm.unitType_ID = ut.unitType_ID "
				+ "LEFT JOIN tb_Location lc ON pm.location_ID = lc.location_ID "
				+ "LEFT JOIN tb_Maker mk ON pm.maker_ID = mk.maker_ID COLLATE database_default "
				+ "LEFT JOIN tb_MoldType mt ON pm.moldType_ID = mt.moldType_ID "
				+ "LEFT JOIN tbm_misc_data act on pm.activeFlag = act.misc_code and act.misc_type = 'ActiveFlag' "
				+ "LEFT JOIN tbm_misc_data rank on pm.rank = rank.misc_code and rank.misc_type = 'Ranking' "
				+ "where 1=1 "
				+ "and pm.activeFlag <> 2 ";
				
		if(StringUtils.isNotEmpty(bean.getPart_name())){
			query += " and ( pm.part_ID like '%"+bean.getPart_name()+"%' " ;
			query += " or pm.part_name like '%"+bean.getPart_name()+"%' ) " ;
		}
		
		if(StringUtils.isNotEmpty(bean.getSysPart_ID())){
			query += " and pm.part_ID not in ( SELECT pa.part_ID from  tb_RepairDetail pa where pa.request_ID = '"+bean.getSysPart_ID()+"' ) " ;
		}
		
		
		query += "order by pm.part_ID";
		
		System.out.println(query);
		
		List<PartMasterBean> list = jdbcTemplate.query(query,PARTMASTER_MAPPER);
		
		int total = list!=null? list.size():0;
		listPartMaster.setRecordsTotal(total);
		listPartMaster.setRecordsFiltered(total);
		listPartMaster.setData(list);
		
		return listPartMaster;
	}

	
	public void saveOrUpdate(PartMasterBean obj) {
		if(StringUtils.isNotEmpty(obj.getPart_ID())){
			edit(obj);
		}else{
			save(obj);
		}
	}


	
	public void save(PartMasterBean PartMaster) {
		// TODO Auto-generated method stub
		System.out.println("############################### Save");
    	System.out.println("Part_ID: " + PartMaster.getPart_ID());
		
		try {
			
			String query =
				"insert into tb_PartMaster(sysPart_ID,"
						+ "Part_ID,"
						+ "Part_name,"
						+ "unitType_ID,"
						+ "location_ID,"
						+ "maker_ID,"
						+ "moldType_ID,"
						+ "min_stock,"
						+ "max_stock,"
						+ "qty,"
						+ "price,"
						+ "activeFlag,"
						+ "rank,"
						+ "createDate,"
						+ "createBy) "+
						"values(?,?,?,?,?,?,?,?,?,?,?,?,?,getdate(),?) ";
			jdbcTemplate.update(query,
					new Object[] {  
							"sys" + PartMaster.getPart_ID(),
							
							PartMaster.getPart_ID(),
							PartMaster.getPart_name(),
							
							PartMaster.getUnitType().getUnitType_ID(),
							PartMaster.getLocation().getLocation_ID(),
							PartMaster.getMaker().getMaker_ID(),
							PartMaster.getMoldType().getMoldType_ID(),
							
							PartMaster.getMin_stock(),
							PartMaster.getMax_stock(),
							PartMaster.getQty(),
							PartMaster.getPrice(),
							PartMaster.getActiveFlag(),
							PartMaster.getRank(),
							PartMaster.getCreateBy(),
							});
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;		
	}

	
	public void delete(PartMasterBean PartMaster) {
		// TODO Auto-generated method stub
		try {
			
			String query = ("update tb_PartMaster set activeFlag = 2, updateBy=?, updateDate=getdate() Where 1=1 and sysPart_ID=?");
			
			int updateRecord = jdbcTemplate.update(query,
					new Object[] {  
							PartMaster.getUpdateBy(),							
//							PartMaster.getSysPart_ID()
							"sys" + PartMaster.getPart_ID()
							});	

		} catch (Exception e) {
			e.printStackTrace();
		}			
	}

	
	public void edit(PartMasterBean PartMaster) {
		// TODO Auto-generated method stub
				
		try {

			
	    	String query = ("Update tb_PartMaster "+
					"Set part_ID=?,"
					+ "part_name=?, " 
					+ "unitType_ID=?,"
					+ "location_ID=?,"
					+ "maker_ID=?,"
					+ "moldType_ID=?,"
					+ "min_stock=?,"
					+ "max_stock=?,"
					+ "qty=?,"
					+ "price=?,"
					+ "activeFlag=?,"
					+ "rank=?,"
					+ "updateBy=?, "
					+ "updateDate=getdate() "
					+ "where 1=1 "+
					"and sysPart_ID=? ");
	    	
//			System.out.println("Edit Part_ID = " + PartMaster.getPart_ID());
//			System.out.println("Movement Code = " + PartMaster.getMovementCode());
//			System.out.println("Qty Before = " + PartMaster.getQty_before());
	    	
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					PartMaster.getPart_ID(),
							PartMaster.getPart_name(),
							
							PartMaster.getUnitType().getUnitType_ID(),
							PartMaster.getLocation().getLocation_ID(),
							PartMaster.getMaker().getMaker_ID(),
							PartMaster.getMoldType().getMoldType_ID(),
							
							PartMaster.getMin_stock(),
							PartMaster.getMax_stock(),
							PartMaster.getQty(),
							PartMaster.getPrice(),
							PartMaster.getActiveFlag(),
							PartMaster.getRank(),
							
							PartMaster.getUpdateBy(),
							
							"sys" + PartMaster.getPart_ID()
	    					});
	    	
	    	List param = new ArrayList();
			param.add(PartMaster.getPart_ID());
			param.add(PartMaster.getQty_before());
			param.add(PartMaster.getQty());
			param.add(PartMaster.getMovementCode());
			param.add(PartMaster.getUpdateBy());
			param.add("Master");
			int insertMovement = jdbcTemplate.update("{call sp_PartMovement_Insert(?,?,?,?,?,?)}", param.toArray() );

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	
	
	
	public void editByMovement(PartMasterBean PartMaster) {
		// TODO Auto-generated method stub
		
		try {

			
	    	String query = ("Update tb_PartMaster "+
					"Set qty=?, "
					+ "updateBy=?, "
					+ "updateDate=getdate() "
					+ "where 1=1 "+
					"and part_ID=? ");
	    	int updateRecord = jdbcTemplate.update(query,
	    			new Object[] {  
	    					PartMaster.getQty(),
							PartMaster.getUpdateBy(),
							
							PartMaster.getPart_ID()
	    					});

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	
	
	//################################################### Report
	private static final String _FILENAME = "../MyFirstExcel.xlsx";
//	
//	public class ExcelView extends AbstractXlsView{
//
//		@Override
//		protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
//				HttpServletResponse response) throws Exception {
//			// TODO Auto-generated method stub
//			// change the file name
//		    response.setHeader("Content-Disposition", "attachment; filename=\"my-exported-file.xls\"");
//
//		    // create excel xls sheet
//		    Sheet sheet = workbook.createSheet("Users Detail");
//		    sheet.setDefaultColumnWidth(30);
//
//		    // create style for header cells
//		    CellStyle style = workbook.createCellStyle();
//		    Font font = workbook.createFont();
//		    font.setFontName("Arial");
//		    style.setFillForegroundColor(HSSFColor.BLUE.index);
//		    font.setColor(HSSFColor.BLACK.index);
//		    style.setFont(font);
//
//
//		    // create header row
//		    Row header = sheet.createRow(0);
//		    header.createCell(0).setCellValue("First Name");
//		    header.getCell(0).setCellStyle(style);
//		    header.createCell(1).setCellValue("Last Name");
//		    header.getCell(1).setCellStyle(style);
//		    header.createCell(2).setCellValue("Number");
//		    header.getCell(2).setCellStyle(style);
//		    header.createCell(3).setCellValue("Age");
//		    header.getCell(3).setCellStyle(style);			
//		}
//
//	}
	
	public static ByteArrayInputStream partToExcel(MachineBean bean) throws IOException {
//	public static ByteArrayInputStream partToExcel(List<PartMasterBean> bean) throws IOException {
		String[] COLUMNs = { "Id", "Name", "Qty"};
		Workbook workbook = new XSSFWorkbook(); 
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		
		try {
			Sheet sheet = workbook.createSheet("PartMaster");
			
			Font headerFont = workbook.createFont();
			headerFont.setBold(true);
			headerFont.setColor(IndexedColors.BLUE.getIndex());

			CellStyle headerCellStyle = workbook.createCellStyle();
			headerCellStyle.setFont(headerFont);

			// Header Row
			Row headerRow = sheet.createRow(0);
			
			// Table Header
			for (int col = 0; col < COLUMNs.length; col++) {
				Cell cell = headerRow.createCell(col);
				cell.setCellValue(COLUMNs[col]);
				cell.setCellStyle(headerCellStyle);
			}
			
			workbook.write(out);
				
			
		}catch (IOException e) {
            e.printStackTrace();
        }	
		
		return new ByteArrayInputStream(out.toByteArray());
	}
	
//	public void WriteExcel() {
//		try {
//					    
//			XSSFWorkbook workbook = new XSSFWorkbook();
//			XSSFSheet sheet = workbook.createSheet("Data");
//			
//	        Object[][] datatypes = {
//	                {"Datatype", "Type", "Size(in bytes)"},
//	                {"int", "Primitive", 2},
//	                {"float", "Primitive", 4},
//	                {"double", "Primitive", 8},
//	                {"char", "Primitive", 1},
//	                {"String", "Non-Primitive", "No fixed size"}
//	        };
//
//	        int rowNum = 0;
//	        System.out.println("Creating excel");
//
//	        for (Object[] datatype : datatypes) {
//	            Row row = sheet.createRow(rowNum++);
//	            int colNum = 0;
//	            for (Object field : datatype) {
//	                Cell cell = row.createCell(colNum++);
//	                if (field instanceof String) {
//	                    cell.setCellValue((String) field);
//	                } else if (field instanceof Integer) {
//	                    cell.setCellValue((Integer) field);
//	                }
//	            }
//	        }
//
//	        try {
//	            FileOutputStream outputStream = new FileOutputStream(_FILENAME);
//	            workbook.write(outputStream);
//	            workbook.close();
//	        } catch (FileNotFoundException e) {
//	            e.printStackTrace();
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        }
//
//	        System.out.println("Done");
//	        
//		}catch (Exception e) {
//			e.printStackTrace();
//		}		
//    }

	
	public DataTableAjax<PartMasterBean> getSparePart_Report(MachineBean bean) {	
		List param = new ArrayList();
		param.add(bean.getMachine_ID());		
		int updateRecord = jdbcTemplate.update("{call sp_Report_Sparepart(?)}", param.toArray() );
		
		return null;
		
	}
	//################################################### Report

}
