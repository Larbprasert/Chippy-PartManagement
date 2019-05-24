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
					<h3><i class='fa fa-edit'></i> Edit : Training Need by Job Position</h3>
				</div>
			</div>
		</div>

				<fieldset>
					<div class="well">
						<form class="form-horizontal" id="form" action="positionSave.htm"
							method="post" command="positionCourse" data-toggle="validator">  

							<div class="col-lg-6">
							
								<!-- 	 <------- Don't forget this Haha -->
								<input type="hidden" class="form-control" name="positionId" value="${positionCourse.positionId}">
								
				                  
			 					<div class="form-group ">
					                    <label for="positionCode" class="col-lg-4 control-label">Position Code</label>
					                    <div class="col-lg-6">
<%-- 					                       <input type="text" class="form-control" name="positionCode" value="${positionCourse.positionCode}" ${empty param['positionId']? '':'readonly'} required > --%>
					                      <input type="text" class="form-control" id="positionCode"  name="positionCode" value="${positionCourse.positionCode}"  readonly  required>
					                    <div class="help-block with-errors"></div>
					                    </div>
					             </div>
					             
					             
					             
						          <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Position Name TH</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="positionNameTh" value="${positionCourse.positionNameTh}"  readonly>
					                    </div>
					             </div>
					             
					          
							</div>
							
							<div class="col-lg-6">
							
			 					
						          <div class="form-group ">
					                    <label for="" class="col-lg-4 control-label">Position Name EN</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="positionNameEn" value="${positionCourse.positionNameEn}" readonly>
					                    </div>
					             </div>
					             
					             <div class="form-group">
				                    <label for="" class="col-lg-4 control-label">Course/Training Need</label>
				                    <div class="col-lg-6">
				                             <%-- <select class="form-control" name="positionType" required>
						                       	<option value="">${_ALL}</option>
						                       	<c:forEach var="item" items="${LOV_COURSE_TYPE}"> 
											        <option value="${item.code}" ${item.code == positionCourse.positionType ? 'selected="selected"' : ''}>${item.descTH}</option>
											    </c:forEach>
						                      </select> --%>
						                      
						                    <select  class="form-control selectpicker" id="courseCode" name="courseCode" data-live-search="true"
						                    title="${_PLEASE_SELECT}" data-selected-text-format="count" multiple required>
											    <c:forEach var="item" items="${courseList}">
											     	<option value="${item.courseCode}">${item.courseCode} : ${item.courseNameTh}</option>
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
		
// 			$(".date").datepicker({
// 				   format: 'dd/mm/yyyy'
// 			});
				
			var sel = '${positionCourse.courseCode}';
			if($.trim(sel)!=""){
				sel =  sel.split(',');
				$('#courseCode').selectpicker('refresh'); 
				$('#courseCode').selectpicker('val', sel);
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
				location = cPath+"/maintain/positionCourse.htm";				
			});
			
		});
 	
	 </script>
	 
	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
	 
</body>

</html>