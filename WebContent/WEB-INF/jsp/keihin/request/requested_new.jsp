<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
<div class="content-wrapper yung">
	<!-- หัวข้อ         -->
	<section class="content-header">
		<h1>
			<i class="fa fa-clipboard"></i>&nbsp;New Request <small> : Gas Detector </small>
		</h1>
	</section>
	<!--ค้นหา  -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-success">
					<div class="box-header with-border  text-center">
						<h4 style="background-color:#f7f7f7; text-align: center; padding: 10px; margin:0; font-weight: bold;">
                            SHE EQUIPMENT SERVICE REQUEST
                        </h4>
					</div>
					
					<div class="box-body">

							<fieldset>
 
								<!-- 							<legend>Emission Total</legend> -->
								<form class="form-horizontal" id="saveform" command="util" data-toggle="validator">
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramType" class="col-lg-5 control-label">บริษัท (Company)</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"  value="${_userProfile.companyName}"  readonly/> 
													<input type='hidden'   id="companyForm" name="companyForm"  value="${_userProfile.companyCode}" />  
												</div>
											</div>
										</div>
										
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">รหัสรายการ (Job No.)</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"  id="jobNoForm" name="jobNoForm" readonly="readonly" value="${_CURR_YEAR}XXXX" />
												</div>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">ชื่อผู้ร้องขอ (Requester's Name)
												</label>
												<div class="col-lg-6"> 
													<input type='text' class="form-control"   id="requesterName" name="requesterName" value="${_userProfile.firstNameTh} ${_userProfile.lastNameTh}" readonly="readonly"   />
													<input type='hidden'  id="requesterId" name="requesterId" value="${_userProfile.userId}" />  
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">แผนก/ฝ่าย (Department)</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"   value="${_userProfile.deptName}" readonly="readonly"/>  
													<input type='hidden'  id="departmentForm" name="departmentForm" value="${_userProfile.deptCode}" />  
												</div>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">โทรศัพท์ (Ext.)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"  id="telephoneForm" name="telephoneForm" value="${_userProfile.mobile}" readonly="readonly"/>
												</div>
											</div>
										</div>

									<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">ชื่อตัวแทน (Agent Name)
												</label>
												<div class="col-lg-6">
<!-- 												<div class="col-lg-6"> -->
													<select class="form-control selectpicker" name="agentNameForm" id="agentNameForm"
														title="${_PLEASE_SELECT}"    data-live-search="true" >
														<c:forEach var="item" items="${LOV_USR_ALL_LIST}">
															<option data-subtext="(${item.email})" value="${item.firstNameTh} ${item.lastNameTh}">${item.firstNameTh} ${item.lastNameTh}</option>
														</c:forEach>
													</select>
<!-- 													<div class="help-block with-errors"></div> -->
<!-- 													<input type='text' class="form-control"  id="agentNameForm" name="agentNameForm"   /> -->
												</div>
											</div>
										</div>
										
									</div>
									
									
									<div class="row"
										style="padding-left: 65px; padding-right: 65px;">
										<div class="col-lg-12">
											<div class="form-group">
												<legend><strong>วัตถุประสงค์ (Purpose)</strong></legend>
<!-- 												<label class="control-label radio-inline"> <input  onclick="conditionNotOther();" -->
<!-- 													type="radio" name="ObjectOptions" id="ObjectOptions1" checked -->
<!-- 													value="RF"> อัดบรรจุ (Refill) -->
												</label> <label class=" control-label radio-inline"> <input  onclick="conditionNotOther();"
													type="radio" name="ObjectOptions"   checked
													value="CL"> สอบเทียบ (Calibration) 
												</label> <label class=" control-label radio-inline"> <input  onclick="conditionNotOther();"
													type="radio" name="ObjectOptions"  
													value="RP"> ซ่อม (Repair)
												</label> <label class=" control-label radio-inline"> <input  onclick="conditionNotOther();"
													type="radio" name="ObjectOptions"  
													value="CH"> ตรวจเช็ค (Check)
												</label>											
												 <label class=" control-label radio-inline"> <input onclick="conditionOther();"
													type="radio" name="ObjectOptions"  
													value="OT"> อื่นๆ (Other)
												</label>
												<label class=" control-label radio-inline"> 
												  <input type="text" class="form-control" name="OtherForm" id="OtherForm"  disabled="disabled">
												</label>											
											</div>
										</div>
									</div>
									
									
									
									<div class="row" style="padding-left: 65px; padding-right: 65px;">
										<div class="row" style="padding-left: 65px; padding-right: 65px;">
											<div class="col-lg-12">
												<div class="form-group">
													<div class="row">
														<label for="paramCode" class="col-lg-3 control-label">เลือกอุปกรณ์ (Select Equipment)
														</label>
														<div class="col-lg-6">
															<select class="form-control selectpicker show-subtext" data-live-search="true" id="ItemForm" name="ItemForm" 
																  onchange="changeItemForm()" title="${_PLEASE_SELECT}" required="required">
