<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

	<div class="content-wrapper">
		<section class="content-header">
			<h3>
				<i class="fa fa-list"></i> Repair and Rebuild Request Sheet
			</h3>

		</section>
		<section class="content">
			<div class="row">
				<div class="col-lg-12">
					<!-- 	#####  SEARCH >>>>> ####------------------- -->

					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Criteria</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<form class="form-horizontal" id="myForm" commandname="sysParam"
								method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="paramType" class="col-lg-4 control-label">Department</label>
											<div class="col-lg-6">
												<select class="form-control"  id="departmentSearch" name="departmentSearch">  
													 <option value="">${_ALL}</option> 
													 <c:forEach var="item" items="${LOV_DEPT}">
												     	<option value="${item.code}">${item.descTH}</option>
												    </c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="paramStatus" class="col-lg-4 control-label">Request Status</label>
											<div class="col-lg-6">
												<select class="form-control" name="statusSearch"  id="statusSearch">
													 <option value="">${_ALL}</option> 
													 <c:forEach var="item" items="${LOV_REQUEST_STATUS}">
												     	<option value="${item.code}">${item.descTH}</option>
												    </c:forEach>
												</select>

											</div>
										</div>


									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramCode" class="col-lg-4 control-label">Equipment Code</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="equipmentCodeSearch" id="equipmentCodeSearch"> 
												
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramDesc" class="col-lg-4 control-label">Equipment
												Type</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="equipmentTypeSearch" id="equipmentTypeSearch">
												
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group ">
											<div class="col-lg-12 text-center">
												<button type="reset" class="btn btn-default"
													onclick="doClear()">
													&nbsp;<i class="fa fa-refresh"></i> Clear
												</button>
												&nbsp;&nbsp;
												<button type="button" id="searchBtn" class="btn btn-primary"
													onclick="doSearch()">
													<i class="fa fa-search"></i> Search
												</button>
												&nbsp;&nbsp;
												<!-- 								<button type="button" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
											</div>
										</div>
									</div>
								</div>

							</form>
						</div>
						<!--             </fieldset> -->

					</div>
				</div>
			</div>

			<div class="box box-primary" id="rs_table">
				<div class="box-header with-border">
					<h3 class="box-title">Result</h3>
					<div class="box-tools pull-right">
						<button type="button"
							class="btn btn-box-tool btn-success btn-table"
							onclick="window.location.href='gas_requested_new.htm'" >
							<i class="fa fa-check-square-o"></i> New Request
						</button>
						
					</div>
				</div>

				<div class="box-body">


					<table id="myTable"
						class="table table-striped table-bordered"
						style="width: 100%">
						<thead class="bg-green color-palette">
							<tr>
								<th  class="text-center">No.</th>
								<th  class="text-center">Department</th>
								<th  class="text-center">Job No.</th>
								<th  class="text-center">Eq. Code</th>
<!-- 								<th class="text-center">Equipment Type</th> -->
<!-- 								<th class="text-center">Serial No.</th> -->
<!-- 								<th class="text-center">Brand</th> -->
<!-- 								 <th  class="text-center">Model</th> -->
								<th  class="text-center">Purpose</th>
								<th  class="text-center">Request Status</th>
								<th class="text-center">Create Date</th>
