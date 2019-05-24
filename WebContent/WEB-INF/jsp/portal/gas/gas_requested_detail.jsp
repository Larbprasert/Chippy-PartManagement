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
<%-- 				<i class="fa fa-file-text"></i>&nbsp;${roleApprove? 'Approve / Cancel':'View Request'}<small> --%>
				<i class="fa fa-file-text"></i>&nbsp;View Request<small>
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

								<fieldset class="fs-equipment" disabled>
<%-- 									${requestObj} --%>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramType" class="col-lg-5 control-label">บริษัท
													(Company)</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.companyName}" readonly />
													<%-- 													<input type='hidden'   id="companyForm" name="companyForm"  value="${_userProfile.companyCode}" />   --%>
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">รหัสรายการ
													(Job No.)</label>
												<div class="col-lg-6">
													<input type='text' class="form-control" id="jobNoForm"
														name="jobNoForm" readonly="readonly"
														value="${requestObj.jobNo}" />
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">ชื่อผู้ร้องขอ
													(Requester's Name) </label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.requesterName}" readonly="readonly" />
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">แผนก/ฝ่าย
													(Department)</label>
												<div class="col-lg-6">
													<input type='text' class="form-control" id="departmentForm"
														name="departmentForm" value="${requestObj.departmentName}"
														readonly="readonly" />
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">โทรศัพท์
													(Ext.) </label>
												<div class="col-lg-6">
													<input type='text' class="form-control" id="telephoneForm"
														name="telephoneForm" value="${requestObj.phone}" readonly="readonly" />
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">ชื่อตัวแทน
													(Agent Name) </label>
												<div class="col-lg-6">
													<input type='text' class="form-control" id="agentNameForm"
														name="agentNameForm" value="${requestObj.agentName}" readonly />
												</div>
											</div>
										</div>

									</div>


									<div class="row">
										<div class="col-lg-12">
											<legend class="lb-equipment">วัตถุประสงค์ (Purpose)</legend>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-2"></div>
										<div class="col-lg-10">
											<div class="form-group"  >
												<!-- 												<label class="control-label radio-inline"> <input -->
												<!-- 													onclick="conditionNotOther();" type="radio" -->
												<!-- 													name="ObjectOptions" id="ObjectOptions1" checked -->
												<!-- 													value="OJ1"> อัดบรรจุ (Packing) -->
												</label> <label class=" control-label radio-inline"> <input
													onclick="conditionNotOther();" type="radio" disabled
													name="ObjectOptions" value="CL"> สอบเทียบ 
													(Calibration)
												</label> <label class=" control-label radio-inline"> <input
													onclick="conditionNotOther();" type="radio" disabled
													name="ObjectOptions" value="RP"> ซ่อม (Repair)
												</label> <label class=" control-label radio-inline"> <input
													onclick="conditionNotOther();" type="radio" disabled
													name="ObjectOptions" value="CH"> ตรวจเช็ค (Check)
												</label> <label class=" control-label radio-inline"> <input
													onclick="conditionOther();" type="radio" disabled
													name="ObjectOptions" value="OT"> อื่นๆ (Other) 
												</label> <label class=" control-label radio-inline"> <input
													type="text" class="form-control" name="OtherForm" disabled
													id="OtherForm" disabled="disabled" value="${requestObj.objectiveName}">
												</label>


											</div>
										</div>
									</div>



									<div class="row"
										style="padding-left: 60px; padding-right: 60px;">
										<div class="col-lg-12">
											<div class="form-group">
												<table class="table table-striped table-bordered">
													<thead class="th-equipment">
														<tr>
															<th class="text-center">หมายเลขอุปกรณ์ (Equipment No.)</th>
															<th class="text-center">ซีรีนัมเบอร์ (Serial No.)</th>
															<th class="text-center">แบรนด์ (Brand)</th>
															<th class="text-center">โมเดล(Model)</th>
															<!-- 																<th class="text-center"  >ประเภท (Type)</th> -->
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="text-center">${requestObj.equipment.eqCode}</td>
															<td class="text-center">${requestObj.equipment.serialNo}</label></td>
															<td class="text-center">${requestObj.equipment.brand}</td>
															<td class="text-center">${requestObj.equipment.model}</td>
															<!-- 																<td class="text-center"  ><label id="equipmentType" name="equipmentType"></label></td> -->
														</tr>
													</tbody>
												</table>



											</div>
										</div>
										<!-- 									</div> -->
									</div>


									<div class="row">
										<div class="col-lg-12 ">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">อนุมัติ
													/ ยกเลิก (Approve / Cancel): </label>
												<div class="col-lg-5">${requestObj.approveType}
												
												
												<input type='text' class="form-control"
														value="${requestObj.approveType}"
														readonly="readonly" />
														
													<!-- <select class="form-control" id="statsApprove"
														name="statsApprove">
																														<option value="" selected="selected">Please
																																select ...</option>
														<option value="Approve" selected="selected">อนุมัติ
															(Approve)</option>
														<option value="Cancel">ยกเลิก (Cancel)</option>
													</select> -->
												</div>
											</div>
										</div>

										<div class="col-lg-12 text-center">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">หมายเหตุ
													(Remark)</label>
												<div class="col-lg-6">
													<textarea class="form-control" id="remarkForm"
														name="remarkForm" rows="5">${requestObj.remark}</textarea>
													</span>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-7 control-label">ผู้อนุมัติ/ยกเลิก(Approved
													/ Canceled): </label>
												<div class="col-lg-5">
													<input type='text' class="form-control"
														value="${requestObj.approve_by}"
														readonly="readonly" />
													<!-- 															<input type='text' class="form-control" id="approveBy" name="approveBy" readonly="readonly"/> -->
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-7 control-label">วันที่อนุมัติ/ยกเลิก
													(Approved Date)</label>
												<div class="col-lg-4">
													<input type='text' class="form-control" id="approveDate"
														name="approveDate" value="${requestObj.approve_date}"
														readonly="readonly" /> </span>
												</div>
											</div>
										</div>
									</div>


									<div class="row">
										<div class="col-lg-12">
											<legend class="lb-equipment"> สำหรับฝ่าย SHE (SHE
												Dept. Only) </legend>
										</div>
									</div>

									<div class="row">
										<!-- 											<div class="col-lg-12"> -->

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">วันที่
													<br>(Received Date)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.she_receive_date}"
														readonly="readonly" />
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">ผู้รับเรื่อง<br>(Received
													By)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.she_receive_by}"
														readonly="readonly" />
												</div>
											</div>
										</div>

									</div>
									<hr>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">หมายเลขใบนำของออก
													<br>(Material Gate Pass No.)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.she_send_no}"
														readonly="readonly" />
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">วันที่นำของออก
													<br>(Date)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.she_send_date}"
														readonly="readonly" />
												</div>
											</div>
										</div>
									</div>

									<div class="row">

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">บริษัทผู้นำของออก
													<br> (Vendor Company)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.she_send_vendor}"
														readonly="readonly" />
												</div>
											</div>
										</div>


										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">ชื่อผู้นำของออก
													<br> (Vendor Name)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.she_send_name}"
														readonly="readonly" />
												</div>
											</div>
										</div>
									</div>



									<div class="row">
										<div class="col-lg-12">
											<legend class="lb-equipment">การเซ็นต์รับคืน</legend>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">บริษัทผู้นำส่ง
													<br>(Vendor Company)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.vendor_sign_by}"
														readonly="readonly" />
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">วันที่ส่ง
													<br>(Date)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.vendor_sign_date}"
														readonly="readonly" />
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">ชื่อผู้รับ
													<br>(SHE)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.she_sign_by}"
														readonly="readonly" />
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">วันที่รับ
													<br>(Date)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.she_sign_date}"
														readonly="readonly" />
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="row">

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-5 control-label">ชื่อผู้รับ
													<br>(Requestor)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.complete_req_by}"
														readonly="readonly" />
												</div>
											</div>
										</div>

										<div class="col-lg-6">
											<div class="form-group">
												<label for="paramCode" class="col-lg-4 control-label">วันที่รับ
													<br>(Date)
												</label>
												<div class="col-lg-6">
													<input type='text' class="form-control"
														value="${requestObj.complete_req_date}"
														readonly="readonly" />
												</div>
											</div>
										</div>
									</div>




									<!-- 										</div> -->
									<!-- 									</div> -->

								</fieldset>


								<div class="row">

