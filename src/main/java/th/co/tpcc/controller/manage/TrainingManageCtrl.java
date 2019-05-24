package th.co.tpcc.controller.manage;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFShape;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.tpcc.model.Course;
import th.co.tpcc.model.CourseOwner;
import th.co.tpcc.model.CourseTraining;
import th.co.tpcc.model.InvAssetHistory;
import th.co.tpcc.model.Owner;
import th.co.tpcc.service.AssetmanageService;
import th.co.tpcc.service.CourseTrainingService;
import th.co.tpcc.service.OwnerService;
import th.co.tpcc.service.PositionCourseService;

@RestController
@RequestMapping("/training_manage")
public class TrainingManageCtrl{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AssetmanageService trainingmanageService ;
	
	@Autowired
	private CourseTrainingService trainingService ;

	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private PositionCourseService positionService;
	
	@Autowired
	private Environment environment;
	
	@RequestMapping(value = "/getDataTable.json")
	public DataTableAjax<Owner> getDataTable(@ModelAttribute("owner") Owner owner) {
		logger.info(" getDataTable.getDataTable ");
		
		DataTableAjax<Owner> dataTableAjax = new DataTableAjax<>();
		dataTableAjax = ownerService.getDataTableOwnerTrain(owner);
		return dataTableAjax;
	}
	
	@RequestMapping(value = "/getDataTablePersonCourse.json")
	public DataTableAjax  getDataTablePersonCourse(CourseOwner owner) {
		logger.info(" getDataTable.getDataTable ");
		
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = ownerService.getDataTablePersonCourse(owner);
		return dataTableAjax;
	}
	
	@RequestMapping("/trainingEdit.htm")
	public ModelAndView trainingEdit(String ownerId) {
		logger.info(" trainingEdit : "+ownerId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("training_manage_edit");
		
		mav.addObject("LOV_OWNER_TYPE",ApplicationCache.getLovByType("OWNER_TYPE"));
		mav.addObject("LOV_TITLE",ApplicationCache.getLovByType("TITLE"));
		mav.addObject("LOV_GENDER",ApplicationCache.getLovByType("GENDER"));
		mav.addObject("LOV_SECTION",ApplicationCache.getLovByType("SECTION_MASTER"));
		mav.addObject("LOV_COMPANY",ApplicationCache.getLovByType("COMPANY"));
		mav.addObject("LOV_ACTIVE_TYPE",ApplicationCache.getLovByType("ACTIVE_TYPE"));
		mav.addObject("LOV_POSITION",ApplicationCache.getLovByType("POSITION_MASTER"));
		
		List<Course> courseList = positionService.getCourseList();
		mav.addObject("LOV_COURSE_LIST", courseList);

		
		Owner owner =  new Owner();
		if(StringUtils.isNotEmpty(ownerId)){
			owner =  ownerService.getOwnerById(ownerId);
		}
		mav.addObject("owner", owner);
		
//		InvAssetHistory invAssetHistory =  new InvAssetHistory();
//		if(StringUtils.isNotEmpty(trainingOwnerId)){
//			invAssetHistory =  trainingmanageService.getById(trainingOwnerId);
//		}
//		
//		mav.addObject("invAssetHistory", invAssetHistory);
		
		return mav;
	}
	
	@RequestMapping("/trainingPopup.htm")
	public ModelAndView trainingPopup(String trainingOwnerId) {
		ModelAndView mav = trainingEdit(trainingOwnerId);
		mav.setViewName("training_manage_popup");
		return mav;
	}
	
	@RequestMapping("/trainingSave.htm")
	public RedirectView saveOrUpdate(@ModelAttribute("invAssetHistory") InvAssetHistory invAssetHistory) {
		
		trainingmanageService.saveOrUpdate(invAssetHistory);
		RedirectView rv = new RedirectView();
	    rv.setUrl("trainingEdit.htm?status=S&edit=Y&trainingOwnerId="+invAssetHistory.getAssetOwnerId());
	    return rv;
	}
	
	@RequestMapping(value = "/print/{ownerId}", method = RequestMethod.GET)
    public void get(HttpServletResponse response,@PathVariable Integer ownerId){
         try {      
        	 System.out.println(" PRINT : "+ownerId);
        	 
        	 Owner owner = null;
        	 if( null!= ownerId){
	     		owner =  ownerService.getOwnerById(ownerId.toString());
	     		
	        	String fileIn = printTraining(owner, response);
	        	String FileName = "Training_History_"+owner.getOwnerCode()+".xlsx";
	        	
	        	response.setContentType("application/vnd.ms-excel;charset=UTF-8");
	        	
	        	response.setHeader("Content-disposition", "attachment; filename=\""+FileName+"\"");
	        	
	        	FileCopyUtils.copy(new FileInputStream(fileIn), response.getOutputStream());
	        	
	        	System.out.println("Delete File : "+fileIn);
	    		File file = new File(fileIn);
	        	
	    		if(file.delete()){
	    			System.out.println("Delete File Success ! ");
	    		}
	     	 }
        	 

         }catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
         }
     }
	
