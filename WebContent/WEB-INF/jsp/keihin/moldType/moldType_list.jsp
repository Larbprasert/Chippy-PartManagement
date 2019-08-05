<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
	<div class="content-wrapper">
		<section class="content-header">
			<h1 class="page-header">Model / Type List</h1>
		</section> 
		
		<section class="content">
		 
			<!-- 	##### <<<<<  SEARCH ####------------------- -->
			<div class="box box-primary"  id="rs_table">
				<div class="box-header with-border">
					<h3 class="box-title"></h3>
					<div class="box-tools pull-right">
						<button type="button"
							class="btn btn-box-tool btn-success btn-table" onclick="doAdd()">
							<i class="fa fa-plus"></i>  Register New Model / Type
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
		                                    <th>Model / Type ID</th>
		                                    <th>Model / Type Name</th>
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
			            url: cPath+"/moldType/search.json"
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
							"data" : "moldType_ID",
							"fnCreatedCell" : function(nTd, sData,
									oData, iRow, iCol) {
								var txt = iRow;
								$(nTd).html(txt + 1);
							}
						},
						{ "data": "moldType_ID" 
							,"render" : function(val, vc , obj) {
								return '<a href="${cPath}/moldType/moldType_view.htm?moldType_ID='+ obj.moldType_ID +'" >'+obj.moldType_ID+'</a>';
							}
						}, 
						{ "data": "moldType_name" }, 						 
						{ "data": "activeFlag_name" }   
						
				    ],
				      "aoColumnDefs": [
				      { "sClass": "text-center", "aTargets": [0,1,3] },
				    ],
				    rowCallback: function (row, data) {}, 
				    ordering: false, 
			   	   	destroy: true 
				 });
				 
				
				function doAdd() {
					location = cPath + "/moldType/moldType_create.htm" ;
			}
				
				
				$(document).ready(function() {
					doSearch();
				});
				
				
</script>