<!-- 									<div class="col-lg-6 text-left"> -->
<!-- 										<button type="reset" -->
<%-- 											onclick="window.location.href='${cPath}/gas/gas_requested_list.htm'" --%>
<!-- 											class="btn btn-default" style="width: 100px;">&nbsp;กลับ</button> -->
		<!-- 									</div> -->
										<div class="col-lg-6 text-left">
												<button type="reset"
													onclick="window.location.href='${cPath}/gas/gas_requested_list.htm'"
													class="btn btn-default" style=" width: 100px; "><i class="fa fa-arrow-circle-left"></i> &nbsp;กลับ/Back </button>
											</div>

								</div>

							</form>

						</div>

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

// 			$("#companyForm").val('TPCC');

// 			$("#departmentForm").val('พนักงาน');

// 			$("#requestedNameForm").val('Wongwithit Rubchaleam');

// 			$("#telephoneForm").val('098354522');

// 			$("#ItemForm").val('100000');

// 			changeItemForm($("#ItemForm").val());

// 			$('#ObjectOptions' + '2').prop('checked', true);
			$('input:radio[name="ObjectOptions"]').filter('[value="${requestObj.objectiveCode}"]').attr('checked', true);

// 			$("#approveBy").val('AmuletKQ Rcl');

// 			$("#approveDate").val('06/09/2018');

		};

		function changeItemForm(value) {

// 			$("#equipmentNo").text(value);
// 			$("#equipmentSeriesNo").text('456');
// 			$("#equipmentType").text('789');

		};

		function conditionOther() {

			$("#OtherForm").prop("disabled", false);

		};
		function conditionNotOther() {

			$("#OtherForm").val('');
			$("#OtherForm").prop("disabled", true);

		};

		function getAction() {

			return "";

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