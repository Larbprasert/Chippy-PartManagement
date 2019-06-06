<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
	<div class="content-wrapper">
		<section class="content-header">
			<h1 class="page-header">Part List</h1>
		</section> 
		
		<section class="content">
		 
			<!-- 	##### <<<<<  SEARCH ####------------------- -->
			<div class="box box-primary"  id="rs_table">
				<div class="box-header with-border">
					<h3 class="box-title"></h3>
					<div class="box-tools pull-right">
						<button type="button"
							class="btn btn-box-tool btn-success btn-table" onclick="doAdd()">
							<i class="fa fa-plus"></i>  Register New Part
						</button>
					</div>
				</div>

				<div class="box-body">
					<table id="result-table"
						class="table table-striped table-bordered"
						style="width: 100%">
						<thead class="bg-green color-palette">
		                                <tr>
		                                    <th>#</th>
		                                    <th>Part ID</th>
		                                    <th>Part Name</th>
		                                    <th>Maker/Brand</th>
		                                    <th>Mold/Type</th>
		                                    <th>Qty</th>
		                                    <th>Status</th>
		                                </tr>
						</thead>						 
					</table>
				</div>
			</div>
		</section>
	</div>	


<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
<script>

$(document).ready(function() {
	doSearch();
});
			
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
			            url: cPath+"/partMaster/search.json"
// 			            data: $('#myForm').serialize()
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
							"data" : "part_ID",
							"fnCreatedCell" : function(nTd, sData,
									oData, iRow, iCol) {
								var txt = iRow;
								$(nTd).html(txt + 1);
							}
						},
						{ "data": "part_ID" 
							,"render" : function(val, vc , obj) {
								return '<a href="${cPath}/partMaster/partMaster_view.htm?part_ID='+ obj.part_ID +'" >'+obj.part_ID+'</a>';
							}
						}, 
						{ "data": "part_name" },
						{ "data": "maker.maker_name" },
						{ "data": "moldType.moldType_name" },
						{ "data": "qty" },
						{ "data": "activeFlag_name" }   
						
				    ],
				      "aoColumnDefs": [
				      { "sClass": "text-center", "aTargets": [0,1,5] },
				    ],
				    rowCallback: function (row, data) {}, 
				    ordering: false, 
			   	   	destroy: true 
				 });
				 
				
// 				function doAdd() {
// 					location = cPath + "/partMaster/partMaster_create.htm" ;
// 				}
				function doAdd() {
					location = cPath + "/productionLine/productionLine_create.htm" ;
				}
</script>