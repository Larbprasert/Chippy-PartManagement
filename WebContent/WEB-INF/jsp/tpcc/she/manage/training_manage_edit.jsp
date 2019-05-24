<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
	
	<c:set var="_SAVE_MODE" scope="page" value="${param['edit']=='Y'||param['add']=='Y'}"/>
	<c:set var="_EDIT_MODE" scope="page" value="${param['edit']=='Y'||param['add']=='Y'? '' : 'disabled'}"/>
	
<%-- 	<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload.css"> --%>
	
<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-ui.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->
<noscript><link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-noscript.css"></noscript>
<noscript><link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-ui-noscript.css"></noscript>
</head>


<body class="${bodySkin}">

	
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<div class="content-wrapper">

	 <section class="content-header">
		 <h1><i class='fa fa-edit'></i>  Training Management </h1>
	</section>
	
	<section class="content">
		<div class="row"> <div class="col-lg-12">
		
		 <div class="box box-primary" id="printableArea"> <div class="box-body">
		  
		   <fieldset disabled>
		   <form  class="form-horizontal" id="form" action="ownerSave.htm" method="post" command="owner"  data-toggle="validator">  
		   
		   
		   	          <input type="hidden" id=isEdit value="${param['edit']}">
		   
<%-- 			  ownerImage : ${owner.ownerImage}  --%>
		    <div class="row">
				<div class="col-md-12 text-center">
					<div class="fileinput fileinput-new" data-provides="fileinput">
<!-- 					  <div class="fileinput-new thumbnail" style="width: 150px; height: 150px;"> -->
<%-- 					  <c:if test="${param['add']=='Y'}"><img src="${cPath}/resources/images/tp/avatar.png" class=""></c:if>  --%>
<%-- 					  <img class="profile-user-img img-responsive " alt="img"  style="width: 150px; height: 150px;" src="data:image/jpeg;base64,${owner.ownerImage64}"/>  --%>
<!-- 					  </div> -->
					   
					   
					   <c:if test="${owner.ownerImage64==null}">
			   				 <img class="profile-user-img img-responsive " alt="img"  style="width: 150px; height: 150px;" 
			   				 		src="${cPath}/resources/images/tp/avatar.png"/> 
			   			</c:if>
					   <c:if test="${owner.ownerImage64!=null}">
					  		<img class="profile-user-img img-responsive " alt="img"  style="width: 150px; height: 150px;" src="data:image/jpeg;base64,${owner.ownerImage64}"/> 
			   			</c:if>
					   			
					   			
					</div>
					
				 
				</div>
			</div>
<!-- 				<hr> -->
				
	        <div class="row">  
	        
	        	<div class="col-lg-6">
<!--                   <div class="form-group"> -->
<!--                     <label for="name" class="col-lg-4 control-label">Person ID</label> -->
<!--                     <div class="col-lg-6"> -->
<!--                       <input type="text" class="form-control" id="name"  > -->
<!--                     </div> -->
<!--                   </div> -->
	                       <input type="hidden" class="form-control" id="ownerId" name="ownerId" value="${owner.ownerId}">


                  <div class="form-group ">
                    <label for="" class="col-lg-4 control-label">Contract No.</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" id="ownerCode"  name="ownerCode"   value="${owner.ownerCode}">
                    </div>
                  </div>
                  
                    <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Contract Type</label>
	                    <div class="col-lg-6">
	                      <select  class="form-control" name="ownerType" required>
