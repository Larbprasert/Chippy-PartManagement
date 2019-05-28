<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
	<div class="content-wrapper">
		<section class="content-header">
			<h1 class="page-header">CheckTool List</h1>
		</section> 

		<section class="content">
		 
			<!-- 	##### <<<<<  SEARCH ####------------------- -->
			<div class="box box-primary"  id="rs_table">
				<div class="box-header with-border">
					<h3 class="box-title">Result</h3>
					<div class="box-tools pull-right">
												<button type="button"
													class="btn btn-box-tool btn-success btn-table" onclick="doAdd()">
													<i class="fa fa-plus"></i>  Register New CheckTool
												</button>
					</div>
				</div>

				<div class="box-body">


					<table id="result-table"
						class="table table-striped table-bordered"
						style="width: 100%">
						<thead class="bg-green color-palette">
 <tr>
		                                    <th class="text-center">#</th>
		                                    <th class="text-center">CheckTool ID</th>
		                                    <th class="text-center">CheckTool Name</th>
		                                    <th class="text-center">Timing</th>
		                                    <th class="text-center">Status</th>
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
			            url: cPath+"/checkTool/search.json"
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
							"data" : "checkTool_ID",
							"fnCreatedCell" : function(nTd, sData,
									oData, iRow, iCol) {
								var txt = iRow;
								$(nTd).html(txt + 1);
							}
						},
// 						{ "data": "checkTool_ID" }, 
						{ "data": "checkTool_ID" 
							,"render" : function(val, vc , obj) {
// 								return '<a href="javascript:void(0)" onclick="popupDescription('+ obj.checkTool_ID +')" >'+obj.checkTool_ID+'</a>';
								return '<a href="${cPath}/checkTool/checkTool_view.htm?checkTool_ID='+ obj.checkTool_ID +'" >'+obj.checkTool_ID+'</a>';
							}
						}, 
						{ "data": "checkTool_name" }, 
						{ "data": "timing_name" },     
						{ "data": "activeFlag_name" }   
// 						{ "data": "calTimeStd" },    
// 						{ "data": "lastCalDate" },    
// 						{ "data": "servicedByName" },    
// 						{ "data": "servicedByEmail" },    
// 						{ "data": "status" },    
// 						{ 
// 				     		"data": "id"
// 					        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 					        	 var txt = '<a href="../checkTool/view.jsp?checkTool_ID= "> </a>';
// 					            $(nTd).html(txt);
// 					        } 
// 			            },
// 						{ 
// 				     		"data": "id"
// 					        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 					        	 var txt = '<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" '
// 					        		 + 'onclick="popupCert('+ oData.id+')"> <i class="fa fa-certificate"></i> Certificate </button>';
// 					            $(nTd).html(txt);
// 					        } 
// 			            }
				    ],
				      "aoColumnDefs": [
				      { "sClass": "text-center", "aTargets": [0,1,3,4] },
				    ],
				    rowCallback: function (row, data) {}, 
				    ordering: false, 
			   	   	destroy: true 
				 });
				 
				
				function doAdd() {
					location = cPath + "/checkTool/checkTool_create.htm" ;
			}
				
				
				$(document).ready(function() {
					doSearch();
				});
				
				
			</script>
			

  

