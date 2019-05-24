<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="/resources/adminLTE/common.jsp" %>

<body class="${bodySkin}">

<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<div class="content-wrapper">


	<section class="content-header">
		 <h1><i class='fa fa-edit'></i> Add/Edit </h1>
	</section>
	
<section class="content">
		  <fieldset  ><div class="well">
		   <form class="form-horizontal" id="form" action="ownerSave.htm" method="post" command="owner"  data-toggle="validator">  
		   
		   
		   	          <input type="hidden" id=isEdit value="${param['edit']}">
		   
<%-- 			  ownerImage : ${owner.ownerImage}  --%>
		    <div class="row">
				<div class="col-md-12 text-center">
					<div class="fileinput fileinput-new" data-provides="fileinput">
					  <div class="fileinput-new thumbnail" style="width: 150px; height: 150px;">
					  <c:if test="${param['add']=='Y'}"><img src="${cPath}/resources/images/tp/avatar.png" class=""></c:if> 
					   <c:if test="${param['edit']=='Y'}"> <c:if test="${owner.ownerImage64==null}">
					   			<img alt="img" src="${cPath}/resources/images/tp/avatar.png"/>
					   			
					   			</c:if>
					   			<c:if test="${owner.ownerImage64!=null}">
					   				<img alt="img" src="data:image/jpeg;base64,${owner.ownerImage64}"/>
					   			</c:if>
					   		</c:if>
					 </div>
					  <div class="fileinput-preview fileinput-exists thumbnail" style="width: 150px; height: 150px;"></div>
					  <div>
					    <span class="btn btn-default btn-file">
					    <span class="fileinput-new"><i class="fa fa-camera-retro"></i> Upload Image </span>
					    <span class="fileinput-exists"><i class="fa fa-camera-retro"></i> Upload Image</span>
					    <input type="file" class="upload-file" name="file" accept="image/*"></span>
<!-- 					    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a> -->
					  
					  </div>
					</div>
					
					
					<script type="text/javascript">
						   
					   var fileInput = $('.upload-file');
						fileInput.change(function(){
// 						    previewURL(this);
// 						    if($(this).val()!='') {
						     if(fileInput.get(0).files.length && $("#isEdit").val() == 'Y' ){
   							 var maxSize = 2097152;
				             var fileSize =$(this)[0].files[0].size; // in bytes
// 				               alert('file ' +fileSize+', F'+ maxSize + ' bytes');
					            if(fileSize>maxSize){
					                alert('file size is more than 2 MB');
					                return false;
					            }
					        
						      var formData = new FormData();
						      formData.append('file', $(this)[0].files[0]);
						      formData.append('ownerId', $("#ownerId").val());
							      $.ajax({
							        url: 'updateOwnerImage',
							        type: 'POST',
							        contentType: "application/json",
							        data: formData,
							        success: function (r) { 
							        if(r=='SUCCESS') {
								        $.notify({
											title: "<strong>Success!</strong> ",
											message: "Your image has upload successfuly."
										});
								      }
							    },
							    cache: false,
							    contentType: false,
							    processData: false
							});
						
						}
					}); 
					
					</script>
					 <!--  <div class="fileinput fileinput-new" data-provides="fileinput">
        <div>
         <span class="btn btn-primary btn-file"><span class="fileinput-new"><span class="fa fa-camera"></span> Image 3</span>
          <div id="preview" name="preview"  class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 150px; display:block;"></div>
             <img id="prevImg" name="prevImg" />   
          <input type="file" name="file" id="file" class="ephoto-upload" accept="image/jpeg"></span>
          </div>
        </div>
 -->

				</div>
			</div>
				<hr>
				
	        <div class="row">  
	        
	        	<div class="col-lg-6">
