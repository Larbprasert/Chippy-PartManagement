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
				<i class="fa fa-fire"></i> Fire Fighting Equipment Detector Registered Lists
			</h3>
		</section>
		<section class="content">
			<div class="row">
				<div class="col-lg-12">
					<!-- 	#####  SEARCH >>>>> ####------------------- -->
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Search Criteria</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<div class="box-body">

							<form class="form-horizontal" id="myForm" commandname="bean"
								method="post">

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="paramType" class="col-lg-4 control-label">Department</label>
											<div class="col-lg-6">
												<select class="form-control" name="deptCode">
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
										<label for="paramCode" class="col-lg-4 control-label">Equipment	Code</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="eqCode">
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramDesc" class="col-lg-4 control-label">Equipment
												Type</label>
											<div class="col-lg-6">
												    <select class="form-control" name="eqTypeCode">
													<option value="">${_ALL}</option> 
													 <c:forEach var="item" items="${LOV_EQUIPMENT_TYPE}">
												     	<option value="${item.code}">${item.descTH}</option>
												    </c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramDesc" class="col-lg-4 control-label">Serial
												No.</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="serialNo">
											</div>
										</div>
										
									</div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramCode" class="col-lg-4 control-label">Status</label>
											<div class="col-lg-6">
												<select class="form-control" name="activeFlg">
								                       	<option value="">${_ALL}</option>
								                       	<c:forEach var="item" items="${LOV_ACTIVE_TYPE}"> 
													        <option value="${item.code}" ${item.descTH == sysParam.active ? 'selected="selected"' : ''}>${item.descTH}</option>
													    </c:forEach>
								                      </select>											
								                 </div>
										</div>
									</div>
									<div class="col-lg-6"></div>
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
												<button type="button" class="btn btn-success" onclick="doAdd()">
													<i class="fa fa-plus"></i> Add
												</button>
<!-- 																				<button type="button" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 	##### <<<<<  SEARCH ####------------------- -->
			<div class="box box-primary" style="display: none;" id="rs_table">
				<div class="box-header with-border">
					<h3 class="box-title">Result</h3>
<!-- 					<div class="box-tools pull-right"> -->
<!-- 						<button type="button" -->
<!-- 							class="btn btn-box-tool btn-success btn-table" onclick="doAdd()"> -->
<!-- 							<i class="fa fa-plus"></i> Add -->
<!-- 						</button> -->
<!-- 					</div> -->
				</div>

				<div class="box-body">


					<table id="result-table"
						class="table table-striped table-bordered"
						style="width: 100%">
						<thead class="bg-green color-palette">
							<tr>

								<th class="text-center">Department</th>
								<th class="text-center">Equipment Code</th>
								<th class="text-center">Equipment Type</th>
								<th class="text-center">Serial No.</th>
								<th class="text-center">Brand</th>
								 <th align="center">Model</th>
								<th class="text-center">Cal. Time Std.</th>
								<th class="text-center">Last Cal. Date</th>
								<th class="text-center">Detail</th>
								<th class="text-center">Edit</th>
							</tr>
						</thead>
						<tbody>
							<!-- <tr>

								<td align="center">SHE</td>
								<td align="left">3SE-507</td>
								<td align="left">-</td>
								<td align="left">0301311-047</td>
								<td align="left">Industrial Scientific</td>
																<td align="left">Multigas Detector, ITX</td>
								<td align="right">10/06/2018</td>
								<td align="left">Linde</td>
								<td align="left">1 Months</td>
								<td align="center">
									<button type="button" onclick="popupDescription()"
										class="btn btn-box-tool btn-info btn-table">
										<i class="fa fa-edit fa-lg"></i>Description
									</button>

								</td>
								<td align="center">
									<button type="button" onclick="popupEdit()"
										class="btn btn-box-tool  btn-warning btn-table">
										<i class="fa fa-edit fa-lg"></i>Edit
									</button>
								</td>

							</tr> -->
							 

						</tbody>
					</table>



				</div>

			</div>

			<!-- 	<hr> -->





			<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
			<script>
				function doAdd() {
					// 		location = "user_add_edit.php";
					$('#saveform').validator('destroy');
					$('#editModal').modal('show');
// 					$('input,textarea').val('');
					$('#saveform').find("input,textarea").val("");
					//  		$('option').attr('selected', false);
				}
				function popupDescription() {
					$('#DescModal').modal('show');
					$('input').val('');
				}
				function popupEdit() {
					$('#saveform').validator('destroy');
					$('#editModal').modal('show');
					$('input').val('');
				}

				
				var T_DATA = {};
				function doSearch(){
					$.ajax({
			            url: cPath+"/ffeRegistered/getDataTable.json",
			            data: $('#myForm').serialize()
			        }).done(function (result) {
			            rsTable.clear().draw();
			            if(result.recordsTotal>0){
			            	T_DATA = result.data;
				            rsTable.rows.add(result.data).draw();
			            }else{
//			             	bootbox.alert({
//			 				    message: "No Data Found!",
//			 				    size: 'small'
//			 				});
			            }
			           }).fail(function (jqXHR, textStatus, errorThrown) { 
			                 // needs to implement if it fails
			           });
					
					$("#rs_table").show();
					
			 	};

				function doClear() {
					$("#rs_table").hide();
				}

// 				$('#result-table').DataTable({
// 					ordering : false
// 				});
				

				var rsTable = $('#result-table').DataTable({
					autoWidth: false,
					data:[],
				    columns: [
						{ "data": "deptName" }, 
						{ "data": "eqCode" }, 
						{ "data": "eqTypeName" },     
						{ "data": "serialNo" },     
						{ "data": "brand" },  
						{ "data": "model" },    
						{ "data": "calTimeStd" },    
						{ "data": "lastCalDate" },    
// 						{ "data": "servicedByName" },    
						{ 
				     		"data": "id"
					        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
					        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" '
					        	 	+' onclick="popupDescription('+ iRow+')"> <i class="fa fa-list"></i> Detail </button>';
					            $(nTd).html(txt);
					        } 
			            },
						{ 
				     		"data": "id"
					        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
					        	 var txt = '<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" '
					        		 + 'onclick="popupEdit('+ iRow+')"> <i class="fa fa-edit"></i> Edit </button>';
					            $(nTd).html(txt);
					        } 
			            }
				    ],
				      "aoColumnDefs": [
				      { "sClass": "text-center", "aTargets": [0,1,2,3,4,5,6,7,8,9] },
// 				      { "sClass": "text-right", "aTargets": [1,2,3,4,5,6,7,8,9,10,11] }
				    ],
				    rowCallback: function (row, data) {}, 
				    ordering: false, 
			   	   	destroy: true 
				 });
				

// 				$(document).ready(function() {

// 				});
				
				
				var _status = '${param["status"]}';
				var _id = '${param["id"]}';
				
				if(_status=="S"){
				    if(_id!=''){
				    	doSearch();
				    }
				    $.notify({
							title: "<strong>Success!</strong> ",
							message: " Save successfully"
						});
				    
				}
				
				
			</script>


		</section>

	</div>


<%@ include file="ffe_registered_edit.jsp"%>
	