<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
	
	<c:set var="_SAVE_MODE" scope="page" value="${param['edit']=='Y'||param['add']=='Y'}"/>
	<c:set var="_EDIT_MODE" scope="page" value="${param['edit']=='Y'||param['add']=='Y'? '' : 'disabled'}"/>
	
</head>

<body>

	<!--  --- MENU --- -->
	<%@include file="/WEB-INF/jsp/tpcc/she/menu.jsp" %>
	
	 <div class="container">
		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-8 col-md-7 col-sm-6">
					<h3><i class='fa fa-edit'></i> ${_SAVE_MODE? 'Add/Edit': 'View'} Asset</h3>
				</div>
			</div>
		</div>
		
		
		  <fieldset ${_EDIT_MODE}><div class="well">
		   <form class="form-horizontal" id="form" action="assetSave.htm" method="post" command="invAsset" data-toggle="validator">  
	         
	        <div class="row">  <div class="col-lg-6">
	          
	          <!-- 	 <------- Don't forget this Haha -->
				<input type="hidden" class="form-control" name="assetId" value="${invAsset.assetId}">
	          
                  <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Host ID</label>
                    <div class="col-lg-6">

						<c:if test="${empty param['assetId']}">
	                      <input type="text" class="form-control " id="hostId" name="hostId" value="${invAsset.hostId}"  data-remote="checkHostId" data-remote-error="Host ID already exists."
	                      		data-minlength="9" maxlength="9" data-error="Minimum of 9 characters" required>
	                      		<div class="help-block with-errors"></div>
						</c:if>
						<c:if test="${not empty param['assetId']}">
						     <input type="text" class="form-control " name="hostId" value="${invAsset.hostId}" readonly="readonly">
						</c:if>

                    </div>
