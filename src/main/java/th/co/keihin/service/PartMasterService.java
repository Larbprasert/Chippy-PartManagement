package th.co.keihin.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Month;
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
import org.apache.poi.ss.util.CellUtil;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


@Repository("partMasterService")
public class PartMasterService {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private MachineService machineService;

	@Autowired
	private ProductionLineService productionLineService;
	

	
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
		    sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 54));	        
		    Row firstRow = sheet.createRow(0);
		    Cell title = firstRow.createCell(0);
		    title.setCellValue("Spare Part Machine");
		    title.setCellStyle(styleHeader);	
	        CellUtil.setAlignment(title, HorizontalAlignment.LEFT);
		    
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
	        //Company
	        sheet.addMergedRegion(new CellRangeAddress(1, 1, 1, 8));
		    
		    //M/C Qty
		    sheet.addMergedRegion(new CellRangeAddress(1, 2, 9, 10));
		    CellUtil.setAlignment(mcQty, HorizontalAlignment.CENTER);
		    
		    sheet.addMergedRegion(new CellRangeAddress(3, 4, 9, 10));
		    
		    //Approve
		    //header
		    sheet.addMergedRegion(new CellRangeAddress(1, 1, 15, 17));
		    CellUtil.setAlignment(approve, HorizontalAlignment.CENTER);
		    //sign
		    sheet.addMergedRegion(new CellRangeAddress(2, 5, 15, 17));
		    //footer
		    sheet.addMergedRegion(new CellRangeAddress(6, 6, 15, 17));
		    
		    //Check
		    //header
		    sheet.addMergedRegion(new CellRangeAddress(1, 1, 18, 20));
		    CellUtil.setAlignment(check, HorizontalAlignment.CENTER);
		    //sign
		    sheet.addMergedRegion(new CellRangeAddress(2, 5, 18, 20));		    
		    //footer
		    sheet.addMergedRegion(new CellRangeAddress(6, 6, 18, 20));
		    
		    //Issued
		    //header
		    sheet.addMergedRegion(new CellRangeAddress(1, 1, 21, 23));
		    CellUtil.setAlignment(issued, HorizontalAlignment.CENTER);
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
		    plant.createCell(3).setCellValue("xxxx");
		    //Merge (start - row, end - row, start - col, end - col)
		    sheet.addMergedRegion(new CellRangeAddress(2, 2, 3, 8));
		    
		    Row section = sheet.createRow(3);
		    section.createCell(1).setCellValue("Section : ");
		    section.getCell(1).setCellStyle(styleBold);
		    
		    //Merge (start - row, end - row, start - col, end - col)
		    sheet.addMergedRegion(new CellRangeAddress(3, 3, 1, 2));
		    //data
		    section.createCell(3).setCellValue("xxxx");
		    //Merge (start - row, end - row, start - col, end - col)
		    sheet.addMergedRegion(new CellRangeAddress(3, 3, 3, 8));

		    Row line = sheet.createRow(4);
		    line.createCell(1).setCellValue("Line Name : ");
		    line.getCell(1).setCellStyle(styleBold);
		    //Merge (start - row, end - row, start - col, end - col)
		    sheet.addMergedRegion(new CellRangeAddress(4, 4, 1, 2));
		    //data
		    line.createCell(3).setCellValue("xxx");
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
	        CellUtil.setAlignment(mcName, HorizontalAlignment.CENTER);

	        Cell detail = eightRow.createCell(3);
	        detail.setCellValue("Detail");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 3, 7));
	        detail.setCellStyle(styleBold);
	        CellUtil.setAlignment(detail, HorizontalAlignment.CENTER);
	        
	        Cell maker = eightRow.createCell(8);
	        maker.setCellValue("Brand / Maker");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 8, 12));
	        maker.setCellStyle(styleBold);
	        CellUtil.setAlignment(maker, HorizontalAlignment.CENTER);
	        
	        Cell model = eightRow.createCell(13);
	        model.setCellValue("Model / Type");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 13, 17));
	        model.setCellStyle(styleBold);
	        CellUtil.setAlignment(model, HorizontalAlignment.CENTER);

	        Cell rank = eightRow.createCell(18);
	        rank.setCellValue("Rank");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 18, 18));
	        rank.setCellStyle(styleBold);
	        rank.setCellStyle(rotation90);
	        
	        Cell stock = eightRow.createCell(19);
	        stock.setCellValue("Qty");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 19, 19));
	        stock.setCellStyle(rotation90);
	        
	        //Set Year	        
	        int currentYear = Year.now().getValue();
	        int lastYear = Year.now().getValue() - 1;
	        int nextYear = Year.now().getValue() + 1;
	        
	        LocalDate today = LocalDate.now();
	        int month = today.getMonthValue();
	       
	        int year = (Year.now().getValue() == currentYear) ? currentYear : (Year.now().getValue() > lastYear) ? lastYear : nextYear   ;
	        	
	        //Apr
	        Cell aprCol = eightRow.createCell(20);
	        aprCol.setCellValue("Apr - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 20, 22));

	        Cell aprStk = nineRow.createCell(20);
	        aprStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 20, 21));

	        Cell aprActual = nineRow.createCell(22);
	        aprActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 22, 22));	        
	        
	        Cell aprIn = tenRow.createCell(20);
	        Cell aprOut = tenRow.createCell(21);	        
	        aprIn.setCellValue("In");
	        aprOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(aprCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(aprStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(aprActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(aprIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(aprOut, HorizontalAlignment.CENTER);	        
	        
	        //May
	        Cell mayCol = eightRow.createCell(23);
	        mayCol.setCellValue("May - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 23, 25));
	        
	        Cell mayStk = nineRow.createCell(23);
	        mayStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 23, 24));
	        
	        Cell mayActual = nineRow.createCell(25);
	        mayActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 25, 25));
	        
	        Cell mayIn = tenRow.createCell(23);
	        Cell mayOut = tenRow.createCell(24);	        
	        mayIn.setCellValue("In");
	        mayOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(mayCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(mayStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(mayActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(mayIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(mayOut, HorizontalAlignment.CENTER);
	        
	        //Jun
	        Cell junCol = eightRow.createCell(26);
	        junCol.setCellValue("Jun - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 26, 28));
	        
	        Cell junStk = nineRow.createCell(26);
	        junStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 26, 27));
	        
	        Cell junActual = nineRow.createCell(28);
	        junActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 28, 28));
	        
	        Cell junIn = tenRow.createCell(26);
	        Cell junOut = tenRow.createCell(27);	        
	        junIn.setCellValue("In");
	        junOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(junCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(junStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(junActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(junIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(junOut, HorizontalAlignment.CENTER);
	        
	        //Jul
	        Cell julCol = eightRow.createCell(29);
	        julCol.setCellValue("Jul - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 29, 31));
	        
	        Cell julStk = nineRow.createCell(29);
	        julStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 29, 30));
	        
	        Cell julActual = nineRow.createCell(31);
	        julActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 31, 31));
	        
	        Cell julIn = tenRow.createCell(29);
	        Cell julOut = tenRow.createCell(30);	        
	        julIn.setCellValue("In");
	        julOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(julCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(julStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(julActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(julIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(julOut, HorizontalAlignment.CENTER);
	        
	        //Aug
	        Cell augCol = eightRow.createCell(32);
	        augCol.setCellValue("Aug - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 32, 34));
	        
	        Cell augStk = nineRow.createCell(32);
	        augStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 32, 33));
	        
	        Cell augActual = nineRow.createCell(34);
	        augActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 34, 34));
	        
	        Cell augIn = tenRow.createCell(32);
	        Cell augOut = tenRow.createCell(33);	        
	        augIn.setCellValue("In");
	        augOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(augCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(augStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(augActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(augIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(augOut, HorizontalAlignment.CENTER);
	        
	        //Sep
	        Cell sepCol = eightRow.createCell(35);
	        sepCol.setCellValue("Sep - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 35, 37));
	        
	        Cell sepStk = nineRow.createCell(35);
	        sepStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 35, 36));
	        
	        Cell sepActual = nineRow.createCell(37);
	        sepActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 37, 37));
	        
	        Cell sepIn = tenRow.createCell(35);
	        Cell sepOut = tenRow.createCell(36);	        
	        sepIn.setCellValue("In");
	        sepOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(sepCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(sepStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(sepActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(sepIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(sepOut, HorizontalAlignment.CENTER);
	        
	        //Oct
	        Cell octCol = eightRow.createCell(38);
	        octCol.setCellValue("Oct - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 38, 40));
	        
	        Cell octStk = nineRow.createCell(38);
	        octStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 38, 39));
	        
	        Cell octActual = nineRow.createCell(40);
	        octActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 40, 40));
	        
	        Cell octIn = tenRow.createCell(38);
	        Cell octOut = tenRow.createCell(39);	        
	        octIn.setCellValue("In");
	        octOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(octCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(octStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(octActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(octIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(octOut, HorizontalAlignment.CENTER);
	        
	        //Nov
	        Cell novCol = eightRow.createCell(41);
	        novCol.setCellValue("Nov - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 41, 43));
	        
	        Cell novStk = nineRow.createCell(41);
	        novStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 41, 42));
	        
	        Cell novActual = nineRow.createCell(43);
	        novActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 43, 43));
	        
	        Cell novIn = tenRow.createCell(41);
	        Cell novOut = tenRow.createCell(42);	        
	        novIn.setCellValue("In");
	        novOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(novCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(novStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(novActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(novIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(novOut, HorizontalAlignment.CENTER);
	        
	        //Dec
	        Cell decCol = eightRow.createCell(44);
	        decCol.setCellValue("Dec - " + Integer.toString(year));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 44, 46));
	        
	        Cell decStk = nineRow.createCell(44);
	        decStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 44, 45));
	        
	        Cell decActual = nineRow.createCell(46);
	        decActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 46, 46));
	        
	        Cell decIn = tenRow.createCell(44);
	        Cell decOut = tenRow.createCell(45);	        
	        decIn.setCellValue("In");
	        decOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(decCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(decStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(decActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(decIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(decOut, HorizontalAlignment.CENTER);
	        
	        //Jan
	        Cell janCol = eightRow.createCell(47);
	        janCol.setCellValue("Jan - " + Integer.toString(year +1));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 47, 49));
	        
	        Cell janStk = nineRow.createCell(47);
	        janStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 47, 48));
	        
	        Cell janActual = nineRow.createCell(49);
	        janActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 49, 49));
	        
	        Cell janIn = tenRow.createCell(47);
	        Cell janOut = tenRow.createCell(48);	        
	        janIn.setCellValue("In");
	        janOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(janCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(janStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(janActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(janIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(janOut, HorizontalAlignment.CENTER);
	        
	        //Feb
	        Cell febCol = eightRow.createCell(50);
	        febCol.setCellValue("Feb - " + Integer.toString(year +1));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 50, 52));
	        
	        Cell febStk = nineRow.createCell(50);
	        febStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 50, 51));
	        
	        Cell febActual = nineRow.createCell(52);
	        febActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 52, 52));
	        
	        Cell febIn = tenRow.createCell(50);
	        Cell febOut = tenRow.createCell(51);	        
	        febIn.setCellValue("In");
	        febOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(febCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(febStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(febActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(febIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(febOut, HorizontalAlignment.CENTER);
	        
	        //Mar
	        Cell marCol = eightRow.createCell(53);
	        marCol.setCellValue("Mar - " + Integer.toString(year +1));
	        sheet.addMergedRegion(new CellRangeAddress(8, 8, 53, 55));
	        
	        Cell marStk = nineRow.createCell(53);
	        marStk.setCellValue("Stock");
	        sheet.addMergedRegion(new CellRangeAddress(9, 9, 53, 54));
	        
	        Cell marActual = nineRow.createCell(55);
	        marActual.setCellValue("Actual");
	        sheet.addMergedRegion(new CellRangeAddress(9, 10, 55, 55));
	        
	        Cell marIn = tenRow.createCell(53);
	        Cell marOut = tenRow.createCell(54);	        
	        marIn.setCellValue("In");
	        marOut.setCellValue("Out");
	        
	        CellUtil.setAlignment(marCol, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(marStk, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(marActual, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(marIn, HorizontalAlignment.CENTER);
	        CellUtil.setAlignment(marOut, HorizontalAlignment.CENTER);	        
	        
	        Cell remainColEng = eightRow.createCell(56);
	        remainColEng.setCellValue("Remain");
	        sheet.addMergedRegion(new CellRangeAddress(8, 10, 56, 56));	        
//	        CellUtil.setAlignment(remainColEng, HorizontalAlignment.CENTER);	        
	        remainColEng.setCellStyle(rotation90);
	        
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
