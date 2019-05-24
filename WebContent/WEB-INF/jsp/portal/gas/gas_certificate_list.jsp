<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>


<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload.css">
<link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-ui.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->
<noscript><link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-noscript.css"></noscript>
<noscript><link rel="stylesheet" href="${cPath}/resources/jFileupload/css/jquery.fileupload-ui-noscript.css"></noscript>


<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
	
	
	
	<div class="content-wrapper">
		<section class="content-header">
			<h3>
				<i class="fa fa-certificate"></i> Gas Detector Certificate 
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
									<%-- <div class="col-lg-6">
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
									</div> --%>
									
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramDesc" class="col-lg-4 control-label">Serial
												No.</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="serialNo">
											</div>
										</div>
										
									</div>
									
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
									
								</div>
<%-- 
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
								</div> --%>
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
			<div class="box box-primary"  id="rs_table">
				<div class="box-header with-border">
					<h3 class="box-title">Result</h3>
					<div class="box-tools pull-right">
						<!-- 						<button type="button" -->
						<!-- 							class="btn btn-box-tool btn-success btn-table" onclick="doAdd()"> -->
						<!-- 							<i class="fa fa-plus"></i> Add -->
						<!-- 						</button> -->
					</div>
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
								 <th  class="text-center">Model</th>
								<th class="text-center">Service by</th>
								<th class="text-center">Service Email</th>
								<th class="text-center">Status</th>
								<th class="text-center" >Detail</th>
								<th class="text-center" >Certificate</th>
							</tr>
						</thead>
						 
					</table>



				</div>

			</div>


		</section>

	</div>
	


			<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
			<script>
				 
			
				function popupDescription(id) {
					
					$('#detailModal').modal('show');
					
					/**call method in modal*/
					EQ_DETAIL.loadDetails(id);
				}
				
				
				function popupCert(id) {
					$('#certModal').modal('show');
					
					/**call method in modal*/
					EQ_CERT.loadCertList(id);
					
// 					/**test upload*/
// 					EQ_CERT.uploadCert(id)
				}
				
				
				function doClear() {
// 					$("#rs_table").hide();
				}

// 				$('#result-table').DataTable({
// 					ordering : false
// 				});



				var T_DATA = {};
				function doSearch(){
					$.ajax({
			            url: cPath+"/gasRegistered/getDataTable.json",
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
// 						{ "data": "calTimeStd" },    
// 						{ "data": "lastCalDate" },    
						{ "data": "servicedByName" },    
						{ "data": "servicedByEmail" },    
						{ "data": "status" },    
						{ 
				     		"data": "id"
					        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
					        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" '
					        	 	+' onclick="popupDescription('+ oData.id +')"> <i class="fa fa-list"></i> Detail </button>';
					            $(nTd).html(txt);
					        } 
			            },
						{ 
				     		"data": "id"
					        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
					        	 var txt = '<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" '
					        		 + 'onclick="popupCert('+ oData.id+')"> <i class="fa fa-certificate"></i> Certificate </button>';
					            $(nTd).html(txt);
					        } 
			            }
				    ],
				      "aoColumnDefs": [
				      { "sClass": "text-center", "aTargets": [0,1,2,3,8,9,10] },
				    ],
				    rowCallback: function (row, data) {}, 
				    ordering: false, 
			   	   	destroy: true 
				 });
				 
				
				
				$(document).ready(function() {

				});
				
				
			</script>
			
<%@ include file="gas_registered_detail.jsp"%>

<%@ include file="gas_certificate_view.jsp"%>