<!-- 								<option value="">${_ALL}</option> -->
								<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_OWNER_TYPE}">
							     	<option value="${item.code}" ${item.code == owner.ownerType ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
						</select>
	                    </div>
	                  </div>
	                  
                   
            		<div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Title</label>
	                    <div class="col-lg-6">
	                       <select  class="form-control" name="title" required>
<!-- 								<option value="">${_ALL}</option> -->
								<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_TITLE}">
							     	<option value="${item.code}" ${item.code == owner.title ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
						</select>
	                    </div>
	               </div>
	               
	                <%--    <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Gender</label>
	                    <div class="col-lg-6">
	                       <select  class="form-control" name="gender" required>
<!-- 								<option value="">${_ALL}</option> -->
							    <c:forEach var="item" items="${LOV_GENDER}">
							     	<option value="${item.code}" ${item.code == owner.gender ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
						</select>
	                    </div>
	                  </div>
	                   --%>
	                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">First Name</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name="firstName" value="${owner.firstName}" required>
                    </div>
                  </div>
                  
                    <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Last Name</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="lastName" value="${owner.lastName}" required>
	                    </div>
	                  </div>
	                 <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Office Phone</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="officePhone" value="${owner.officePhone}">
	                    </div>
	                  </div>
	                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Mobile</label>
                    <div class="col-lg-6">
                      <input type="tel" class="form-control" data-mask="999-999-9999"  name="mobile" value="${owner.mobile}" required>
                    </div>
                  </div>
                  
                  
	                  
	          </div>
	          
	          <div class="col-lg-6">
                  
                  
                  
                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Email</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="email" value="${owner.email}" required>
	                    </div>
	                  </div>
	                  
	                       
	                    <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Company</label>
	                    <div class="col-lg-6">
	                     	<select  class="form-control" name="companyCode" required >
								<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_COMPANY}">
							     	<option value="${item.code}" ${item.code == owner.companyCode ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
							</select>
	                    </div>
	                  </div>
	                  
	                    <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Section/Department</label>
	                    <div class="col-lg-6">
	                     	<select  class="form-control" name="deptCode" required >
								<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_SECTION}">
							     	<option value="${item.code}" ${item.code == owner.deptCode ? 'selected="selected"' : ''}>${item.code} - ${item.descTH}</option>
							    </c:forEach>
							</select>
	                    </div>
	                  </div>
	                  
	                  
	                    <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Job Position</label>
	                    <div class="col-lg-6">
	                      <select  class="form-control" id="position"  name="position" required>
	                      		<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_POSITION}">
							     	<option value="${item.code}" ${item.code == owner.position ? 'selected="selected"' : ''}>${item.code} - ${item.descTH}</option>
							    </c:forEach>
						</select>
	                    </div>
	                  </div>
	                  


	          			
	               <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Date of Birth</label>
                    <div class="col-lg-6">
			                <div class='input-group date'>
			                    <input type='text' class="form-control"  pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='birthDate' name='birthDate' value="${owner.birthDate}" required/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div>
	                  
	                  
	               <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Work Start Date</label>
                    <div class="col-lg-6">
			                <div class='input-group date'>
			                    <input type='text' class="form-control" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='workStartDate' name='workStartDate' value="${owner.workStartDate}" required/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div>
	                  
	                
	                  
		          	<div class="form-group">
	                    <label for="assetType" class="col-lg-4 control-label">Status</label>
	                    <div class="col-lg-6">
	                       <select class="form-control" name="activeFlg">
	                       	<c:forEach var="item" items="${LOV_ACTIVE_TYPE}"> 
						        <option value="${item.code}" ${item.code == owner.activeFlg ? 'selected="selected"' : ''}>${item.descTH}</option>
						    </c:forEach>
	                      </select>
	                    </div>
	                  </div>
                 
	           </div>
	           
			 </div>
		 		
		 		</form> </fieldset>
		 		 
			 
	      

<%-- 					<c:if test="${_SAVE_MODE}"> --%>
					<div class="row">
						<div class="col-lg-12">
							<div class="form-group "> 
								<div class="col-lg-12 text-center">
									<button type="button" id="cancelBtn" class="btn btn-default"><i class="fa fa-times-circle"></i> Cancel </button> 
									 <security:authorize access="hasAnyRole('EXPORT')">
										&nbsp;&nbsp; <button type="button" class="btn btn-info "  id="printBtn"><i class="fa fa-print"></i>&nbsp;&nbsp; Print &nbsp;&nbsp;</button>
									</security:authorize>
<!-- 									<button type="button" id="saveBtn" class="btn btn-primary" ><i class="fa fa-check-square-o"></i> Save</button>&nbsp;&nbsp; -->
	<!-- 								<button type="reset" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp; -->
								</div>
							</div>
						</div>
					</div>
<%-- 				</c:if> --%>

