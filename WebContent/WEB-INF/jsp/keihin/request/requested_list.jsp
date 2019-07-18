<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
	<div class="content-wrapper">
		<section class="content-header">
			<h1 class="page-header">Request List</h1>
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
							<form class="form-horizontal" id="myForm"  method="post">
								

								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramCode" class="col-lg-4 control-label">Request No.</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" name="request_ID" id=""> 
												
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramDesc" class="col-lg-4 control-label">Request Type
												 </label>
											<div class="col-lg-6">
												<select class="form-control" name="requestTypeSearch"  id="">
													 <option value="">${_ALL}</option> 
													 <c:forEach var="item" items="${LOV_REQUESTTYPE}">
												     	<option value="${item.code}">${item.descTH}</option>
												    </c:forEach>
												</select>
												
											</div>
										</div>
									</div>
								</div>		
								
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="paramType" class="col-lg-4 control-label">Section</label>
											<div class="col-lg-6">
												<select class="form-control"  id="sectionSearch" name="sectionSearch">  
													 <option value="">${_ALL}</option> 
													 <c:forEach var="item" items="${LOV_SECTION}">
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
												<select class="form-control" name="requestStatus"  id="statusSearch">
													 <option value="">${_ALL}</option> 
													 <c:forEach var="item" items="${LOV_APPSTATUS}">
												     	<option value="${item.code}">${item.descTH}</option>
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
		 
			<!-- 	##### <<<<<  SEARCH ####------------------- -->
			<div class="box box-primary"  id="rs_table">
				<div class="box-header with-border">
					<h3 class="box-title"></h3>
					<div class="box-tools pull-right">
						<button type="button"
							class="btn btn-box-tool btn-success btn-table" onclick="doAdd()">
							<i class="fa fa-plus"></i>  Create New Request
						</button>
					</div>
				</div>

				<div class="box-body">
					<table id="result-table"
						class="table table-striped table-bordered"
						style="width: 100%">
						<thead class="bg-green color-palette">
		                                <tr >
		                                    <th>#</th>		                                    
		                                    <th>Request No.</th>
		                                    <th>Request Type</th>
		                                    <th>Request By</th>
		                                    <th>Request Date</th>
 		                                    <th>Request Status</th>	
 		                                    <th width="8%">Action</th>	                                    
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
				
				
				function popupHistory(id) {
					$('#historyModal').modal('show');
					
					/**call method in modal*/
					EQ_HIST.loadHistoryList(id);
					
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
			            url: cPath+"/request/search.json",
			            data: $('#myForm').serialize()
			        }).done(function (result) {
			            rsTable.clear().draw();
			            if(result.recordsTotal>0){
// 			            	T_DATA = result.data;
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
						{
							"data" : "request_ID",
							"fnCreatedCell" : function(nTd, sData,
									oData, iRow, iCol) {
								var txt = iRow;
								$(nTd).html(txt + 1);
							}
						},
						{ 
							"data": "request_ID" 
// 							,"render" : function(val, vc , obj) {
// 								return '<a href="${cPath}/request/requested_detail/'+ obj.request_ID +'" >'+obj.request_ID+'</a>';
// 							}
						}, 
						{ "data": "requestType.requestType_name" }, 						 
						{ "data": "requestBy" },
						{ "data": "createDateStr" },
						{ "data": "status_name" },
						{
							"data" : "request_ID"
							,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
					            $(nTd).html(getActionColumn(oData));
					        } 
						}
						
				    ],
				      "aoColumnDefs": [
				      { "sClass": "text-center", "aTargets": [0,1,2,3,4,5,6] },
				    ],
				    rowCallback: function (row, data) {}, 
				    ordering: false, 
			   	   	destroy: true 
				 });
				 
				function getActionColumn(oData) {
// 					console.log(oData);
					var htm = "";
					if("7"==oData['requestStatus'] || "99"== oData['requestStatus']){
						 var st = ("99"== oData['requestStatus']) ? "btn-danger":"btn-success";
						 htm = '<button type="button" onclick="editDetail(\''+ oData.request_ID  +'\')" class="btn btn-box-tool '+st+' btn-table"><i class="fa fa-file-text-o"></i>&nbsp; View Request </button> ';
					}else{
						 htm = '<button type="button" onclick="editDetail(\''+ oData.request_ID  +'\')" class="btn btn-box-tool btn-info btn-table"><i class="fa fa-check-square-o"></i> Approve Request </button> ';
					}
					return htm;

				};

				
				
				$.fn.dataTable.ext.errMode = 'none';
				
				function viewDetail(id) {
					location = cPath + "/request/requested_detail/"+id ;
				}
				
				function editDetail(id) {
					location = cPath + "/request/requested_edit/"+id ;
				}
				
				function doAdd() {
					location = cPath + "/request/requested_new.htm" ;
				}
				
				
				$(document).ready(function() {
					doSearch();
				});
				
				
</script>