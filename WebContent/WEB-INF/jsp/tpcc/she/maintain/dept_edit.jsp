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
					<h3><i class='fa fa-edit'></i> Add/Edit Department</h3>
				</div>
			</div>
		</div>

				<fieldset>
					<div class="well">
						<form class="form-horizontal" id="form" action="deptSave.htm"
							method="post" command="invDept">

							<div class="col-lg-10">
							
								<!-- 	 <------- Don't forget this Haha -->
								<input type="hidden" class="form-control" name="deptId" value="${invDept.deptId}">
								
			 					<div class="form-group ">
					                    <label for="deptCode" class="col-lg-4 control-label">Department Code</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="deptCode" value="${invDept.deptCode}" ${empty param['deptId']? '':'readonly'} required >
					                    </div>
					             </div>
					             
						          <div class="form-group ">
					                    <label for="deptNameTh" class="col-lg-4 control-label">Description TH</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="deptNameTh" value="${invDept.deptNameTh}"  required>
					                    </div>
					             </div>
					             
						          <div class="form-group ">
					                    <label for="deptNameEn" class="col-lg-4 control-label">Description EN</label>
					                    <div class="col-lg-6">
					                       <input type="text" class="form-control" name="deptNameEn" value="${invDept.deptNameEn}" required>
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
				location = cPath+"/maintain/dept.htm";				
			});
			
		});
 	
	 </script>
	 
	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
	 
</body>

</html>