<!-- 								<th class="text-center" width="8%">Eq. Detail</th> -->
								<th  class="text-center" width="8%">Action</th>
							</tr>
						</thead>
						
					</table>



				</div>

			</div>


		</section>

	</div>
	
	
				<!-- 	<hr> -->

			<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
			<script>
			
			$(document).ready(function() {

				// 	 	$('#editModal').modal('toggle');

			});
			
				function doAdd() {

					$('#editModal').modal('show');
				}

				function doSearch() {
					$("#rs_table").show();
// 					console.log(
// 							 cPath + "/GasRequestList/search?department="+ $('#departmentSearch').val()
// 								+ "&status=" + $('#statusSearch').val()
// 								+ "&equipmentCode=" + $('#equipmentCodeSearch').val()
// 								+ "&equipmentType=" + $('#equipmentTypeSearch').val());
					dataTable.ajax.url(
							 cPath + "/GasRequestList/search?department="+ $('#departmentSearch').val()
								+ "&status=" + $('#statusSearch').val()
								+ "&equipmentCode=" + $('#equipmentCodeSearch').val()
								+ "&equipmentType=" + $('#equipmentTypeSearch').val()).load();
					
//		 			dataTable.ajax.reload();
					
			
					
				}

				function doClear(id) {
// 					$("#rs_table").hide();
				}
				
				function viewDetail(id) {
						location = cPath + "/GasRequest/gas_requested_detail/"+id ;
				}
				
				function editDetail(id) {
						location = cPath + "/GasRequest/gas_requested_modify/"+id ;
				}
				
				function popupDescription(id) {
					
					$('#detailModal').modal('show');
					
					/**call method in modal*/
					EQ_DETAIL.loadDetails(id);
				}
				
				var jsonObj = {
						"id" : "",
						"department" : "",
						"jobNo" : "",
						"equipmentCode" : "",
						"equipmentType" : "",
						"lastCalDate" : "",
						"nextCalDate" : "",
						"scheduleStatus" : ""
				};
				

				var jsonObjRes = [{
					"id" : "1",
					"equipmentId" : "",
					"jopNo" : "",
					"approveId" : "",
					"receiveId" : "",
					"EquipmentType" : "",
					"requestStatus" : "",
					"companyCode" : "",
					"companyName" : "",
					"departmentCode" : "",		
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
					"status":""				
				}];
			
				var dataTable = $('#myTable').DataTable({
					
// 							ajax : cPath + "/GasRequestList/search?department="+ $('#departmentSearch').val()
// 									+ "&status=" + $('#statusSearch').val()
// 									+ "&equipmentCode=" + $('#equipmentCodeSearch').val()
// 									+ "&equipmentType=" + $('#equipmentTypeSearch').val(), 
							data:[],
							columns : [
								{
									"data" : "reqId",
									"fnCreatedCell" : function(nTd, sData,
											oData, iRow, iCol) {
										var txt = iRow;
										$(nTd).html(txt + 1);
									}
								},
								{ "data": "deptName" }, 
								{ "data": "jobNo" 
								}, 
								{ "data": "eqCode" 
									,"render" : function(val, vc , obj) {
										return '<a href="javascript:void(0)" onclick="popupDescription('+ obj.eqId +')" >'+obj.eqCode+'</a>';
									}
								}, 
// 								{ "data": "eqTypeName" },     
// 								{ "data": "serialNo" },     
// 								{ "data": "brand" },  
// 								{ "data": "model" },    
								{
									"data" : "purposeDesc"
									/* "render" : function(val, _, obj) {
										var htm = 'Complete';
										if(val=='1'){
											htm = 'อัดบรรจุ (Packing)';
										}else if(val=='2'){
											htm = 'สอบเทียบ (Calibration)';
										}
										else if(val=='3'){
											htm = 'ซ่อม (Repair)';
										}
										else if(val=='4'){
											htm = 'ตรวจเช็ค (Check)';
										}
										else if(val=='5'){
											htm = 'อื่นๆ (Other)';
										}
									
									return htm;
									} */
								},
								{
									"data" : "requestStatusDesc"
								},
								{ "data": "createDateStr" },  
// 								{ 
// 						     		"data": "eqId"
// 							        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 							        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" '
// 							        	 	+' onclick="popupDescription('+ oData.eqId +')"> <i class="fa fa-list"></i> Detail </button>';
// 							            $(nTd).html(txt);
// 							        } 
// 					            },
								{
									"data" : "reqId"
									,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 							        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" '
// 							        	 	+' onclick="popupDescription('+ oData.eqId +')"> <i class="fa fa-list"></i> Detail </button>';
							            $(nTd).html(getActionColumn(oData));
							        } 
// 									"render" : function(val, _, obj) {
// 										return getActionBtn();
// 									}
								}],
							    "aoColumnDefs": [
							      	{ "sClass": "text-center", "aTargets": [0,1,2,3,4,5,6,7] },
							    ],
								rowCallback: function (row, data) {}, 
							    ordering: false, 
								destroy: true 
						});
				
				
				function getActionColumn(oData) {
					console.log(oData);
					var htm = "";
					
					if("CR"==oData['requestStatusCode']){
						if($roleApprove){
							htm = '<button type="button" onclick="editDetail('+ oData.reqId  +')" class="btn btn-box-tool btn-danger btn-table"><i class="fa fa-file-text"></i> Approve Request </button> ';
						}else{
							htm = '<button type="button" onclick="viewDetail('+ oData.reqId  +')" class="btn btn-box-tool btn-info btn-table"><i class="fa fa-file-text"></i> View Request </button> ';
						}
					}else if("AP"==oData['requestStatusCode']){
						
						htm = '<button type="button" onclick="viewDetail('+ oData.reqId  +')" class="btn btn-box-tool btn-info btn-table"><i class="fa fa-file-text"></i> Approve Request </button> ';
					}else if("AP"==oData['requestStatusCode']){
						htm = viewBtn;
					}
						
					return htm;

				};

				
				
				$.fn.dataTable.ext.errMode = 'none';
		
						
				
				var _status = '${param["status"]}';
		// 		var _id = '${param["id"]}';
				
				if(_status=="S"){
		// 		    if(_id!=''){
		// 		    	doSearch();
		// 		    }
				    $.notify({
							title: "<strong>Success!</strong> ",
							message: " Save successfully"
						});
				    
				}
		
		
		
		

	</script>	
	
<%@ include file="gas_registered_detail.jsp"%>
