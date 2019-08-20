package th.co.keihin.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Year;
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
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFFont;
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
	public static ByteArrayInputStream partToExcel(PartMasterBean bean) throws IOException {
//	public static ByteArrayInputStream partToExcel(List<PartMasterBean> bean) throws IOException {
		String[] COLUMNs = { "Keihin Thermal Tecnology (Thailand) Co.,Ltd."
				, "M/C Qty."
				, "Approve"
				, "Check"
				, "Issued"
				};
		Workbook workbook = new XSSFWorkbook(); 
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		
		try {
			
			// create excel xls sheet
		    Sheet sheet = workbook.createSheet("PartMaster");		    
		    //sheet.setDefaultColumnWidth(30);
			
		    // create style
		    CellStyle styleBold = workbook.createCellStyle();
		    CellStyle styleHeader = workbook.createCellStyle();
		    		   		    
		    //Font
		    Font fontHeader = workbook.createFont();
		    fontHeader.setFontHeightInPoints((short)16);
		    fontHeader.setFontName("Arial");
		    fontHeader.setColor(HSSFColor.BLACK.index);
		    fontHeader.setBold(true);
		    fontHeader.setItalic(false);
		    styleHeader.setFont(fontHeader);
		    
		    Font fontBold = workbook.createFont();
		    fontBold.setFontHeightInPoints((short)10);
		    fontBold.setFontName("Arial");
		    fontBold.setBold(true);
		    fontBold.setColor(HSSFColor.BLACK.index);
		    fontBold.setBold(true);
		    styleBold.setFont(fontBold);
		    		    
		    CellStyle rotation90 = workbook.createCellStyle();
		    rotation90.setRotation((short)90);
		    rotation90.setFont(fontBold);
		    	    
		    //set header style		    
		    CellStyle rowHeaderStyle = workbook.createCellStyle();
		    rowHeaderStyle.setAlignment(HorizontalAlignment.LEFT);
		    rowHeaderStyle.setFont(fontHeader);
		    
//		    private static List<Employee> employees =  new ArrayList<>();
		    
		    // create header row
		    Row firstRow = sheet.createRow(0);
		    Cell title = firstRow.createCell(8);
		    title.setCellValue("Spare Part Machine");
		    title.setCellStyle(styleHeader);		    
		   		    
		    // Create a secondRow
	        Row secondRow = sheet.createRow(1);
	        
		    // Set Value to Cell	        
	        Cell facName = secondRow.createCell(1);
	        facName.setCellValue("Keihin Thermal Tecnology (Thailand) Co.,Ltd.");
	        facName.setCellStyle(styleBold);

	        Cell mcQty = secondRow.createCell(9);
	        mcQty.setCellValue("M/C Qty.");
	        mcQty.setCellStyle(styleBold);
	        
	        Cell approve = secondRow.createCell(15);
	        approve.setCellValue("Approve");
	        approve.setCellStyle(styleBold);
	        
	        Cell check = secondRow.createCell(18);
	        check.setCellValue("Check");
	        check.setCellStyle(styleBold);
	        	        	        
	        Cell issued = secondRow.createCell(21);
	        issued.setCellValue("Issued");
	        issued.setCellStyle(styleBold);
	        
    
	        
		    //Merge (start - row, end - row, start - col, end - col)
	        //Header
	        //sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 54));	        

	        //Company
	        sheet.addMergedRegion(new CellRangeAddress(1, 1, 1, 8));
		    
		    //M/C Qty
		    sheet.addMergedRegion(new CellRangeAddress(1, 2, 9, 10));
		    sheet.addMergedRegion(new CellRangeAddress(3, 4, 9, 10));
		    
		    //Approve
		    //header
		    sheet.addMergedRegion(new CellRangeAddress(1, 1, 15, 17));
		    //sign
		    sheet.addMergedRegion(new CellRangeAddress(2, 5, 15, 17));
		    //footer
		    sheet.addMergedRegion(new CellRangeAddress(6, 6, 15, 17));
		    
		    //Check
		    //header
		    sheet.addMergedRegion(new CellRangeAddress(1, 1, 18, 20));
		    //sign
		    sheet.addMergedRegion(new CellRangeAddress(2, 5, 18, 20));		    
		    //footer
		    sheet.addMergedRegion(new CellRangeAddress(6, 6, 18, 20));
		    
		    //Issued
		    //header
		    sheet.addMergedRegion(new CellRangeAddress(1, 1, 21, 23));		    
		    //sign
		    sheet.addMergedRegion(new CellRangeAddress(2, 5, 21, 23));		    
		    //footer
		    sheet.addMergedRegion(new CellRangeAddress(6, 6, 21, 23));		    
		    
		    
		    Row plant = sheet.createRow(2);
		    plant.createCell(1).setCellValue("Plant : ");
		    plant.getCell(1).setCellStyle(styleBold);

		    //Merge (start - row, end - row, start - col, end - col)
		    sheet.addMergedRegion(new CellRangeAddress(2, 2, 1, 2));
		    //data
		    //
		    //Merge (start - row, end - row, start - col, end - col)
		    sheet.addMergedRegion(new CellRangeAddress(2, 2, 3, 8));
		    
		    Row section = sheet.createRow(3);
		    section.createCell(1).setCellValue("Section : ");
		    section.getCell(1).setCellStyle(styleBold);
		    
		    //Merge (start - row, end - row, start - col, end - col)
		    sheet.addMergedRegion(new CellRangeAddress(3, 3, 1, 2));
		    //data
		    //
		    //Merge (start - row, end - row, start - col, end - col)
		    sheet.addMergedRegion(new CellRangeAddress(3, 3, 3, 8));

		    Row line = sheet.createRow(4);
		    line.createCell(1).setCellValue("Line Name : ");
		    line.getCell(1).setCellStyle(styleBold);

		    //Merge (start - row, end - row, start - col, end - col)
		    sheet.addMergedRegion(new CellRangeAddress(4, 4, 1, 2));
		    //data
		    //
		    //Merge (start - row, end - row, start - col, end - col)
		    sheet.addMergedRegion(new CellRangeAddress(4, 4, 3, 8));

//***************************************************************************************		    
		    //Header before data		 
	        Row eightRow = sheet.createRow(8);
	        Row nineRow = sheet.createRow(9);
	        Row tenRow = sheet.createRow(10);
	        
		    // Set Value to Cell	        
	        Cell colItem = eightRow.createCell(0);
	        colItem.setCellValue("Item");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 0, 0));
	        colItem.setCellStyle(rotation90);	        

	        Cell mcName = eightRow.createCell(1);
	        mcName.setCellValue("M/C Name");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 1, 2));
	        mcName.setCellStyle(styleBold);

	        Cell detail = eightRow.createCell(3);
	        detail.setCellValue("Detail");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 3, 7));
	        detail.setCellStyle(styleBold);
	        
	        Cell maker = eightRow.createCell(8);
	        maker.setCellValue("Brand / Maker");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 8, 12));
	        maker.setCellStyle(styleBold);
	        
	        Cell model = eightRow.createCell(13);
	        model.setCellValue("Model / Type");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 13, 17));
	        model.setCellStyle(styleBold);
	        
	        Cell stock = eightRow.createCell(18);
	        stock.setCellValue("Qty");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 18, 18));
	        stock.setCellStyle(rotation90);
	        
	        	        
	        int year = Year.now().getValue();

	        //Apr
	        Cell aprCol = eightRow.createCell(19);
	        aprCol.setCellValue("Apr - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 19, 21));

	        Cell aprStk = nineRow.createCell(19);
	        aprStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 19, 20));

	        Cell aprActual = nineRow.createCell(21);
	        aprActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 21, 21));
	        
	        Cell aprIn = tenRow.createCell(19);
	        Cell aprOut = tenRow.createCell(20);	        
	        aprIn.setCellValue("In");
	        aprOut.setCellValue("Out");
	        
	        //May
	        Cell mayCol = eightRow.createCell(22);
	        mayCol.setCellValue("May - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 22, 24));
	        
	        Cell mayStk = nineRow.createCell(22);
	        mayStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 22, 23));
	        
	        Cell mayActual = nineRow.createCell(24);
	        mayActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 24, 24));
	        
	        Cell mayIn = tenRow.createCell(22);
	        Cell mayOut = tenRow.createCell(23);	        
	        mayIn.setCellValue("In");
	        mayOut.setCellValue("Out");
	        
	        //Jun
	        Cell junCol = eightRow.createCell(25);
	        junCol.setCellValue("Jun - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 25, 27));
	        
	        Cell junStk = nineRow.createCell(25);
	        junStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 25, 26));
	        
	        Cell junActual = nineRow.createCell(27);
	        junActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 27, 27));
	        
	        Cell junIn = tenRow.createCell(25);
	        Cell junOut = tenRow.createCell(26);	        
	        junIn.setCellValue("In");
	        junOut.setCellValue("Out");
	        
	        //Jul
	        Cell julCol = eightRow.createCell(28);
	        julCol.setCellValue("Jul - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 28, 30));
	        
	        Cell julStk = nineRow.createCell(28);
	        julStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 28, 29));
	        
	        Cell julActual = nineRow.createCell(30);
	        julActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 30, 30));
	        
	        Cell julIn = tenRow.createCell(28);
	        Cell julOut = tenRow.createCell(29);	        
	        julIn.setCellValue("In");
	        julOut.setCellValue("Out");
	        
	        //Aug
	        Cell augCol = eightRow.createCell(31);
	        augCol.setCellValue("Aug - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 31, 33));
	        
	        Cell augStk = nineRow.createCell(31);
	        augStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 31, 32));
	        
	        Cell augActual = nineRow.createCell(33);
	        augActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 33, 33));
	        
	        Cell augIn = tenRow.createCell(31);
	        Cell augOut = tenRow.createCell(32);	        
	        augIn.setCellValue("In");
	        augOut.setCellValue("Out");
	        
	        //Sep
	        Cell sepCol = eightRow.createCell(34);
	        sepCol.setCellValue("Sep - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 34, 36));
	        
	        Cell sepStk = nineRow.createCell(34);
	        sepStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 34, 35));
	        
	        Cell sepActual = nineRow.createCell(36);
	        sepActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 36, 36));
	        
	        Cell sepIn = tenRow.createCell(34);
	        Cell sepOut = tenRow.createCell(35);	        
	        sepIn.setCellValue("In");
	        sepOut.setCellValue("Out");
	        
	        //Oct
	        Cell octCol = eightRow.createCell(37);
	        octCol.setCellValue("Oct - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 37, 39));
	        
	        Cell octStk = nineRow.createCell(37);
	        octStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 37, 38));
	        
	        Cell octActual = nineRow.createCell(39);
	        octActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 39, 39));
	        
	        Cell octIn = tenRow.createCell(37);
	        Cell octOut = tenRow.createCell(38);	        
	        octIn.setCellValue("In");
	        octOut.setCellValue("Out");
	        
	        //Nov
	        Cell novCol = eightRow.createCell(40);
	        novCol.setCellValue("Nov - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 40, 42));
	        
	        Cell novStk = nineRow.createCell(40);
	        novStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 40, 41));
	        
	        Cell novActual = nineRow.createCell(42);
	        novActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 42, 42));
	        
	        Cell novIn = tenRow.createCell(40);
	        Cell novOut = tenRow.createCell(41);	        
	        novIn.setCellValue("In");
	        novOut.setCellValue("Out");
	        
	        //Dec
	        Cell decCol = eightRow.createCell(43);
	        decCol.setCellValue("Dec - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 43, 45));
	        
	        Cell decStk = nineRow.createCell(43);
	        decStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 43, 44));
	        
	        Cell decActual = nineRow.createCell(45);
	        decActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 45, 45));
	        
	        Cell decIn = tenRow.createCell(43);
	        Cell decOut = tenRow.createCell(44);	        
	        decIn.setCellValue("In");
	        decOut.setCellValue("Out");
	        
	        //Jan
	        Cell janCol = eightRow.createCell(46);
	        janCol.setCellValue("Jan - " + Integer.toString(year +1));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 46, 48));
	        
	        Cell janStk = nineRow.createCell(46);
	        janStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 46, 47));
	        
	        Cell janActual = nineRow.createCell(48);
	        janActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 48, 48));
	        
	        Cell janIn = tenRow.createCell(46);
	        Cell janOut = tenRow.createCell(47);	        
	        janIn.setCellValue("In");
	        janOut.setCellValue("Out");
	        
	        //Feb
	        Cell febCol = eightRow.createCell(49);
	        febCol.setCellValue("Feb - " + Integer.toString(year +1));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 49, 51));
	        
	        Cell febStk = nineRow.createCell(49);
	        febStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 49, 50));
	        
	        Cell febActual = nineRow.createCell(51);
	        febActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 51, 51));
	        
	        Cell febIn = tenRow.createCell(49);
	        Cell febOut = tenRow.createCell(50);	        
	        febIn.setCellValue("In");
	        febOut.setCellValue("Out");
	        
	        //Mar
	        Cell marCol = eightRow.createCell(52);
	        marCol.setCellValue("Mar - " + Integer.toString(year +1));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 52, 54));
	        
	        Cell marStk = nineRow.createCell(52);
	        marStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 52, 53));
	        
	        Cell marActual = nineRow.createCell(54);
	        marActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 54, 54));
	        
	        Cell marIn = tenRow.createCell(52);
	        Cell marOut = tenRow.createCell(53);	        
	        marIn.setCellValue("In");
	        marOut.setCellValue("Out");
	        
	        
//***************************************************************************************		    
		    
		    
		    
		    //Resize all columns to fit the content size
		    sheet.autoSizeColumn(0);
		    
		    //Data
		   
		    
			
			workbook.write(out);
				
			
		}catch (IOException e) {
            e.printStackTrace();
        }	
		
		return new ByteArrayInputStream(out.toByteArray());
	}
	
	public DataTableAjax<PartMasterBean> getSparePart_Report(MachineBean bean) {	
		List param = new ArrayList();
		param.add(bean.getMachine_ID());		
		int updateRecord = jdbcTemplate.update("{call sp_Report_Sparepart(?)}", param.toArray() );
		
		return null;
		
	}
	//################################################### Report

}
