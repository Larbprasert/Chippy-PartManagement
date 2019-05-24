<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
	
	<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-ui.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->
<noscript><link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-noscript.css"></noscript>
<noscript><link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-ui-noscript.css"></noscript>
	
</head>

<body>

	<!--  --- MENU --- -->
	<%@include file="/WEB-INF/jsp/tpcc/she/menu.jsp" %>
	 <div class="container">
		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-8 col-md-7 col-sm-6">
					<h3><i class='fa fa-edit'></i> Edit Course Training</h3>
				</div>
			</div>
		</div>


				<fieldset > 
					<div class="well box collapsed-box">
						<form class="form-horizontal" id="form" action="courseSave.htm"
							method="post" command="course" data-toggle="validator">  

							<div class="row">
								<div class="col-lg-12">
								
							<div class="col-lg-6">
							
								<!-- 	 <------- Don't forget this Haha -->
<%-- 								<input type="hidden" class="form-control" name="courseId" value="${course.courseId}"> --%>
								<input type="hidden" class="form-control" id="courseTrainId" name="courseTrainId" value="${course.courseTrainId}">
								
				                  
			 					<div class="form-group">
					                    <label for="courseCode" class="col-lg-4 control-label">Course Code/Group</label>
					                    <div class="col-lg-3">
					                      <input type="text" class="form-control" id="courseCode"  name="courseCode" 
											 value="${course.courseCode}" readonly>
					                    </div>
					                    <div class="col-lg-3">
					                      <input type="text" class="form-control" id="courseGenNo"  name="courseGenNo" 
											 value="${course.courseGenNo}" readonly>
					                    </div>
					             </div>
					             
			 				
						         
					           
					             
						          <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Name TH</label>
					                    <div class="col-lg-6">
					                       <input readonly type="text" class="form-control" name="courseNameTh" value="${course.courseNameTh}"  required>
					                    </div>
					             </div>

   
						          <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Course Start Date</label>
			                    <div class="col-lg-6">
						                <div class='input-group date'>
						                    <input type='text' class="form-control" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"   id='courseDate' name='courseDateStr' value="${course.courseDateStr}" required readonly/>
						                    <span class="input-group-addon">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
			                    </div>
			                  </div> 
			                  
					             
					               <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Lecturer</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="courseOwner" value="${course.courseOwner}" required>
					                    </div>
					             </div>
					                  
					                  <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Location</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="coursePlace" value="${course.coursePlace}"  required>
					                    </div>
					             </div>
					             
					           
					             
							</div>
							
							<div class="col-lg-6">
							 
						       
					              
					              <%-- 	<div class="form-group">
					                    <label for="courseCode" class="col-lg-4 control-label">Course Group</label>
					                    <div class="col-lg-6">
					                      <input type="text" class="form-control" id="courseGenNo"  name="courseGenNo" 
											 value="${course.courseGenNo}" readonly>
					                    </div>
					             </div> --%>
					             
				                    <div class="form-group">
				                    <label for="" class="col-lg-4 control-label">Course Type</label>
				                    <div class="col-lg-4">
				                             <select class="form-control" name="courseType" required disabled>
						                       	<option value="">${_ALL}</option>
						                       	<c:forEach var="item" items="${LOV_COURSE_TYPE}"> 
											        <option value="${item.code}" ${item.code == course.courseType ? 'selected="selected"' : ''}>${item.descTH}</option>
											    </c:forEach>
						                      </select>
				                    </div>
				                  </div>
					             
						         
						          <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Name EN</label>
					                    <div class="col-lg-6">
					                       <input readonly type="text" class="form-control" name="courseNameEn" value="${course.courseNameEn}" required>
					                    </div>
					             </div>
					          
					          
			                  
					                  
					          <div class="form-group">
				                    <label for="" class="col-lg-4 control-label">Course End Date</label>
				                    <div class="col-lg-6">
							                <div class='input-group date'>
							                    <input type='text' class="form-control"  pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='courseDateEnd' name='courseDateEndStr' value="${course.courseDateEndStr}" required readonly/>
							                    <span class="input-group-addon">
							                        <span class="glyphicon glyphicon-calendar"></span>
							                    </span>
							                </div>
				                    </div>
				                  </div> 
			                
			                  
			                   <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Price</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="coursePrice" value="${course.coursePrice}" required>
					                    </div>
					             </div>
					             

							</div>
