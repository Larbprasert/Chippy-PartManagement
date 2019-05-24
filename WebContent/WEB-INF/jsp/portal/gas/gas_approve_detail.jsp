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
				<i class="fa fa-clipboard"></i>&nbsp;Approve / Cancel <small>
					: Gas Detector </small>
			</h1>
		</section>
		<!--ค้นหา  -->
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-success">
						<div class="box-header with-border  text-center">
							<h4
								style="background-color: #f7f7f7; text-align: center; padding: 10px; margin: 0; font-weight: bold;">
								SHE EQUIPMENT SERVICE REQUEST</h4>
						</div>

						<div class="box-body">

							<form class="form-horizontal" id="saveform" command="util"
								data-toggle="validator">
								<fieldset disabled="disabled">

									<!-- 							<legend>Emission Total</legend> -->

									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramType" class="col-lg-5 control-label">บริษัท
													(Company):</label>
												<div class="col-lg-6">
													<select class="form-control" name="companyForm"
														disabled="disabled" id="companyForm">
														<option value="TPAC">TPAC</option>
														<option value="TPCC">TPCC</option>
													</select>
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">แผนก/ผ่าย
													(Department):</label>
												<div class="col-lg-6">
													<input type='text' class="form-control" id="departmentForm"
														name="departmentForm" readonly="readonly" /> </span>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">ชื่อผู้ร้องขอ
													(Requester's Name): </label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														id="requestedNameForm" name="requestedNameForm"
														readonly="readonly" />
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">ชื่อตัวแทน
													(Agent Name): </label>
												<div class="col-lg-6">
													<input type='text' class="form-control" id="agentNameForm"
														name="agentNameForm" />
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">เบอร์โทรศัพท์
													(Telephone): </label>
												<div class="col-lg-6">
													<input type='text' class="form-control" id="telephoneForm"
														name="telephoneForm" readonly="readonly" />
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<!-- 										<div class="form-group"> -->
											<!-- 											<label for="paramCode" class="col-lg-4 control-label">แผนก/ผ่าย:</label> -->
											<!-- 											<div class="col-lg-6"> -->
											<!-- 													<input type='text' class="form-control"  />  -->
											<!-- 													</span> -->
											<!-- 												</div> -->
											<!-- 										</div> -->
										</div>
									</div>
									<div class="row"
										style="padding-left: 65px; padding-right: 65px;">
										<div class="col-lg-12">
											<div class="form-group">
												<legend>วัตถุประสงค์ (Objective)</legend>
												<label class="control-label radio-inline"> <input
													onclick="conditionNotOther();" type="radio"
													name="ObjectOptions" id="ObjectOptions1" checked
													value="OJ1"> อัดบรรจุ (Packing)
												</label> <label class=" control-label radio-inline"> <input
													onclick="conditionNotOther();" type="radio"
													name="ObjectOptions" id="ObjectOptions2" value="OJ2">
													สอบเทียบ (Calibration)
												</label> <label class=" control-label radio-inline"> <input
													onclick="conditionNotOther();" type="radio"
													name="ObjectOptions" id="ObjectOptions3" value="OJ3">
													ซ่อม (Repair)
												</label> <label class=" control-label radio-inline"> <input
													onclick="conditionNotOther();" type="radio"
													name="ObjectOptions" id="ObjectOptions4" value="OJ4">
													ตรวจเช็ค (Check)
												</label> <label class=" control-label radio-inline"> <input
													onclick="conditionOther();" type="radio"
													name="ObjectOptions" id="ObjectOptions5" value="OJ5">
													อื่นๆ (Other)
												</label> <label class=" control-label radio-inline"> <input
													type="text" class="form-control" name="OtherForm"
													id="OtherForm" placeholder="โปรดระบุ" disabled="disabled">

												</label>





											</div>
										</div>
									</div>



									<div class="row"
										style="padding-left: 65px; padding-right: 65px;">
										<div class="row"
											style="padding-left: 65px; padding-right: 65px;">
											<div class="col-lg-12">
												<div class="form-group">
													<div class="row">
														<label for="paramCode" class="col-lg-3">เลือกอุปกรณ์
															(Choose device) </label>
														<div class="col-lg-6">
															<select class="form-control" id="ItemForm"
																name="ItemForm" onchange="changeItemForm(this.value)">
																<option value="" selected="selected">Please
																	select ...</option>
																<option value="100000">100000</option>
																<option value="200000">200000</option>
															</select>
														</div>
													</div>
													<table class="table table-striped table-bordered">
														<thead>
															<tr>
																<th>หมายเลขอุปกณ์ (Device number)</th>
																<th class="text-center">ซีรีนันเบอร์ (Serial
																	number)</th>
																<th class="text-center">ประเภท (Type)</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td><label id="equipmentNo" name="equipmentNo">-</label>
																</td>
																<td class="text-center"><label
																	id="equipmentSeriesNo" name="equipmentSeriesNo">-</label>
																</td>
																<td class="text-center"><label id="equipmentType"
																	name="equipmentType">-</label></td>
															</tr>
														</tbody>
													</table>



												</div>
											</div>
								</fieldset>

								<fieldset>

									<div class="row">
										<div class="col-lg-12 ">
																				
											<div class="row">
												<div class="col-lg-12 text-center">
													<div class="form-group">
														<label for="paramCode" class="col-lg-4 control-label">อนุมัติ / ยกเลิก (Approve / Cancel):
														</label>
														<div class="col-lg-6">
															<select class="form-control" id="statsApprove" name="statsApprove"> 
<!-- 																<option value="" selected="selected">Please -->
<!-- 																		select ...</option> -->
																<option value="Approve" selected="selected">อนุมัติ (Approve)</option>
																<option value="Cancel">ยกเลิก (Cancel)</option>
															</select>
														</div>
													</div>
												</div>

												<div class="col-lg-12 text-center">
													<div class="form-group">
														<label for="paramCode" class="col-lg-4 control-label">หมายเหตุ (Remark):</label>
														<div class="col-lg-6">
															<textarea class="form-control"  id="remarkForm" name="remarkForm" rows="5"></textarea> </span>
														</div>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-lg-6">
													<div class="form-group">
														<label for="paramCode" class="col-lg-7 control-label">ผู้อนุมัติ/ยกเลิก(Approved / Canceled):
														</label>
														<div class="col-lg-5">
															<input type='text' class="form-control" id="approveBy" name="approveBy" readonly="readonly"/>
														</div>
													</div>
												</div> 

												<div class="col-lg-6">
													<div class="form-group">
														<label for="paramCode" class="col-lg-6 control-label">วันที่อนุมัติ/ยกเลิก (Approved Date):</label>
														<div class="col-lg-4">
															<input type='text' class="form-control"  id="approveDate" name="approveDate"  readonly="readonly"/> </span>
														</div>
													</div>
												</div>
											</div>
											
											<div class="row" style="margin-top: 44px;">
												<div class="col-lg-6 text-left">
													<button type="reset"
														onclick="window.location.href='gas_requested_list.htm'"
														class="btn btn-default" style="width: 100px;">&nbsp;กลับ</button>
												</div>
												<div class="col-lg-6 text-right">
<!-- 													<button type="reset" class="btn btn-danger" -->
<!-- 														style="width: 100px;">ยกเลิก</button> -->
													&nbsp;&nbsp;
													<button type="button" class="btn btn-success"
														style="width: 100px;" onclick="saveOrUpdate()">ยืนยัน</button>

												</div>
											</div>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						<!-- 										<div class="row"> -->
						<!-- 											<div class="col-lg-12 text-center"> -->
						<!-- 												<button type="reset"  class="btn btn-default" onclick="window.location.href='gas_requested_list.htm'" >กลับ</button> -->

						<!-- 												&nbsp;&nbsp;<button  style="width: 100px;" type="button" class="btn btn-danger">ยกเลิก</button> -->
						<!-- 												&nbsp;&nbsp;<button style=" width: 100px; " type="button" class="btn btn-success" onclick="saveOrUpdate()">ส่ง</button> -->

						<!-- 											</div> -->
						<!-- 										</div> -->

					</div>
				</div>
			</div>
	</div>

	</section>
	</div>



	<script type="text/javascript">
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
			"departmentCode" : "",
			"eqCode" : "",
			"serialNo" : "",
			"equipmentType" : "",
			"status" : ""
		};

		$(function() {
			getDataUser();
		});
		function getDataUser() {

			$("#companyForm").val('TPCC');

			$("#departmentForm").val('พนักงาน');

			$("#requestedNameForm").val('Wongwithit Rubchaleam');

			$("#telephoneForm").val('098354522');
			
			$("#ItemForm").val('100000');
			
			changeItemForm($("#ItemForm").val());
			
			$('#ObjectOptions' + '2').prop('checked',true);

			$("#approveBy").val('AmuletKQ Rcl');
			
			$("#approveDate").val('06/09/2018');
			 
			
			
		};

		function changeItemForm(value) {

			$("#equipmentNo").text(value);
			$("#equipmentSeriesNo").text('456');
			$("#equipmentType").text('789');

		};

		function conditionOther() {

			$("#OtherForm").prop("disabled", false);

		};
		function conditionNotOther() {

			$("#OtherForm").val('');
			$("#OtherForm").prop("disabled", true);

		};

		function getselectItem() {

		};

		function saveOrUpdate() {

			var ObjectOptions = $('input[name=ObjectOptions]:checked',
					'#myForm').val();

			// 			alert(ObjectOptions);
			if (ObjectOptions == "") {
				alert("กรุณาเลือกวัตถุประสงค์");
				return false;
			}

			var ItemForm = $('#ItemForm').val();
			if (ItemForm == "") {
				alert("กรุณาเลือกอุปกรณ์");
				return false;
			}

			jsonObj.equipmentId = $('#ItemForm').val();
			// 			jsonObj.companyCode 	= $('#companyForm').val();
			jsonObj.companyName = $('#companyForm').val();
			// 			jsonObj.departmentCode 	= $('#ItemForm').val();

			jsonObj.departmentName = $('#departmentForm').val();
			// 			jsonObj.requesterCode 	= $('#ItemForm').val();
			jsonObj.requesterName = $('#requestedNameForm').val();
			jsonObj.agentName = $('#agentNameForm').val();
			jsonObj.objectiveCode = ObjectOptions;

			jsonObj.eqCode = $("#equipmentNo").text();
			jsonObj.serialNo = $("#equipmentSeriesNo").text();
			jsonObj.equipmentType = $("#equipmentType").text();

			bootbox.confirm({
				title : "Confirm",
				message : _confirmSaveTxt,
				buttons : {
					cancel : {
						label : '<i class="fa fa-times"></i> Cancel',
						className : 'btn-danger'
					},
					confirm : {
						label : '<i class="fa fa-check"></i> Confirm',
						className : 'btn-success'
					}
				},
				callback : function(result) {
					if (result) {
						$.ajax({
							method : "POST",
							data : jsonObj,
							url : cPath + "/GasRequest/save"

						}).done(function(result) {
							$.notify({
								title : "<strong>Success!</strong> ",
								message : " Save successfully"
							});

						}).fail(function(jqXHR, textStatus, errorThrown) {
							alert('ERROR');

						});
					}
				}
			});
			// 			alert(ItemForm);
		};
	</script>