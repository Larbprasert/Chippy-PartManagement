<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="/resources/adminLTE/common.jsp" %>

<body class="${bodySkin}">

<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<div class="content-wrapper">

		<section class="content-header">
		<h1><i class='fa fa-edit'></i> Add/Edit Parameter</h1>
		</section>
		
				<section class="content">	
		
	  <div class="well">
				 
				 
		  <form class="form-horizontal" id="form" action="paramSave.htm" method="post" command="sysParam">  
			          
			
				<div class="row">
				<div class="col-lg-10">
				
<!-- 				     <div class="form-group "> -->
<!-- 	                    <label for="paramCode" class="col-lg-4 control-label">Parameter Id</label> -->
<!-- 	                    <div class="col-lg-6"> -->
	                       <input type="hidden" class="form-control" name="paramId" value="${sysParam.paramId}">
<!-- 	                    </div> -->
<!-- 	             </div> -->
				
		          <div class="form-group ">
	                    <label for="paramType" class="col-lg-4 control-label">Parameter Type</label>
	                    <div class="col-lg-6">
							<select  class="form-control selectpicker show-tick" data-live-search="true" name="paramType" title="${_PLEASE_SELECT}" required>
<!-- 								<option value="" >--- Please Select ---</option> -->
							    <c:forEach var="item" items="${LOV_PARAM_TYPE}">
							     	<option value="${item.code}" ${item.code == sysParam.paramType ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
							</select>
	                    </div>
	             </div>
		          
		          <div class="form-group ">
	                    <label for="paramCode" class="col-lg-4 control-label">Parameter Code</label>
	                    <div class="col-lg-6">
	                       <input type="text" class="form-control" name="paramCode" value="${sysParam.paramCode}" required>
	                    </div>
	             </div>
	             
		          <div class="form-group ">
	                    <label for="paramDesc" class="col-lg-4 control-label">Description TH</label>
	                    <div class="col-lg-6">
	                       <input type="text" class="form-control" name="descTh" value="${sysParam.descTh}"  required>
	                    </div>
	             </div>
	             
		          <div class="form-group ">
	                    <label for="paramDesc" class="col-lg-4 control-label">Description EN</label>
	                    <div class="col-lg-6">
	                       <input type="text" class="form-control" name="descEn" value="${sysParam.descEn}" required>
	                    </div>
	             </div>
		          
		          <div class="form-group ">
	                    <label for="paramDesc" class="col-lg-4 control-label">Value 1 (Number)</label>
	                    <div class="col-lg-6">
	                       <input type="text" class="form-control number" name="value_1" value="${sysParam.value_1}">
	                    </div>
	             </div>
	             
		          <div class="form-group ">
	                    <label for="paramDesc" class="col-lg-4 control-label">Value 2 (Text)</label>
	                    <div class="col-lg-6">
	                       <input type="text" class="form-control" name="value_2" value="${sysParam.value_2}">
	                    </div>
	             </div>
		          
		          <div class="form-group ">
	                    <label for="sortNo" class="col-lg-4 control-label">Sort No.</label>
	                    <div class="col-lg-6">
	                       <input type="text" class="form-control number" name="sortNo" value="${sysParam.sortNo}" min="1" required>
	                    </div>
	             </div>
		          
		          <div class="form-group ">
	                    <label for="paramStatus" class="col-lg-4 control-label">Status</label>
	                     <div class="col-lg-6">
	                       <select class="form-control" name="active">
<!-- 	                       	<option value="">${_ALL}</option> -->
 								<c:forEach var="item" items="${LOV_ACTIVE_TYPE}"> 
							        <option value="${item.code}" ${item.code == sysParam.active ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
	                      </select>
	                    </div>
	               </div>
	</div>
	</div>
	
					<div class="row">
						<div class="col-lg-12">
							<div class="form-group "> 
								<div class="col-lg-12 text-center">
									<button type="button" id="addBtn" class="btn btn-info" disabled><i class="fa fa-plus"></i>  Add More </button>&nbsp;&nbsp;
									<button type="button" id="cancelBtn" class="btn btn-default"><i class="fa fa-times-circle"></i> Cancel </button>&nbsp;
									<button type="button" id="saveBtn" class="btn btn-success"><i class="fa fa-check-square-o"></i> Save</button>&nbsp;&nbsp;
								</div>
							</div>
						</div>
					</div>
	
					
					</form>
					</div>
            </section>
<!-- </div> -->
<!-- </div> -->
</div>


	
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
			    
			    $("#addBtn").removeAttr( "disabled" );
			}
		
			$("#saveBtn").click(function(e){
				var _f = $('#form').validator('validate');
				if (_f.has('.has-error').length==0) {
			    	doSave();
				} 
			});
			
			$("#cancelBtn").click(function(){
				location = cPath+"/maintain/parameter.htm";				
			});
			
			$("#addBtn").click(function(){
				location = cPath+"/param/paramEdit.htm";				
			});
			
		});
 	
	 </script>
	 
	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
	 
</body>

</html>