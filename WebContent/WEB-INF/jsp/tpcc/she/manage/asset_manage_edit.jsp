<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<%-- 	<%@include file="/resources/adminLTE/common.jsp" %> --%>
		<%@include file="/resources/adminLTE/common.jsp" %>
	
	<c:set var="_SAVE_MODE" scope="page" value="${param['edit']=='Y'||param['add']=='Y'}"/>
	<c:set var="_EDIT_MODE" scope="page" value="${param['edit']=='Y'||param['add']=='Y'? '' : 'disabled'}"/>
	
</head>


<body class="${bodySkin}">
	
		<div class="wrapper">   
	 		<%@ include file="/resources/adminLTE/common-navbar.jsp"%>
	 		<%@ include file="/resources/adminLTE/common-sidebar.jsp"%>
	 		
 <div class="content-wrapper">
 
<!--   <div class="container"> -->

		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-12">
					<h3><i class='fa fa-edit'></i> ${_SAVE_MODE? 'Manage': 'View'}  Asset</h3>
				</div>
			</div>
		</div>
		
		<div class="row"> <div class="col-lg-12">
		
		  <fieldset   ${_EDIT_MODE}><div class="well">
		   <form class="form-horizontal" id="form" action="assetSave.htm" method="post" command="invAssetHistory" data-toggle="validator">  
	         <div class="row ">
	          <div class="col-lg-6">
	          
	          <!-- 	 <------- Don't forget this Haha -->
				<input type="hidden" class="form-control" name="assetOwnerId" value="${invAssetHistory.assetOwnerId}">
				<input type="hidden" class="form-control" ${empty param['assetOwnerId']? '':'name="hostId"'} value="${invAssetHistory.hostId}">
				
	              <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Host ID</label>
                    <div class="col-lg-6">
                    
                            <select  class="form-control selectpicker show-tick" data-live-search="true"  id="hostId" 
                            ${empty param['assetOwnerId']? '':'disabled'}  name="hostId" required>
								<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_ASSET}">
							     	<option value="${item.code}">${item.descTH}</option>
							    </c:forEach>
							</select>
                    </div>
<!--                     <button type="button" class="btn btn-primary">Check <i class="fa fa-check-square-o"></i></button> -->
                  </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Owner</label>
                    <div class="col-lg-6">
                      	<select  class="form-control selectpicker show-tick" data-live-search="true" id="ownerCode"  name="ownerCode" required>
                      			<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_OWNER}">
							     	<option value="${item.code}">${item.descTH}</option>
							    </c:forEach>
							</select>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Assigned Date</label>
                    <div class="col-lg-6">
			                <div class='input-group date'>
			                    <input type='text' class="form-control"  pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='assignedDate' name='assignedDate' value="${invAssetHistory.assignedDate}" required/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Expired Date</label>
                    <div class="col-lg-6">
			                <div class='input-group date' >
			                    <input type='text' class="form-control"  pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='expiredDate' name='expiredDate' value="${invAssetHistory.expiredDate}" required/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div>
                  
	          	<div class="form-group">
                    <label for="assetType" class="col-lg-4 control-label">Asset Status</label>
                    <div class="col-lg-6">
                        <select class="form-control" name="status" required>
                       	<c:forEach var="item" items="${LOV_ASSET_STATUS}"> 
					        <option value="${item.code}" ${item.code == invAssetHistory.status ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                    </div>
                  </div>
 
                 
            	 </div>
            	 
            	 
	          <div class="col-lg-6">
	               <div class="form-group">
                    <label for="name" class="col-lg-2 control-label">Remark</label>
                       <div class="col-lg-8">
                          <textarea class="form-control" rows="8"  name='remark'>${invAssetHistory.remark}</textarea>
                       </div>
                    </div>
                    
             </div>
	       
	          
                  

				
					<div class="col-lg-12 ${_SAVE_MODE? '':'hidden'}">
						<div class="form-group "> 
							<div class="col-lg-12 text-center">
								<button type="button" id="cancelBtn" class="btn btn-default"><i class="fa fa-times-circle"></i> Cancel </button>&nbsp;&nbsp;
								<button type="button" id="saveBtn" class="btn btn-primary"><i class="fa fa-save"></i> Save </button>&nbsp;
							</div>
						</div>
					</div>
				</div>

				</form></div>
           </div> </fieldset>
            
        </div>
		
        <div class="row ${_SAVE_MODE? 'hidden':''}">
			<div class="col-lg-12 text-center">
				<button type="button" id="backBtn" class="btn btn-primary" onclick="history.back()"> <i class="fa fa-reply"></i> Back </button>&nbsp;
			</div>
		</div> 
			
		<div class="clearfix"><br></div>
		
	</div>	
	</div>
	
	<!-- 	##### <<<<<  TAB ####------------------- -->
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
			location = cPath+"/manage/assetmanage.htm";				
		});
			
	 </script>
	 
	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
</body>

</html>