<!--                     <button type="button" class="btn btn-primary" onclick="checkHostId()">Check <i class="fa fa-check-square-o"></i></button> -->
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Type</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="type" required>
<!--                        	<option value="">None</option> -->
                       	<c:forEach var="item" items="${LOV_ASSET_TYPE}"> 
					        <option value="${item.code}" ${item.code == invAsset.type ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                    </div>
                  </div>
                  
                   <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Status</label>
                    <div class="col-lg-6">
                      <select class="form-control" name="status" required>
<!--                        	<option value="">None</option> -->
                       	<c:forEach var="item" items="${LOV_ASSET_STATUS}"> 
					        <option value="${item.code}" ${item.code == invAsset.status ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                    </div>
                  </div>
                  
            	 <div class="form-group">
                    <label for="" class="col-lg-4 control-label">S/N</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control " name="sn" value="${invAsset.sn}"  >
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Brand</label>
                    <div class="col-lg-6">
					 	  <select class="form-control" name="brand" required>
					 	  	<option value="">None</option>
	                       	<c:forEach var="item" items="${LOV_BRAND}"> 
						        <option value="${item.code}" ${item.code == invAsset.brand ? 'selected="selected"' : ''}>${item.descTH}</option>
						    </c:forEach>
	                      </select>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Model</label>
                    <div class="col-lg-6">
<%--                       <input type="text" class="form-control" name="models" value="${invAsset.models}" > --%>
						<select class="form-control" name="models" required>
							<option value="">None</option>
	                       	<c:forEach var="item" items="${LOV_MODEL}"> 
						        <option value="${item.code}" ${item.code == invAsset.models ? 'selected="selected"' : ''}>${item.descTH}</option>
						    </c:forEach>
	                      </select>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Exp. Code</label>
                    <div class="col-lg-6">
			             <input type='text' class="form-control" name="expCode" value="${invAsset.expCode}"  />
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Fixed Asset</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name="fixedAsset"  value="${invAsset.fixedAsset}"  >
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Warranty Exp. Date</label>
                    <div class="col-lg-6">
			                <div class='input-group date'>
			                    <input type='text' class="form-control"  name='warrantyExpDate' value="${invAsset.warrantyExpDate}" required/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div>
                  
                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Docking S/N</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="dockingSn" value="${invAsset.dockingSn}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Docking ADP S/N</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="dockingAdpSn" value="${invAsset.dockingAdpSn}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">External DVD S/N</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="externalDvdSn"  value="${invAsset.externalDvdSn}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">PO number</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="poNumber"  value="${invAsset.poNumber}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Supplier</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="supplier"  value="${invAsset.supplier}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Warranty Type</label>
	                    <div class="col-lg-6">
			                <select class="form-control" name="warrantyType" >
<!-- 		                       	<option value="">None</option> -->
		                       	<c:forEach var="item" items="${LOV_WARRANTY_TYPE}"> 
							        <option value="${item.code}" ${item.code == invAsset.warrantyType ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
		                      </select>
                    </div>
	                  </div>
	                 
	                
	          </div>
	          
	          
	          
	          
	          <div class="col-lg-6">
	                 <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">CPU</label>
	                    <div class="col-lg-6">
						<select class="form-control" name="cpu" required>
							<option value="">None</option>
	                       	<c:forEach var="item" items="${LOV_CPU}"> 
						        <option value="${item.code}" ${item.code == invAsset.cpu ? 'selected="selected"' : ''}>${item.descTH}</option>
						    </c:forEach>
	                      </select>
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">RAM</label>
	                    <div class="col-lg-6">
<%-- 	                      <input type="text" class="form-control" name="ram"  value="${invAsset.ram}" > --%>
							<select class="form-control" name="ram" required>
								<option value="">None</option>
		                       	<c:forEach var="item" items="${LOV_RAM}"> 
							        <option value="${item.code}" ${item.code == invAsset.ram ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
		                      </select>
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">HDD</label>
	                    <div class="col-lg-6">
<%-- 	                      <input type="text" class="form-control" name="hdd"  value="${invAsset.hdd}"  > --%>
							<select class="form-control" name="hdd" required>
								<option value="">None</option>
		                       	<c:forEach var="item" items="${LOV_HDD}"> 
							        <option value="${item.code}" ${item.code == invAsset.hdd ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
		                      </select>
	                    </div>
	                  </div>
	                  
	                    <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">S/N2</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="sn2"  value="${invAsset.sn2}" >
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">OS</label>
	                    <div class="col-lg-6">
<%-- 	                      <input type="text" class="form-control" name="os"  value="${invAsset.os}" > --%>
							<select class="form-control" name="os" required>
								<option value="">None</option>
		                       	<c:forEach var="item" items="${LOV_OS}"> 
							        <option value="${item.code}" ${item.code == invAsset.os ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
		                      </select>
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Monitor Model</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="monitorModel"  value="${invAsset.monitorModel}" >
	                    </div>
	                  </div>
	                  
	                   <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Monitor S/N</label>
	                    <div class="col-lg-6"> 
	                      <input type="text" class="form-control  " name="monitorSn"  value="${invAsset.monitorSn}"  >
	                    </div>
	                  </div>
	                  
	                   <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Keyboard S/N</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="keyboardSn"  value="${invAsset.keyboardSn}"  >
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Mouse S/N</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="mouseSn"  value="${invAsset.mouseSn}" >
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Bag S/N</label>
	                    <div class="col-lg-6">
	                   	 <input type="text" class="form-control  " name="bagSn"  value="${invAsset.bagSn}" >
                       </div>
	                  </div>
	                  
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Pool Computer</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="poolComputer"  value="${invAsset.poolComputer}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Head Count</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="headcount"  value="${invAsset.headcount}" >
	                    </div>
	                  </div>
	                  
	                   <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Acquired Date</label>
	                    <div class="col-lg-6">
			                <div class='input-group date' >
			                    <input type='text' class="form-control"  name='acquiredDate' value="${invAsset.acquiredDate}" required/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    	</div>
	                  </div>
	                   
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Note</label>
	                    <div class="col-lg-6">
	                      <textarea class="form-control" rows="3" name="note" >${invAsset.note}</textarea>
	                    </div>
	                  </div>
	          </div>
</div>
			 	<c:if test="${_SAVE_MODE}">
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
				</c:if>

				</form></div>
            </fieldset>
            
            <c:if test="${!_SAVE_MODE}">
            <div class="row">
						<div class="col-lg-12 text-center">
							<button type="button" id="backBtn" class="btn btn-primary" onclick="history.back()"> <i class="fa fa-reply"></i> Back </button>&nbsp;
						</div>
						
			</div></c:if>
            
            <div class="clearfix"><br></div>
            
            
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
			
			$('.date').datepicker({
				   format: 'dd/mm/yyyy'
			});
			
			$(".date").datepicker("setDate", new Date());
		
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
				location = cPath+"/maintain/asset.htm";				
			});
			
		});
 	
	 </script>
	 
	 
	 <c:remove var="SAVE_STATUS" scope="session"/>
	 
</body>

</html>