<%-- 																	<option value="">${_PLEASE_SELECT}</option> --%>
																	<c:forEach var="item" items="${USER_EQUIPMENT_REQ}">
																		<option data-subtext="(${item.serialNo}, ${item.brand}, ${item.model} )" value="${item.eqCode}">${item.eqCode}</option>
																	</c:forEach>
															</select>
														</div>
													</div>
													<table class="table table-striped table-bordered">
														<thead>
															<tr>
																<th class="text-center" >หมายเลขอุปกรณ์ (Equipment No.)</th>
																<th class="text-center"  >ซีรีนัมเบอร์ (Serial No.)</th>
																<th class="text-center"  >แบรนด์ (Brand)</th>
																<th class="text-center"  >โมเดล(Model)</th>
<!-- 																<th class="text-center"  >ประเภท (Type)</th> -->
															</tr>
														</thead>
														<tbody>
															<tr>
																<td class="text-center" ><label id="equipmentNo" name="equipmentNo" ></label></td>
																<td class="text-center"  ><label id="seriesNoTxt" name="seriesNoTxt"></label></td>
																<td class="text-center"  ><label id="brandTxt" name="brandTxt"></label></td>
																<td class="text-center"  ><label id="modelTxt" name="modelTxt"></label></td>
<!-- 																<td class="text-center"  ><label id="equipmentType" name="equipmentType"></label></td> -->
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 text-left">
												<button type="reset"
													onclick="window.location.href='gas_requested_list.htm'"
													class="btn btn-default" style=" width: 100px; "><i class="fa fa-arrow-circle-left"></i> &nbsp;กลับ/Back </button>
											</div>
											<div class="col-lg-6 text-right">
												<button type="button" class="btn btn-success" style=" width: 100px; " onclick="saveOrUpdate()"><i class="fa fa-send"></i>&nbsp; ส่ง /Send </button>
												&nbsp;&nbsp;
											</div>
										</div>
								</form>
							</fieldset>
						</div>
					</div>
				</div>
			</div>

		</section>
	</div>



	<script type="text/javascript">
	
		var dataResult = ${USER_EQUIPMENT_JSON};
		var userProfileResult ;
		var jsonObj = {
				"id" : "",
				"equipmentId" : "",
				"jopNo" : "",
				"approveId" : "",
				"receiveId" : "",
				"requestStatus" : "",
				"companyCode" : "",
				"companyName" : "",
				"departmentCode" : "",
				"departmentName" : "",
				"requesterCode" : "",
				"requesterName" : "",
				"agentName" : "",
				"phone" : "",
				"objectiveCode" : "",
				"objectiveName" : "",
				"eqCode" : "",
				"serialNo" : "",
				"equipmentType" : "",
				"status":""				
			};
		

		
		
		$(function() {
// 			getDataUser();
		});
		