</div>
							</div>




						<div class="row">
								<div class="col-lg-12">
									<div class="form-group ">
										<div class="col-lg-12 text-center">
											<button type="button" id="cancelBtn" class="btn btn-default">
												<i class="fa fa-times-circle"></i> Cancel
											</button>
											&nbsp;
<!-- 											<button type="button" class="btn btn-success" onclick="doAdd()"> -->
<!-- 												<i class="fa fa-plus"></i> Add Contractor  -->
<!-- 											</button>&nbsp; -->
											<button type="button" id="saveBtn" class="btn btn-primary">
												<i class="fa fa-check-square-o"></i> Save
											</button>
										</div>
									</div>
								</div>
							</div>
				
				
 
						</form>
					</div>
					
				</fieldset>
				
				<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<div class="row"><div class="col-lg-12">	



<div class="nav-tabs-custom"  >
		            <!-- Tabs within a box -->
		            <ul class="nav nav-tabs  ui-sortable-handle">
		              <li class="active"><a href="#historyCourse" data-toggle="tab" > <i class='fa fa-id-card'></i>   Contractor </a></li>
<!-- 		              <li class=""><a href="#needCourse" data-toggle="tab" > <i class='fa fa-check-square-o'></i>  Training Need by Job Position</a></li> -->
		              <li class=""><a href="#ownerDocument" data-toggle="tab" aria-expanded="true"> <i class='fa fa-file'></i> Course Document</a></li>
		            </ul>
		            
		            <div class="tab-content">
		            
<!-- 	#########  TAB 1  -->
 <div class="tab-pane active" id="historyCourse" style="position: relative;  min-height: 300px;">
 
<!-- 		   <div class="box box-primary">  -->
            
             <div class="box-header with-border">
<!-- 	              <h3 class="box-title">Training List</h3> -->
	              
	         

					 <form class="form-horizontal" id="srcForm"   method="post"> 
					 	
					 	<div class="col-md-6">
		                   <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Company</label>
			                    <div class="col-lg-6">
			                     	<select  class="form-control" name="companyCode" id="companyCodeFill"   >
										<option value="">${_ALL}</option>
									    <c:forEach var="item" items="${LOV_COMPANY}">
									     	<option value="${item.code}" ${item.code == owner.companyCode ? 'selected="selected"' : ''}>${item.descTH}</option>
									    </c:forEach>
									</select>
			                    </div>
			                  </div>
			                  
		                 </div>
		                 
			          <div class="col-lg-6">
				          <div class="form-group">
			                    <label for="paramStatus" class="col-lg-4 control-label">Section/Dept.</label>
			                    <div class="col-lg-6">
			                       <select class="form-control" id="deptCodeFill">
			                       	<option value="">${_ALL}</option>
			                       	<c:forEach var="item" items="${LOV_SECTION}"> 
								        <option value="${item.descTH}" ${item.descTH == invOwner.deptCode ? 'selected="selected"' : ''}>${item.descTH}</option>
								    </c:forEach>
			                      </select>
			                      
			                    </div>
			                  </div>
			             </div>
			             
			            
				  
			                  
					 </form>
					   </div>	    
		 
					 <div class="box-body">
					 
			           
			            <div class="bs-component">
			              <table class="table table-striped table-bordered" id="result-table-contract" cellspacing="0" width="100%">
			                <thead class="bg-green color-palette">
			                  <tr>
								<th class="text-center col-action">Action</th>
										<th class="text-center">Contractor No.</th>
										<th class="text-center">Contractor Name</th>
										<th class="text-center">Contractor Type</th>
										<th class="text-center">Company</th>
										<th class="text-center">Section/Department</th>
			<!-- 							<th class="text-center">Email</th> -->
										<th class="text-center">Mobile</th>
										<th class="text-center">Status</th>
			                  </tr>
			                </thead>
			                <tbody>
			                </tbody>
			              </table> 
			            </div><!-- /example -->
			            
			            
			             <div class="box-footer clearfix no-border">
				              <button type="button" class="btn  pull-right btn-success"    onclick="doAddContract()"><i class="fa fa-plus"></i> Add Contractor</button>
				            </div>		
			          </div>
<!-- 			        </div> -->
			        
        </div>
        <!-- 	#########  TAB 1  -->
        		            		            