<!-- 				</form> -->
				
				
				
			</div>
			</div> <!-- --- BOX 1 -->
			
			
			 <div class="row">  <div class="col-lg-12"> 
				 <div class="nav-tabs-custom"  >
		            <!-- Tabs within a box -->
		            <ul class="nav nav-tabs  ui-sortable-handle">
		              <li class="active"><a href="#historyCourse"  id="historyCourseTab"  role="tab"  data-toggle="tab" > <i class='fa fa-list'></i>  Training History</a></li>
		              <li class=""><a href="#needCourse" role="tab"  data-toggle="tab" > <i class='fa fa-check-square-o'></i>  Training Need by Job Position</a></li>
		              <li class=""><a href="#ownerDocument" role="tab"  data-toggle="tab"> <i class='fa fa-file'></i> Personal Document</a></li>
		            </ul>
		            
		            <div class="tab-content">

		            
<!-- 	#########  TAB 1  -->
					 <div class="tab-pane active" id="historyCourse" style="position: relative;  min-height: 300px;">
							              
							              
							              
						 <div class="box-header with-border">
							 <form class="form-horizontal" id="srcForm"   method="post"> 
							 	
							 	<div class="col-lg-10">
				                   <div class="form-group">
					                    <label for="" class="col-lg-4 control-label">Course </label>
					                    <div class="col-lg-4">
					                     	 <select class="form-control" id="courseCodeFill" name="courseCode" >
						                       	<option value="">${_ALL}</option>
						                       	<c:forEach var="item" items="${LOV_COURSE_LIST}"> 
											        <option value="${item.courseCode}" ${item.courseCode == course.courseCode ? 'selected="selected"' : ''} >${item.courseCode} - ${item.courseNameTh}</option>
											    </c:forEach>
						                      </select>
					                    </div>
					                  </div>
					                  
				                 </div>
				                 
<!-- 					          <div class="col-lg-6"> -->
<!-- 						          <div class="form-group"> -->
<!-- 					                    <label for="paramStatus" class="col-lg-4 control-label">Section/Dept.</label> -->
<!-- 					                    <div class="col-lg-6"> -->
<!-- 					                       <select class="form-control" id="deptCodeFill"> -->
<%-- 					                       	<option value="">${_ALL}</option> --%>
<%-- 					                       	<c:forEach var="item" items="${LOV_SECTION}">  --%>
<%-- 										        <option value="${item.descTH}" ${item.descTH == invOwner.deptCode ? 'selected="selected"' : ''}>${item.descTH}</option> --%>
<%-- 										    </c:forEach> --%>
<!-- 					                      </select> -->
					                      
<!-- 					                    </div> -->
<!-- 					                  </div> -->
<!-- 					             </div> -->
					                  
							 </form>
					   </div>	
					   
					   <div class="box-body">
							 <div class="row">
						        <div class="col-xs-12 table-responsive">
						           <table class="table table-striped table-bordered" id="result-table-historyCourse"
										cellspacing="0" width="100%">
										<thead class="bg-green color-palette">
											<tr>
												<th class="text-center col-action">Action</th>
												<th class="text-center">Date</th>
												<th class="text-center">Course Code</th>
												<th class="text-center">Group</th>
												<th class="text-center">Course Type</th>
												<th class="text-center">Course Name TH</th>
												<th class="text-center">Course Name EN</th>
												<th class="text-center">Course Price</th>
											</tr>
										</thead>
									</table>
						        </div>
						        <!-- /.col -->
						      </div>
						   </div>							
<!-- 							 <div class="box-footer clearfix no-border"> -->
<!-- 							 		 <button type="button" class="btn btn-info pull-right"  onclick="printDiv()" ><i class="fa fa-print"></i>&nbsp;&nbsp; Print &nbsp;&nbsp;</button> -->
<!-- 				            </div>		 -->
					 </div>
							            
	<!-- ######### ******/ TAB 2 -->
					  <div class="tab-pane" id="needCourse" style="position: relative;  min-height: 300px;">
							           

				<table class="table table-striped table-bordered" id="result-table-needCourse"
					cellspacing="0" width="100%">
					<thead class="bg-green color-palette">
						<tr>
<!-- 							<th class="text-center col-action">Action</th> -->
												<th class="text-center col-action">No.</th>
							<th class="text-center">Complete</th>
							<th class="text-center">Course Code</th>
							<th class="text-center">Course Type</th>
							<th class="text-center">Course Name TH</th>
							<th class="text-center">Course Name EN</th>
						</tr>
					</thead>
				</table>
				
					
					 </div>
		            
		            
		            
		            
		            		            
