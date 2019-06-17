<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="/resources/adminLTE/common.jsp" %>

<body class="${bodySkin}">

<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<div class="content-wrapper">

	<section class="content-header">
		<h1>
			<i class='fa fa-users'></i> Add/Edit
<%--  ${_SAVE_MODE? '<i class=\'fa fa-user-plus\'></i> Add/Edit': '<i class=\'fa fa-id-card-o\'></i> View'} User Profile  --%>
			
		</h1>
	</section>
	 	
	 	
	 	<section class="content">
	 	
	 	
		   <form class="form-horizontal" id="form" action="userSave.htm" method="post" command="userProfile" data-toggle="validator">
		     
	           <fieldset class="well"><div class="w  ">
	           
	                <input type="hidden" class="form-control" name="userId" value="${userProfile.userId}">
	                
				<div class="row">  
					<div class="col-lg-6">
					
				  		 <div class="form-group has-feedback">
			                    <label for="" class="col-lg-4 control-label">User Name</label>
			                    <div class="col-lg-6">
			                    	<c:if test="${empty param['userId']}">
				                       <input type="text" class="form-control" name="userName" data-minlength="4" maxlength="20"
			                         			data-remote="checkExist" data-remote-error="User Name already exists." data-error="Minimum of 4 characters" ${_EDIT_MODE} required>
				                      		<div class="help-block with-errors"></div>
									</c:if>
									<c:if test="${not empty param['userId']}">
									     <input type="text" class="form-control " name="userName" value="${userProfile.userName}" readonly="readonly" ${_EDIT_MODE}>
									</c:if>
			                    </div>
		                  </div>
				            
				        
				  			<div class="form-group has-feedback">
				              <label for="" class="col-lg-4 control-label">${empty param['userId']? '': 'Change'} Password</label>
				              <div class="col-lg-6">
				                <input  type="password" data-minlength="6" class="form-control" id="inputPassword" name="password" 
				                	data-error="Minimum of 6 characters"  ${_EDIT_MODE} ${not empty param['add']? 'required': ''}>
				                <div class="help-block with-errors"></div>
				              </div>
				            </div>
			              
				 	</div>
				 	
					<div class="col-lg-6">
					
						  <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Role</label>
			                    <div class="col-lg-6">
			                       <select  class="form-control selectpicker" id="roleCode" name="roleCode" title="${_PLEASE_SELECT}" ${_EDIT_MODE} multiple required>
									    <c:forEach var="item" items="${LOV_ROLE}">
									     	<option value="${item.code}">${item.descTH}</option>
									    </c:forEach>
									</select>
													                      		<div class="help-block with-errors"></div>
									
			                    </div>
			              </div>
				            
				            <div class="form-group has-feedback">
				              <label for="" class="col-lg-4 control-label">Confirm Password</label>
				              <div class="col-lg-6">
				                <input type="password" data-minlength="6" class="form-control"  data-match="#inputPassword"
				                 data-error="Minimum of 6 characters" data-match-error="Password Not Match"  ${_EDIT_MODE} ${not empty param['add']? 'required': ''}>
				              	<div class="help-block with-errors"></div>
				              </div>
				            </div> 
				 	</div>
				</div>
	         
	         <div class="row">
						<div class="col-lg-12"><hr>
						</div>
					</div>
	         
		         <div class="row">  
			          <div class="col-lg-6">
			          
		            		<div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Title</label>
			                    <div class="col-lg-6">
			                       <select  class="form-control" name="title" ${_EDIT_MODE} required>
									    <c:forEach var="item" items="${LOV_TITLE}">
									     	<option value="${item.code}" ${item.code == userProfile.title ? 'selected="selected"' : ''}>${item.descTH}</option>
									    </c:forEach>
								</select>				                      		 
								<div class="help-block with-errors"></div>
			                    </div>
			               </div>
		                  <div class="form-group">
		                    <label for="" class="col-lg-4 control-label">First Name</label>
		                    <div class="col-lg-6">
		                      <input type="text" class="form-control" name="firstNameTh" value="${userProfile.firstNameTh}" ${_EDIT_MODE} required>
		                    <div class="help-block with-errors"></div>
		                    </div>
		                  </div>
		                  
		                  <div class="form-group">
		                    <label for="" class="col-lg-4 control-label">Mobile</label>
		                    <div class="col-lg-6">
		                      <input type="text" class="form-control" name="mobile" value="${userProfile.mobile}" ${_EDIT_MODE}>
		                    <div class="help-block with-errors"></div>
		                    </div>
		                  </div>
		                  <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Email</label>
			                    <div class="col-lg-6">
			                      <input type="text" class="form-control" name="email" value="${userProfile.email}" ${_EDIT_MODE}>
			                    <div class="help-block with-errors"></div>
			                    </div>
			                  </div>
			          </div>
			          
			          
		<!-- 	        ------------  Left Side -->
			          <div class="col-lg-6">
			          
			          		 <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Gender</label>
			                    <div class="col-lg-6">
			                       <select  class="form-control" name="gender" ${_EDIT_MODE}>
									    <c:forEach var="item" items="${LOV_GENDER}">
									     	<option value="${item.code}" ${item.code == userProfile.gender ? 'selected="selected"' : ''}>${item.descTH}</option>
									    </c:forEach>
								</select>
								<div class="help-block with-errors"></div>
			                    </div>
			                  </div>
			                  
		<!-- 	          		   <div class="form-group"> -->
		<!-- 	                    <label for="" class="col-lg-4 control-label">Password</label> -->
		<!-- 	                    <div class="col-lg-6"> -->
		<!-- 	                      <input type="password" data-minlength="6" class="form-control" id="inputPassword" name="password" required> -->
		<!-- 	                    </div> -->
		<!-- 	                  </div> -->
			                  
		<!-- 	                  <div class="form-group"> -->
		<!-- 	                    <label for="" class="col-lg-4 control-label">Confirm Password</label> -->
		<!-- 	                    <div class="col-lg-6"> -->
		<!-- 	                      <input type="password" data-minlength="6" class="form-control"  data-match="#inputPassword" data-match-error="Password Not Match" required> -->
		<!-- 	                    </div> -->
		<!-- 	                  </div> -->
			                  
			                  
			                  <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Last Name</label>
			                    <div class="col-lg-6">
			                      <input type="text" class="form-control" name="lastNameTh" ${_EDIT_MODE} value="${userProfile.lastNameTh}" required>
			                   		<div class="help-block with-errors"></div>
			                    </div>
			                  </div>
			                  