<!-- 	#########  TAB 2--> 
        <div class="tab-pane " id="ownerDocument" style="position: relative; min-height: 300px;"> 
						            
						            
						    <form id="fileupload" action="#" method="POST" enctype="multipart/form-data">
					         <div class="row fileupload-buttonbar">
					            <div class="col-lg-8"> 
					                <span class="btn btn-success fileinput-button">
					                    <i class="glyphicon glyphicon-plus"></i>
					                    <span>Add files...</span>
					                    <input type="file" name="files[]" multiple>
					                </span>
					                <button type="submit" class="btn btn-primary start">
					                    <i class="glyphicon glyphicon-upload"></i>
					                    <span>Start upload</span>
					                </button>
					                <button type="reset" class="btn btn-warning cancel">
					                    <i class="glyphicon glyphicon-ban-circle"></i>
					                    <span>Cancel upload</span>
					                </button>
					                <button type="button" class="btn btn-danger delete">
					                    <i class="glyphicon glyphicon-trash"></i>
					                    <span>Delete</span>
					                </button>
					                <input type="checkbox" class="toggle minimal"> Select All
					                
					                <span class="fileupload-process"></span>
					            </div>
					            <div class="col-lg-4 fileupload-progress fade">
					                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
					                    <div class="progress-bar progress-bar-success" style="width:0%;"></div>
					                </div>
					                <div class="progress-extended">&nbsp;</div>
					            </div>
					        </div>
					        
					        <table role="presentation" class="table table-striped table-bordered"><tbody class="files"></tbody></table>
					        
					    </form>
  				  <br>
    
    
					 </div>        		            		            
<!-- 	#########  TAB 2--> 
					 
         </div>
        </div>
        
        
        
        
        
      </div>
      </div>
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
				
			
 
 </div> 
	
	
	
	
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
	
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<script src="${cPath}/resources/jFileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="${cPath}/resources/jFileupload/js/tmpl.min.js"></script>
<script src="${cPath}/resources/jFileupload/js/load-image.all.min.js"></script>
<script src="${cPath}/resources/jFileupload/js/canvas-to-blob.min.js"></script>
<script src="${cPath}/resources/jFileupload/js/jquery.blueimp-gallery.min.js"></script>