<!-- 	#########  TAB 3 -->    
					  <div class="tab-pane" id="ownerDocument" style="position: relative; min-height: 300px;"> 
						            
						            
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
					 
		            		            		            
<!-- 	#########  TAB end-->   
		            
		            
		            
		            </div>
	            
	          
	            
	             </div>  
	              
	             
	             	</div> 
	             </div> 
	       <!--      ---- BOX 2  -->
			
					 <div class="clearfix"><br></div>
			
			
			</div>
        </div>
		
		
		</section>
		
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
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="${cPath}/resources/jFileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="${cPath}/resources/jFileupload/js/tmpl.min.js"></script>
<script src="${cPath}/resources/jFileupload/js/load-image.all.min.js"></script>
<script src="${cPath}/resources/jFileupload/js/canvas-to-blob.min.js"></script>
<script src="${cPath}/resources/jFileupload/js/jquery.blueimp-gallery.min.js"></script>
 
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
<script src="js/cors/jquery.xdr-transport.js"></script>
<![endif]-->

	 <script>
	 	
	  
		var saveStatus = '${param["status"]}';
		
		function doSave(e){
			bootbox.confirm({
			    title: "Confirm",
			    size: 'small',
			    message: _confirmSaveTxt,
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
 	
			
		$("#assignedDate,#expiredDate").datepicker({
			   format: 'dd/mm/yyyy'
		});
		
		
		var hostId = '${invAssetHistory.hostId}';
		if($.trim(hostId)!=""){
			$('.selectpicker').selectpicker('refresh'); 
			$('#hostId').selectpicker('val', hostId);
		}
	
		var ownerCode = '${invAssetHistory.ownerCode}';
		if($.trim(ownerCode)!=""){
			$('.selectpicker').selectpicker('refresh'); 
			$('#ownerCode').selectpicker('val', ownerCode);
		}
	
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
			location = cPath+"/manage/training_manage.htm";				
		});
			
			
		$("#printBtn").click(function(e){
			var url = cPath+"/training_manage/print/"+$('#ownerId').val();	
			window.open(url, '_blank');
		});
			
			
			
		 // Course !!!! 1
			
	  function loadTrainHistory(){
	  	var ownerId = $('#ownerId').val();
		$.ajax({
            url: cPath+"/course_manage/getDataTable.json?ownerId="+ownerId
//             data: $('#form').serialize()
        }).done(function (result) {
            rsTable_historyCourse.clear().draw();
            if(result.recordsTotal>0){
	            rsTable_historyCourse.rows.add(result.data).draw();
            }else{
//             	bootbox.alert({
// 				    message: "No Data Found!",
// 				    size: 'small'
// 				});
            }
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
 	};
		
		var rhis = 1;
		var rsTable_historyCourse = $('#result-table-historyCourse').DataTable({
			autoWidth: false,
			data:[],
		    columns: [
		     	{ 
		     		"data": "courseId"
			        ,"sWidth": "60px"
			        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			    	   var txt = $roleEdit? "<a  href='${cPath}/course_manage/courseEdit.htm?edit=Y&courseTrainId="+oData.courseTrainId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
			        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
			            $(nTd).html(txt);
			        } 
// 			        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 			            $(nTd).html(rhis++);
// 			        } 
	            }, 
				{ "data": "courseDateStr" ,"sWidth": "60px" }, 
				{ "data": "courseCode" },
				{ "data": "courseGenNo"  ,"sWidth": "60px" }, 
// 				{ "data": "courseDateStr" 
// 				 	,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 			            $(nTd).html('2017-01-11');
// 			        } 
// 		        },
				{ "data": "courseType" }, 
				{ "data": "courseNameTh" }, 
				{ "data": "courseNameEn" }, 
				{ "data": "coursePrice" 
					,"render": function ( data, type, row ) {
						return data.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
					}
				}
		    ],
		      "aoColumnDefs": [
		      { "sClass": "text-center", "aTargets": [0,1,2,3,4,7] }
		    ],
		    rowCallback: function (row, data) {}, 
		    ordering: false, 
	   	   	destroy: true 
		 });
		 
		$('#courseCodeFill').on( 'change', function () {
			    rsTable_historyCourse
			        .columns(2)
			        .search( this.value)
			        .draw();
			});
		

		
 // Course !!!! 2
	  function loadNeedCourse(){
// 	  var position = $('#position').val();
	var ownerId = $('#ownerId').val();
		$.ajax({
//             url: cPath+"/posCourse/getDataTable.json?positionCode="+position,
// 			url: cPath+"/course/getDataTable.json",
            url: cPath+"/course_manage/getTrainNeed.json?ownerId="+ownerId
//             data: $('#form').serialize()
        }).done(function (result) {
            rsTable_NeedCourse.clear().draw();
            if(result.recordsTotal>0){
	            rsTable_NeedCourse.rows.add(result.data).draw();
            }else{
//             	bootbox.alert({
// 				    message: "No Data Found!",
// 				    size: 'small'
// 				});
            }
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
 	};
 	
 	var rneed = 1;
		var rsTable_NeedCourse = $('#result-table-needCourse').DataTable({
			autoWidth: false,
			data:[],
		    columns: [
		     	{ 
		     		"data": "courseId"
 					,"sWidth": "60px"
 					  ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			            $(nTd).html(rhis++);
			        } 
// 			        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 			    	   var txt = $roleEdit? "<a  href='${cPath}/course/courseEdit.htm?edit=Y&courseId="+oData.courseId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
// 			        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
// 			            $(nTd).html(txt);
// 			        } 
	            }, 
	            { "data" : "isComplete" ,"sWidth": "70px",
					"render": function ( data, type, row ) {
						var isComplete = (data>=1)? '1' : '0';
						return _getStatus(isComplete);
					}
				},

// 				{ "data": "courseCode" }, 
				{ 
		     		"data": "courseCode"
			       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			       		var tn =  oData.courseCode;
			       		var isComplete = (oData.isComplete >= 1)? 'Y' : 'N';
			       		if($roleEdit && isComplete == 'Y'){
// 			       			tn = "<a href='${cPath}/manage/job_course_manage.htm?courseCode="+oData.courseCode+"'>"+tn+"</a>";
			       			tn = "<a href='#' role='tab' data-toggle='tab'  onclick='doNeedCourse(\""+oData.courseCode+"\")' >"+tn+"</a>";
				        }
			            $(nTd).html(tn);
			        } 
	            },
				{ "data": "courseTypeDesc" }, 
				{ "data": "courseNameTh" }, 
				{ "data": "courseNameEn" } 
				
// 				{ "data": "coursePlace" }
		    ],
		      "aoColumnDefs": [
		      { "sClass": "text-center", "aTargets": [0,1,2,3] }
		    ],
		    rowCallback: function (row, data) {}, 
		    ordering: false, 
	   	   	destroy: true 
		 });
		 
		 
		 
		function doNeedCourse(co){
			$('.nav-tabs a[href="#historyCourse"]').tab('show');
			$('#courseCodeFill').val(co);
			 rsTable_historyCourse.columns(2).search(co).draw();
		}
		 
		 
		 	
		$("#historyCourseTab").on("click", function () {
			$('#courseCodeFill').val('');
			rsTable_historyCourse.columns(2).search('').draw();
		});
		
		
		function loadFileUpload(){ 
		
		
			var ownerId = $('#ownerId').val();
			 
	           var $form = $('#fileupload');  
	           

			// Load existing files:
			$.ajax({
	            url: cPath+"/file/getFileUpload",
	            dataType: 'json',
	            data: {ownerId:ownerId}
// 	            context: $('#fileupload')[0]
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
	 
	 
	 function printDiv() {
	 
	 		 var divName= 'printableArea';
	 
		     var printContents = document.getElementById(divName).innerHTML;
		     var originalContents = document.body.innerHTML;
		
		     document.body.innerHTML = printContents;
		
		     window.print();
		
		     document.body.innerHTML = originalContents;

	 	
	 	
	 		/*  var id= 'printableArea';
			 var html="<html>";
			   html+= document.getElementById(id).innerHTML;
			
			   html+="</html>";
			
			   var printWin = window.open('','','left=0,top=0,width=900,height=600,toolbar=0,scrollbars=0,status  =0');
			   printWin.document.write(html);
			   printWin.document.close();
			   printWin.focus();
			   printWin.print();
			   printWin.close(); */
   
		}

 


	$(function() {

			loadTrainHistory();

			loadNeedCourse();
			
			loadFileUpload();
			
			
		});	
		
		
		</script>
	 

	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
</body>

</html>