<!--                   <div class="form-group"> -->
<!--                     <label for="name" class="col-lg-4 control-label">Person ID</label> -->
<!--                     <div class="col-lg-6"> -->
<!--                       <input type="text" class="form-control" id="name"  > -->
<!--                     </div> -->
<!--                   </div> -->
	                       <input type="hidden" class="form-control" id="ownerId" name="ownerId" value="${owner.ownerId}">


                  <div class="form-group has-feedback">
                    <label for="" class="col-lg-4 control-label">Contract No.</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" id="ownerCode"  name="ownerCode" 
                       	data-minlength="4" maxlength="10" data-remote-error="Contract No. already exists." 
                       	data-error="Minimum of 4 characters"  value="${owner.ownerCode}" ${empty param['ownerId']? 'data-remote="verify"':'readonly'} required>
                    </div>
                       	 	<div class="help-block with-errors"></div>
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
                    <label for="" class="col-lg-4 control-label">Mobile</label>
                    <div class="col-lg-6">
                      <input type="tel" class="form-control" data-mask="999-999-9999"  name="mobile" value="${owner.mobile}">
                    </div>
                  </div>
                  
	                 <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Office Phone</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="officePhone" value="${owner.officePhone}">
	                    </div>
	                  </div>
	                  
                  
	                  
	          </div>
	          
	          <div class="col-lg-6">
                  
                  
                  
                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Email</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="email" value="${owner.email}">
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
	                      <select  class="form-control" name="position" required>
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
			                    <input type='text' class="form-control readonly"   pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='birthDate' name='birthDate' value="${owner.birthDate}"/>
			                    <span class="input-group-addon" id="clear1">
			                        <span class="glyphicon glyphicon-remove"></span>
			                    </span>
			                </div>
                    </div>
                  </div>
	                  
	                  
	               <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Work Start Date</label>
                    <div class="col-lg-6">
			                <div class='input-group date'>
			                    <input type='text' class="form-control readonly"   pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='workStartDate' name='workStartDate' value="${owner.workStartDate}"/>
			                    <span class="input-group-addon"  id="clear2">
			                        <span class="glyphicon glyphicon-remove"></span>
			                    </span>
<!-- 			                    <span class="input-group-addon"> -->
<!-- 			                        <span class="glyphicon glyphicon-calendar"></span> -->
<!-- 			                    </span> -->
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

<%-- 					<c:if test="${_SAVE_MODE}"> --%>
					<div class="row">
						<div class="col-lg-12">
							<div class="form-group "> 
								<div class="col-lg-12 text-center">
									<button type="button" id="cancelBtn" class="btn btn-default"><i class="fa fa-times-circle"></i> Cancel </button>&nbsp;
									<button type="button" id="saveBtn" class="btn btn-primary" ><i class="fa fa-check-square-o"></i> Save</button>&nbsp;&nbsp;
	<!-- 								<button type="reset" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp; -->
								</div>
							</div>
						</div>
					</div>
<%-- 				</c:if> --%>

				</form>
			</div>
            </fieldset>
            
<%--              <c:if test="${!_SAVE_MODE}"> --%>
<!--             <div class="row"> -->
<!-- 						<div class="col-lg-12 text-center"> -->
<!-- 							<button type="button" id="backBtn" class="btn btn-primary" onclick="history.back()"> <i class="fa fa-reply"></i> Back </button>&nbsp; -->
<!-- 						</div> -->
						
<%-- 			</div></c:if> --%>
            
            <div class="clearfix"><br></div>
 
 </section>
</div>
	
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
 		
		function doVerify(e){
			$.ajax({
	            url: cPath+"/owner/verify?ownerCode="+$('#ownerCode').val()
	        }).done(function (result) {
	        	console.log(result);
// 		        bootbox.alert({
// 				    message: _successDelTxt,
// 				    size: 'small',
// 				    callback: function(){doSearch();}
// 				}); 
            }).fail(function (jqXHR, textStatus, errorThrown) { 
            });
 		};
 	
			$(document).ready(function() {
			
				$("#birthDate,#workStartDate").datepicker({
					   format: 'dd/mm/yyyy'
				});
				
			$("#clear1").click(function(){
			  $('#birthDate').data('datepicker').setDate(null);
			});
			$("#clear2").click(function(){
			  $('#workStartDate').data('datepicker').setDate(null);
			});
		
			if(saveStatus=="S"){
// 				bootbox.alert({
// 				    message: "Save Success !",
// 				    size: 'small'
// 				});
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
				location = cPath+"/maintain/owner.htm";				
			});
			
		});
		
// 		$(".alert-success").fadeTo(2000, 500).slideUp(500, function(){
// 		    $(".alert-success").slideUp(500);
// 		});
 	
	 </script>
	 
	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
	 


</body>


</html>