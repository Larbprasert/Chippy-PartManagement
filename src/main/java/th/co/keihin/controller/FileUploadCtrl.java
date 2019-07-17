package th.co.keihin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import th.co.baiwa.common.ApplicationCache;
import th.co.baiwa.common.bean.DataTableAjax;
import th.co.keihin.model.FileUploadBean;
import th.co.keihin.service.FileUploadService;
import th.co.tpcc.model.FilUploadResponse;
import th.co.tpcc.model.FilUploadResponseList;
import th.co.tpcc.model.FileDeleteResponse;
import th.co.tpcc.model.FileMeta;
import th.co.tpcc.model.SysParam;

@RestController
@RequestMapping("/fileUpload")
public class FileUploadCtrl {
	
	@Autowired
	private Environment environment;
	
	@Autowired
	private FileUploadService uploadService;
	
//	private String uploadPath = environment.getProperty("file.upload.path");
	 
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView displayForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("file_upload");
//		tring uploadPath = environment.getProperty("file.upload.path");
//		uploadPath = environment.getProperty("file.upload.path");
//		System.out.println("uploadPath : "+uploadPath);
		return mav;
	} 
    
    LinkedList<FileMeta> files = new LinkedList<FileMeta>();
//    FileMeta fileMeta = null;
    
    /***************************************************
     * URL: /rest/controller/upload  
     * upload(): receives files
     * @param request : MultipartHttpServletRequest auto passed
     * @param response : HttpServletResponse auto passed
     * @return LinkedList<FileMeta> as json format
     * @throws UnsupportedEncodingException 
     ****************************************************/
    @RequestMapping(value="/uploadFile", method = RequestMethod.POST)
    public @ResponseBody FilUploadResponseList upload(
    		MultipartHttpServletRequest request, HttpServletResponse response,
    		 String reqId, String type) throws UnsupportedEncodingException {
    	FilUploadResponseList respList = new FilUploadResponseList();
    	ArrayList<FilUploadResponse> uparr = new ArrayList();
    	DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        //1. build an iterator
    	
    	request.setCharacterEncoding("UTF-8");
    	
         Iterator<String> itr =  request.getFileNames();
         MultipartFile mpf = null;
         
	     SysParam UPLOAD_PATH = ApplicationCache.getParamGroupValue("PARAM_TYPE","UPLOAD_PATH");
         String uploadPath = UPLOAD_PATH.getValue_2()!=null? UPLOAD_PATH.getValue_2():environment.getProperty("file.upload.path");
 
//         Long eqIds = new Long(eqId);
         
         //2. get each file
         while(itr.hasNext()){
        	 String dates = df.format(new Date());
        	 
             //2.1 get next MultipartFile
             mpf = request.getFile(itr.next()); 
             
            String ofileName = new String(mpf.getOriginalFilename().getBytes(), "UTF-8");
             
             System.out.println("reqId : "+reqId);
             System.out.println("Name : "+ofileName +", "+mpf.getSize());
 
             //2.2 if files > 10 remove the first from the list
             if(files.size() >= 10)
                 files.pop();
             
             //2.3 create new fileMeta
             String fileName = dates+"."+this.getSuffix(ofileName);
             FileMeta fileMeta = new FileMeta();
             fileMeta.setFileName(fileName);
             fileMeta.setFileSize(mpf.getSize()/1024+" KB");
             fileMeta.setFileType(mpf.getContentType());
 
             try {
            	 
                fileMeta.setBytes(mpf.getBytes());
 
                 // copy file to local disk (make sure the path "e.g. D:/temp/files" exists)        
//                String file = uploadPath+mpf.getOriginalFilename();
                String fileId = uploadPath + fileName;
//                System.out.println("upload file : "+fileId);
                FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream(fileId));
                
                FileUploadBean document = new FileUploadBean();
                document.setReqId(reqId);
                document.setType(type);
                document.setFileId(fileId);
                document.setFileName(ofileName);
                document.setFileType(fileMeta.getFileType());
                document.setFileDesc("1".equals(type)? "Before":"After");
                document.setFileSize(fileMeta.getFileSize());
                
                uploadService.insert(document);
           
                fileMeta.setFileId(reqId);
                
                FilUploadResponse fileObj = new FilUploadResponse();
                fileObj.setDeleteUrl( request.getContextPath()+"/fileUpload/fileRemove/"+document.getId());
                fileObj.setDeleteType("GET");
                fileObj.setUrl(request.getContextPath()+"/fileUpload/get/"+document.getId());
//                fileObj.setUrl(uploadPath+fileMeta.getFileName());
//                fileObj.setThumbnail_url(request.getRequestURL()+"/file/get/"+document.getId());
                fileObj.setName(ofileName);
                fileObj.setSize(fileMeta.getFileSize());
                fileObj.setType(fileMeta.getFileType());
                fileObj.setId(document.getId());
                
                uparr.add(fileObj);
//                System.out.println(fileObj.getDeleteUrl());
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
             //2.4 add to files
             files.add(fileMeta);
         }
        // result will be like this
        // [{"fileName":"app_engine-85x77.png","fileSize":"8 Kb","fileType":"image/png"},...]
        
         respList.setFiles(uparr);
        return respList;
    }
    /***************************************************
     * URL: /rest/controller/get/{value}
     * get(): get file as an attachment
     * @param response : passed by the server
     * @param value : value from the URL
     * @return void
     ****************************************************/
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    public void get(HttpServletResponse response,@PathVariable String id){
//         FileMeta getFile = files.get(Integer.parseInt(id));
         try {      
        	 System.out.println("getFile  : "+id);
        	 	FileUploadBean document = uploadService.selectById(id);
                response.setContentType(document.getFileType());
                response.setHeader("Content-disposition", "attachment; filename=\""+document.getFileName()+"\"");
                FileCopyUtils.copy(new FileInputStream(document.getFileId()), response.getOutputStream());
//                response.flush();
         }catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
         }
     }
    
    @RequestMapping(value ="/fileRemove/{id}", method = RequestMethod.GET)
	public @ResponseBody FileDeleteResponse fileRemove(HttpServletResponse response,@PathVariable String id) {
    	FileDeleteResponse resp = new FileDeleteResponse();
    	System.out.println("Remove : "+id);
    	FileUploadBean document = uploadService.selectById(id);
    	try{
//            String uploadPath = environment.getProperty("file.upload.path");

    		System.out.println("file path : "+document.getFileId());
    		File file = new File(document.getFileId());
        	
    		if(file.delete()){
    	    	uploadService.delete(id);
    	    	resp.setResponse("true");
    	    	//"{'"+document.getFileName()+"':true}";
    		}else{
    			resp.setResponse("false");//"{'"+document.getFileName()+"':false}";
    		}
    	}catch(Exception e){
    		
    		e.printStackTrace();
    		resp.setResponse("false"); //"{'"+document.getFileName()+"':false}";
    	}
    
//		mav.addObject("SAVE_STATUS", "S");
//		return "SUCCESS";
    	return resp;
	}
    
    private String getSuffix(String filename) {
        String suffix = "";
        int pos = filename.lastIndexOf('.');
        if (pos > 0 && pos < filename.length() - 1) {
            suffix = filename.substring(pos + 1);
        }
        return suffix;
    }
   /* 
	@RequestMapping(value = "/getFileUpload", method = RequestMethod.GET)
	public @ResponseBody FilUploadResponseList getFileUpload(HttpServletRequest request,
			HttpServletResponse response, @RequestParam("reqId") String reqId) {
		String uploadPath = environment.getProperty("file.upload.path");
		FilUploadResponseList respList = new FilUploadResponseList();
		ArrayList<FilUploadResponse> responses = new ArrayList();

		List<FileUploadBean> documents = uploadService.select(new Long(reqId));
		for (FileUploadBean document : documents) {
				
			FilUploadResponse fileObj = new FilUploadResponse();
	        fileObj.setDeleteUrl( request.getContextPath()+"/fileUpload/fileRemove/"+document.getId());
	        fileObj.setDeleteType("GET");
            fileObj.setUrl(request.getContextPath()+"/fileUpload/get/"+document.getId());
//	        fileObj.setUrl(request.getContextPath()++"/file/+document.getFileName());
	//        fileObj.setThumbnail_url(request.getRequestURL()+"/file/get/"+document.getId());
	        fileObj.setName(document.getFileName());
	        fileObj.setSize(document.getFileSize());
	        fileObj.setType(document.getFileType());
	        responses.add(fileObj);
		
		}
		respList.setFiles(responses);
		return respList;
	} */
	
	@RequestMapping(value = "/getFileList.json")
	public DataTableAjax<FileUploadBean> getFileList(FileUploadBean bean) {
//		logger.info(" getDataTable.getDataTable ");
		DataTableAjax dataTableAjax = new DataTableAjax<>();
		dataTableAjax = uploadService.getFileList(bean);
		return dataTableAjax;
	}
	
}