	  private String printTraining(Owner owner, HttpServletResponse response) {
		  
		  CourseTraining courseTraining = new CourseTraining();
     	  courseTraining.setOwnerId(owner.getOwnerId());
     	 List<CourseTraining> trainings = new ArrayList<CourseTraining>();
     	  if(null!=owner.getOwnerId()){
     		  trainings = trainingService.getDataTable(courseTraining).getData();
     	  }
     	 
//     	    String uploadPath = "F:/WEB BASE/SHEPortal/Upload/";
     	    String uploadPath = environment.getProperty("file.upload.path");
	    	DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	    	String dates = df.format(new Date());
	    	String FILE_NAME = uploadPath+"ExportTemp"+dates+".xlsx";

	        XSSFWorkbook workbook = new XSSFWorkbook();
	        XSSFSheet sheet = workbook.createSheet("Training");
//	        sheet.setDefaultColumnWidth(30);
	        
	        String[][] datatypes = {
	        		{""},
	        		{"","ประวัติการฝึกอบรม " },
	        		{"","แยกเป็นรายพนักงาน"},
	        		{""},
	        		{"","Contractor Number	   ","",owner.getOwnerCode()},
	                {"","Name – Surname        ","",owner.getTitleDesc()+" "+owner.getFirstName()+" "+owner.getLastName()},
	                {"","Company               ","",owner.getCompanyName()},
	                {"","Section/Department    ","",owner.getDeptName()},
	                {"","Job Position          ","",owner.getPositionName()},
	                {"","Starting Date of work ","",owner.getWorkStartDate() },
	                {"","Email                 ","",owner.getEmail()},
	                {"","Telephone Number      ","",owner.getMobile()},
	                {""},
	                {"", "No.", "Date", "Course Code", "Course Name Thai", "Course Name Eng", "	Total Price" }

	                
	        };
	        
	       
	        System.out.println("Creating excel");

//	        ######### Header #########
	        int rowNum = 0;
	        CellRangeAddress mergedCell = new CellRangeAddress(
	                1, //first row (0-based)
	                1, //last row  (0-based)
	                1, //first column (0-based)
	                6  //last column  (0-based)
	        );
	        sheet.addMergedRegion(mergedCell);
            for (int i = 4; i <12; i++) {
            	mergedCell = new CellRangeAddress(
            			i, //first row (0-based)
            			i, //last row  (0-based)
            			1, //first column (0-based)
            			2  //last column  (0-based)
            			);
            	sheet.addMergedRegion(mergedCell);
			}
	        
	        mergedCell = new CellRangeAddress(
	        		2, //first row (0-based)
	        		2, //last row  (0-based)
	        		1, //first column (0-based)
	        		6  //last column  (0-based)
	        		);
	        sheet.addMergedRegion(mergedCell);
	        
	        //add picture data to this workbook.
			try {
//				InputStream is = new FileInputStream("F:/WEB BASE/SHEPortal/Upload/20180424153746.jpg");
//				byte[] bytes = IOUtils.toByteArray(is);
				byte[] bytes = owner.getOwnerImage();
				int pictureIdx = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_JPEG);
//				is.close();
				
				CreationHelper helper = workbook.getCreationHelper();
				
				// Create the drawing patriarch.  This is the top level container for all shapes. 
				Drawing drawing = sheet.createDrawingPatriarch();
				//add a picture shape
				ClientAnchor anchor = helper.createClientAnchor();
				//set top-left corner of the picture,
				//subsequent call of Picture#resize() will operate relative to it
				anchor.setRow1(4);
				anchor.setRow2(10);
				
				anchor.setCol1(5);
				anchor.setCol2(5);
				
				anchor.setDx1(2 * XSSFShape.EMU_PER_PIXEL);
				anchor.setDy1(1 * XSSFShape.EMU_PER_PIXEL);

				Picture pict = drawing.createPicture(anchor, pictureIdx);
				//auto-size picture relative to its top-left corner
				pict.resize(1.2);
				
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			

        	CellStyle style = null;
        	Font font = null;
        	
	        for (Object[] datatype : datatypes) {
	            Row row = sheet.createRow(rowNum++);
	            
	            int colNum = 0;
	            for (Object field : datatype) {
	            	Cell cell = row.createCell(colNum++);
	            	cell.setCellValue((String) field);
//	            	System.out.println("rowNum:"+rowNum+", colNum:"+colNum+", field:"+field);
	            	
	            	if(colNum == 2){
	            		style = workbook.createCellStyle();
	            		font = workbook.createFont();
	            		font.setBoldweight(Font.BOLDWEIGHT_BOLD);
	            		style.setFont(font);
	            		if(rowNum==2){
		            		font.setColor(HSSFColor.BLUE.index);
		            		font.setFontHeightInPoints((short)18);
		            		style.setAlignment(HorizontalAlignment.CENTER);
	            		}
	            		if(rowNum==3){
	            			font.setFontHeightInPoints((short)14);
	            			style.setAlignment(HorizontalAlignment.CENTER);
	            		}
	            		cell.setCellStyle(style);
	            	}
	            	
	            	/*if(rowNum==3){
	            		style = workbook.createCellStyle();
	            		font = workbook.createFont();
	            		font.setBoldweight(Font.BOLDWEIGHT_BOLD);
		            	style.setFont(font);
	            		style.setAlignment(HorizontalAlignment.CENTER);
	            		cell.setCellStyle(style);
	            	}*/
	            	
	            	if(rowNum ==14 && colNum != 1){
	            		style = workbook.createCellStyle();
	            		font = workbook.createFont();
	            		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	            		font.setColor(HSSFColor.WHITE.index);
	            		style.setFillForegroundColor(HSSFColor.BLUE.index);
	                    style.setFillPattern(CellStyle.SOLID_FOREGROUND);
	            		style.setAlignment(HorizontalAlignment.CENTER);
	            		style.setFont(font);
	            		cell.setCellStyle(style);
	            	}
	            	
	            }
	        }

	        
//	        ######### Detail #########	        
	        int dNum = 1;
	        for (CourseTraining training : trainings) {
	        	  Row row1 = sheet.createRow(rowNum++);
	        	  Cell cell = row1.createCell(1);
	              cell.setCellValue(dNum++);
	              style = workbook.createCellStyle();
	              style.setAlignment(HorizontalAlignment.CENTER);
          		  cell.setCellStyle(style);
          		  
	              cell = row1.createCell(2);	              
	              cell.setCellValue(training.getCourseDateStr()+" - "+training.getCourseDateEndStr());
	              cell.setCellStyle(style);
	              
	              cell = row1.createCell(3);
	              cell.setCellValue(training.getCourseCode());
	              cell.setCellStyle(style);
	              
	              cell = row1.createCell(4);
	              cell.setCellValue(training.getCourseNameTh());
	              
	              cell = row1.createCell(5);
	              cell.setCellValue(training.getCourseNameEn());
	              
	              cell = row1.createCell(6);
	              cell.setCellValue(training.getCoursePrice()+"");
	              style = workbook.createCellStyle();
	              style.setAlignment(HorizontalAlignment.RIGHT);
	              cell.setCellStyle(style);
	              
			}
	        
	        
	        sheet.autoSizeColumn(2);
	        sheet.autoSizeColumn(3);
	        sheet.autoSizeColumn(4);
	        sheet.autoSizeColumn(5);
	        sheet.autoSizeColumn(6);
	        
	        try {
	        	
	            FileOutputStream outputStream = new FileOutputStream(FILE_NAME);
	            workbook.write(outputStream);
	            workbook.close();
//                FileCopyUtils.copy(new FileInputStream(FILE_NAME), response.getOutputStream());

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

			return FILE_NAME;
	    }
	
	
	public static void main(String[] args) {
		TrainingManageCtrl ctrl = new TrainingManageCtrl();
		Owner owner = new Owner();
		owner.setOwnerCode("XXXXXXX");
        owner.setFirstName("XXXXXXX");
		owner.setLastName("XXXXXXX");
        owner.setCompanyCode("XXXXXXX");
		owner.setCompanyName("XXXXXXX");
        owner.setDeptCode("XXXXXXX");
		owner.setDeptName("XXXXXXX");
        owner.setPosition("XXXXXXX");
		owner.setPositionName("XXXXXXX");
        owner.setWorkStartDate("XXXXXXX") ;
        owner.setEmail("XXXXXXX");
        owner.setMobile("XXXXXXX");
		ctrl.printTraining(owner,null);
	}
	
}