/* 		function getDataUser(){
			    
		
			
			$.ajax({
				method : "GET",
				url : cPath + "/GasRequest/getDataRequest"

			}).done(function(result) {
				console.log(result);
				

				dataResult = result.data;
				userProfileResult = result.userProfile;
// 				Set data Personal
				if(userProfileResult != null){
					 var name = userProfileResult.firstNameTh+" "+userProfileResult.lastNameTh;
// 					 var name = userProfileResult.title +" "+userProfileResult.firstNameTh+" "+userProfileResult.lastNameTh;
					 $("#companyForm").val(userProfileResult.companyName);
					 $("#departmentForm").val('พนักงาน');
					 $("#requestedNameForm").val(name);
					 $("#telephoneForm").val(userProfileResult.mobile);
					 
				};
// 				Set data Select Item
				if(dataResult != null){
					getDataOnSelect(dataResult);
					
					 
				};
				
			}).fail(function(jqXHR, textStatus, errorThrown) {
 				alert('ERROR');

			});

		};
		 */
		function getDataOnSelect(dataResult){
//			  console.log("getDataOnSelect",CompanyType);
			  var temp= dataResult;
			  var $select = $('#ItemForm');                        
			    $select.find('option').remove();   
			    $('<option>').val('').text('Please select ...').appendTo($select);
			    $.each(temp, function(key, value) {         
	    
			    	$('<option>').val(value.id).text(value.eqCode).appendTo($select);

			    });
// 			    changeItemForm($('#prtrChemicalIdForm').val());
		}
		
		
		 
		function changeItemForm(){
			
			var valueEqCode = $("#ItemForm").val();
// 			console.log(dataResult);
			$.each(dataResult, function(key, value) {         
			    if(valueEqCode == value.eqCode){
			    	
			    	$("#equipmentNo").text(value.eqCode);
					$("#seriesNoTxt").text(value.serialNo);
					$("#brandTxt").text(value.brand);
					$("#modelTxt").text(value.model);
					
					jsonObj = value;
			    }
		    });
			
// 			console.log(jsonObj);
			/* 
			if(valueEqCode == "" ){
				$("#equipmentNo").text('-');
				$("#equipmentSeriesNo").text('-');
				$("#equipmentType").text('-');
			}else{
				 $.each(dataResult, function(key, value) {         
					    if(valueEqCode == value.id){
					    	
					    	$("#equipmentNo").text(value.eqCode);
							$("#equipmentSeriesNo").text((value.serialNo != null) ? value.serialNo :'-');
							$("#equipmentType").text((value.eqTypeName != null) ? value.eqTypeName :'-');
							
					    }
				    });
			} */
			
		};
		
		function conditionOther(){
			
			$("#OtherForm").prop( "disabled", false );
			  
		};
		function conditionNotOther(){
			
			$("#OtherForm").val('');
			$("#OtherForm").prop( "disabled", true );
			

			
		};

		function getselectItem(){
			
		};
		
		
		function saveOrUpdate(){
			
			var ObjectOptions = $('input[name=ObjectOptions]:checked', '#saveform').val();
			
// 			alert(ObjectOptions);
			if(ObjectOptions == "" ){
				alert("กรุณาเลือกวัตถุประสงค์");
				return false;
			}
			
			
			var ItemForm = $('#ItemForm').val();
			if(ItemForm == "" ){
				alert("กรุณาเลือกอุปกรณ์ /Please select equipment");
				
				return false;
			}
			
			jsonObj.equipmentId 	= jsonObj.id;
			jsonObj.companyCode	    = $('#companyForm').val();	
			jsonObj.departmentCode	= $('#departmentForm').val();
			jsonObj.requesterId	= $('#requesterName').val();;			
			jsonObj.phone 			= $('#telephoneForm').val();
			
			
			jsonObj.agentName 		= $('#agentNameForm').val();
			jsonObj.objectiveCode 	= ObjectOptions;
			if(ObjectOptions == 'OT'){
				jsonObj.objectiveName = $('#OtherForm').val();
				
				if(jsonObj.objectiveName.trim()==""){
					alert("กรุณากรอกวัตถุประสงค์อื่นๆ / Please input Other.");
					return false;
				}
			}
			
			jsonObj.eqCode 			= $("#equipmentNo").text();
			
// 			console.log(jsonObj);

			bootbox.confirm({
				    title: "Confirm",
				    size: 'small',
				    message: "Confirm send this request?",
				    buttons: {
				        cancel: {
				            label: '<i class="fa fa-times"></i> Cancel',
				            className: 'btn-danger'
				        },
				        confirm: {
				            label: '<i class="fa fa-check"></i> Confirm',
				            className: 'btn-success'
				        }
				    },
				    callback: function (result) {
				        if(result){
				        	$.ajax({
								method : "POST",
								data : jsonObj,
								url : cPath + "/GasRequest/save"
				
							}).done(function(result) {
// 								 $.notify({
// 									title: "<strong>Success!</strong> ",
// 									message: " Save successfully"
// 								});

								location = cPath + "/gas/gas_requested_list.htm?status=S";
								 
								 
							}).fail(function(jqXHR, textStatus, errorThrown) {
				 				alert('ERROR');

							});
				        }
				    }
				});
// 			alert(ItemForm);
		};
		
		
	
		
		
	</script>