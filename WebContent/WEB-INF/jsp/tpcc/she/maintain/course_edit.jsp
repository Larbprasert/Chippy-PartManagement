<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
	
	
</head>

<body>

	<!--  --- MENU --- -->
	<%@include file="/WEB-INF/jsp/tpcc/she/menu.jsp" %>
	 <div class="container">
		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-8 col-md-7 col-sm-6">
					<h3><i class='fa fa-edit'></i> Add/Edit Course</h3>
				</div>
			</div>
		</div>

				<fieldset>
					<div class="well">
						<form class="form-horizontal" id="form" action="courseSave.htm"
							method="post" command="course" data-toggle="validator">  

							<div class="col-lg-6">
							
								<!-- 	 <------- Don't forget this Haha -->
								<input type="hidden" class="form-control" name="courseId" value="${course.courseId}">
								
				                  
			 					<div class="form-group has-feedback">
					                    <label for="courseCode" class="col-lg-4 control-label">Course Code</label>
					                    <div class="col-lg-6">
<%-- 					                       <input type="text" class="form-control" name="courseCode" value="${course.courseCode}" ${empty param['courseId']? '':'readonly'} required > --%>
					                      <input type="text" class="form-control" id="courseCode"  name="courseCode" 
												data-minlength="5" maxlength="10" 
												data-remote-error="Course code already exists." 
												 data-error="Minimum of 5 characters" 
											 value="${course.courseCode}" ${empty param['courseId']? 'data-remote="verify"':'readonly'} required>
					                    <div class="help-block with-errors"></div>
					                    </div>
					             </div>
					             
					             
					             
						          <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Name TH</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="courseNameTh" value="${course.courseNameTh}"  required>
					                    </div>
					             </div>
					             
						      
							</div>
							
							<div class="col-lg-6">
							
							    <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Name EN</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="courseNameEn" value="${course.courseNameEn}" required>
					                    </div>
					             </div>
					          
							
			 					<%-- <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Date</label>
					                    <div class="col-lg-6">
							                <div class='input-group date'>
							                    <input type='text' class="form-control"  name='courseDateStr' value="${course.courseDateStr}" required/>
							                    <span class="input-group-addon">
							                        <span class="glyphicon glyphicon-calendar"></span>
							                    </span>
							                </div>
				                    </div>
					             </div>
					             
						          <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Location</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="coursePlace" value="${course.coursePlace}"  required>
					                    </div>
					             </div>
					              --%>
					              
						         <%--  <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Course Price</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="coursePrice" value="${course.coursePrice}" required>
					                    </div>
					             </div> --%>
					             
					             <div class="form-group">
				                    <label for="" class="col-lg-4 control-label">Course Type</label>
				                    <div class="col-lg-6"> 
				                             <select class="form-control" name="courseType" required>
						                       	<option value="">${_ALL}</option>
						                       	<c:forEach var="item" items="${LOV_COURSE_TYPE}"> 
											        <option value="${item.code}" ${item.code == course.courseType ? 'selected="selected"' : ''}>${item.descTH}</option>
											    </c:forEach>
						                      </select>
				                    </div>
				                  </div>
				                  
							                         
					          	<div class="form-group">
				                    <label for="assetType" class="col-lg-4 control-label">Status</label>
				                    <div class="col-lg-6">
				                       <select class="form-control" name="active">
				                       	<c:forEach var="item" items="${LOV_ACTIVE_TYPE}"> 
									        <option value="${item.code}" ${item.code == course.status ? 'selected="selected"' : ''}>${item.descTH}</option>
									    </c:forEach>
				                      </select>
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
<!-- 											&nbsp; -->
<!-- 											<button type="reset" class="btn btn-default"> -->
<!-- 												&nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i> -->
<!-- 											</button> -->
											&nbsp;&nbsp;
											<button type="button" id="saveBtn" class="btn btn-primary">
												<i class="fa fa-check-square-o"></i> Save
											</button>
											&nbsp;&nbsp;
										</div>
									</div>
								</div>
							</div>

						</form>
					</div>
				</fieldset>
 
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
				location = cPath+"/maintain/course.htm";				
			});
			
		});
 	
	 </script>
	 
	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
	 
</body>

</html>