<!-- 					         <div class="form-group"> -->
<!-- 			                    <label for="" class="col-lg-4 control-label">Company</label> -->
<!-- 			                    <div class="col-lg-6"> -->
<!-- 			                     	<select  class="form-control" name="companyCode" required > -->
<%-- 										<option value="">${_PLEASE_SELECT}</option> --%>
<%-- 									    <c:forEach var="item" items="${LOV_COMPANY}"> --%>
<%-- 									     	<option value="${item.code}" ${item.code == userProfile.companyCode ? 'selected="selected"' : ''}>${item.descTH}</option> --%>
<%-- 									    </c:forEach>									     --%>
<!-- 									</select> -->
<!-- 									<div class="help-block with-errors"></div> -->
<!-- 			                    </div> -->
<!-- 			                  </div> -->
			                  
<!-- 					         <div class="form-group"> -->
<!-- 			                    <label for="" class="col-lg-4 control-label">Department</label> -->
<!-- 			                    <div class="col-lg-6"> -->
<!-- 			                     	<select  class="form-control" name="deptCode" required > -->
<%-- 										<option value="">${_PLEASE_SELECT} </option> --%>
<%-- 									    <c:forEach var="item" items="${LOV_DEPT}"> --%>
<%-- 									     	<option value="${item.code}" ${item.code==userProfile.deptCode ? 'selected="selected"' : ''} >${item.descTH}</option> --%>
<%-- 									    </c:forEach> --%>
<!-- 									</select> -->
<!-- 									<div class="help-block with-errors"></div> -->
<!-- 			                    </div> -->
<!-- 			                  </div> -->
			                  
			                  
			                  <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Factory</label>
			                    <div class="col-lg-6">
			                     	<select  class="form-control" name="companyCode" required >
										<option value="">${_PLEASE_SELECT}</option>
									    <c:forEach var="item" items="${LOV_FACTORY}">
									     	<option value="${item.code}" ${item.code == userProfile.factory.factory_ID ? 'selected="selected"' : ''}>${item.descTH}</option>
									    </c:forEach>									    
									</select>
									<div class="help-block with-errors"></div>
			                    </div>
			                  </div>
			                  
					         <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Section</label>
			                    <div class="col-lg-6">
			                     	<select  class="form-control" name="deptCode" required >
										<option value="">${_PLEASE_SELECT} </option>
									    <c:forEach var="item" items="${LOV_SECTION}">
									     	<option value="${item.code}" ${item.code == userProfile.section.section_ID ? 'selected="selected"' : ''}>${item.descTH}</option>
									    </c:forEach>
									</select>
									<div class="help-block with-errors"></div>
			                    </div>
			                  </div>
	                  
	                  
			                  <div class="form-group">
			                    <label for="paramStatus" class="col-lg-4 control-label">Status</label>
			                    <div class="col-lg-6">
			                       <select class="form-control" name="activeFlg" ${_EDIT_MODE}>
			                       	<c:forEach var="item" items="${LOV_ACTIVE_TYPE}"> 
								        <option value="${item.code}" ${item.descTH == userProfile.activeFlg ? 'selected="selected"' : ''}>${item.descTH}</option>
								    </c:forEach>
			                      </select>
			                      <div class="help-block with-errors"></div>
			                    </div>
			                  </div>
			           </div>
		     	 </div>
	     	 
	     	 
				 <div class="row">
						<div class="col-lg-12">
							<div class="form-group "> 
								<div class="col-lg-12 text-center">
								<button type="button" id="cancelBtn" class="btn btn-default"><i class="fa fa-times-circle"></i> Cancel </button>
<%-- 									<c:if test="${_SAVE_MODE}"> --%>
										&nbsp; <button type="button" id="saveBtn" class="btn btn-primary" ${_EDIT_MODE}><i class="fa fa-check-square-o"></i> Save</button>&nbsp;&nbsp;
<%-- 									</c:if> --%>
								</div>
							</div>
						</div>
					</div>
					
				</div>
            </fieldset>
            
	 
	 </form>
			
   <section class="content"> 
            
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
		
			var sel = '${userProfile.roleCode}';
// 			console.log(sel);
			if($.trim(sel)!=""){
				sel =  sel.split(',');
				$('#roleCode').selectpicker('refresh'); 
				$('#roleCode').selectpicker('val', sel);
			}
		
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
				location = cPath+"/admin/user/viewUser.htm";		
// 				history.back();
			});
			
		});
 	
	 </script>
	 
	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
	 
</body>

</html>