<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="${cPath}/resources/jFileupload/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="${cPath}/resources/jFileupload/js/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<script src="${cPath}/resources/jFileupload/js/main.js"></script>
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${cPath}/resources/jFileupload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
	
	
	 	 <script>
	
		var saveStatus = '${param["status"]}';
		
		function doSave(e){
			bootbox.confirm({
			    title: "Confirm",
			    message: _confirmSaveTxt,
			    size: 'small',
			    buttons: {
			        cancel: {
			            label: '<i class="fa fa-times"></i> Cancel'
			        },
			        confirm: {
			            label: '<i class="fa fa-check"></i> Confirm',
			            className: 'btn-success'
			        }
			    },
			    callback: function (result) {
			        if(result){
			        	$('#form').submit();
			        }
			    }
			});
 		};
 	
		$(document).ready(function() {
		
		
				$(".date").datepicker({
					   format: 'dd/mm/yyyy'
				});
				
		
			if(saveStatus=="S"){
				/* bootbox.alert({
				    message: "Save Success !",
				    size: 'small'
				}); */
				$.notify({
						title: "<strong>Success!</strong> ",
						message: " Save successfully"
					});
			}
		
			$("#saveBtn").click(function(e){
				var _f = $('#form').validator('validate');
				if (_f.has('.has-error').length==0) {
			    	doSave();
				} 
			});
			
			$("#cancelBtn").click(function(){
				location = cPath+"/manage/job_course_manage.htm";				
			});
			
		});
 	
 	
 	
 	
 	function doSearchCon(){
 	
 		var ownerId = $('#ownerId').val();
 		
		$.ajax({
            url: cPath+"/course_manage/getTrainList.json",
            data: $('#form').serialize()
        }).done(function (result) {
            rsTable.clear().draw();
            if(result.recordsTotal>0){
	            rsTable.rows.add(result.data).draw();
            }else{
            }
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
 	};
 	
 	
 	var ruu = 1;
	var rsTable = $('#result-table-contract').DataTable({
		autoWidth: false,
		data:[],
	    columns: [
	     	{ 
	     		"data": "ownerId"
		        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 		            var txt = $roleEdit? "<a href='${cPath}/training_manage/trainingEdit.htm?edit=Y&ownerId="+oData.ownerId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
// 		        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
		        	var  txt = "<a href='javascript:void(0)' onclick=\"doDel('"+oData.ownerId+"', '"+oData.ownerCode+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" ;
		            $(nTd).html(txt);
// 		            $(nTd).html(ruu++);
		        } 
            },
			{ "data": "ownerCode" ,"sWidth": "120px"}, 
			{ 
	     		"data": "ownerId"
		       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		       		var tn =  oData.title+' '+ oData.firstName+' '+oData.lastName;
		       		if($roleEdit){
			       		tn = "<a href='${cPath}/training_manage/trainingEdit.htm?edit=Y&ownerId="+oData.ownerId+"'>"+tn+"</a>";
			        }
		            $(nTd).html(tn);
		        } 
            },
			{ "data": "ownerType" }, 
			{ "data": "companyName" }, 
			{ "data": "deptName" }, 
			{ "data": "mobile","sWidth": "120px" },
			{ "data": "activeFlg" },
			{ "data": "companyCode" },
			{ "data": "firstName" },
			{ "data": "lastName" }
	    ],
	       "aoColumnDefs": [
	      { "sClass": "text-center", "aTargets": [0,1,3,4,5,6,7] }
	      ,{
                "targets": [ 8 ,9 ,10],
                "visible": false
           }
	    ],
	    rowCallback: function (row, data) {}, 
	    ordering: false, 
// 	    searching: false, 
   	   	destroy: true 
	 });
	 
	 
	 function loadFileUpload(){ 
		
			var courseTrainId = $('#courseTrainId').val();
	        var $form = $('#fileupload');  

			// Load existing files:
			$.ajax({
	            url: cPath+"/file/getFileUpload",
	            dataType: 'json',
	            data: {courseId:courseTrainId}
	        }).always(function () {
	            $(this).removeClass('fileupload-processing');
	        }).done(function (result) {
// 	        	console.log(result)
				$form.fileupload('option', 'done').call($form, $.Event('done'), {
						result : { files : result['files']	}
				});
	        }).fail(function () {
	            $('<div class="alert alert-danger"/>').text('Server currently unavailable - ' + new Date()) .appendTo('#fileupload');
	        }); 
	        
	        
	 };
	 
	 
	 function doAddContract(){
	 	var courseTrainId = $('#courseTrainId').val();
	 	var courseCode = $('#courseCode').val();
		location = cPath+"/course_manage/addContract.htm?courseCode="+courseCode+"&courseTrainId="+courseTrainId;
 	};
 	
 	
 	function doDel(ownerId, name){
 		var courseTrainId = $('#courseTrainId').val();
		bootbox.confirm({
		    title: "Confirm",
		    size: 'small',
		    message: _confirmDelTxt+" : "+name,
		    buttons: {
		        cancel: {
		            label: '<i class="fa fa-times"></i> Cancel'
		        },
		        confirm: {
		            label: '<i class="fa fa-check"></i> Confirm',
		            className: 'btn-success'
		        }
		    },
		    callback: function (result) {
		        if(result){
		        	$.ajax({
					    url: cPath+"/course_manage/delContractSave?ownerId="+ownerId+"&courseTrainId="+courseTrainId 
			        }).done(function (result) {
				        bootbox.alert({
						    message: _successDelTxt,
						    size: 'small',
						    callback: function(){doSearchCon();}
						});
		            }).fail(function (jqXHR, textStatus, errorThrown) { 
		            });
		        }
		    }
		});
	};
 	
 	
 
 
//  *********** LOAD ------------------
  	 
	 $(function() {
	 
		 	doSearchCon();

			loadFileUpload();
		
			$('#companyCodeFill').on( 'change', function () {
			    rsTable
			        .columns(8)
			        .search( this.value)
			        .draw();
			});
			
			$('#deptCodeFill').on( 'change', function () {
			    rsTable
			        .columns(5)
			        .search( this.value)
			        .draw();
			});
			
			var companyCode = '${param["companyCode"]}';
				 	console.log('companyCode:'+companyCode);
			
		 	if(''!=companyCode) {
		 		$('#companyCodeFill').val(companyCode);
				rsTable.columns(8).search(companyCode).draw();
		 	}
			
			
 });	
	 
	 </script>
	 
	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
	 
</body>

</html>