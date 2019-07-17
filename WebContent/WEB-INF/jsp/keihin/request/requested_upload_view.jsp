<!DOCTYPE HTML>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- Modal Desc -->
	<div id="uploadViewModal" class="modal fade" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog  modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-upload"></i> Upload File
					</h4>
				</div>

				<form class="form-horizontal" id="form" action=""
					method="post" command="" data-toggle="validator"
					novalidate="true">

					<!-- 	           <fieldset class="well"><div class="w  "> -->

					<div class="box-body">
						 
						<div class="row">
							<div class="col-md-12">
								<div class="box-tools ">
									<button type="button" id="upload-btn-new" onclick="_UPLOAD_FILE.uploadNew()"
										class="btn btn-box-tool btn-success btn-table" style="display: none;"> 
										<i class="fa fa-plus"></i> Add 
									</button>
								</div>
							</div>
						</div>
						
						<br>
						
						<div class="row">
							<div class="col-md-12">
							
							<table id="upload-table"class="table table-striped table-bordered" style="width: 100%">
								<thead class="bg-green color-palette">
										<tr>
											<th class="text-center"  width="6%">No</th>
											<th class="text-center">Name</th>
											<th class="text-center">Date</th>
											<th class="text-center" swidth="10%">Size</th>
<!-- 											<th class="text-center">Type</th> -->
											<th class="text-center" width="10%">Download</th>
<!-- 											<th class="text-center" width="10%">Delete</th> -->
										</tr>
									</thead>
									 
								</table>
							</div>

						</div>



					</div>


					<div class="modal-footer">
						<button type="button" class="btn btn-default "
							data-dismiss="modal">
							<i class="fa fa-times-circle"></i> Close
						</button>
<!-- 						<button type="button" id="saveBtn" class="btn btn-primary" -->
<!-- 							data-dismiss="modal"> -->
<!-- 							<i class="fa fa-check-square-o"></i> Save -->
<!-- 						</button> -->

					</div>

				</form>
				
				
			</div>
		</div>
	</div>
	

<script type="text/javascript">

	var _UPLOAD_FILE_VIEW = {};

	_UPLOAD_FILE_VIEW.fileTable = $('#upload-table').DataTable({
		autoWidth: false,
		data:[],
		"searching": false,
		"paging":   false,
// 		"info":   false,
	    columns: [
			{
				"data" : "id",
				"fnCreatedCell" : function(nTd, sData,
						oData, iRow, iCol) {
					var txt = iRow;
					$(nTd).html(txt + 1);
				}
			},    	
			{ "data": "fileName" }, 
			{ "data": "createDateStr" }, 
			{ "data": "fileSize" }, 
// 			{ "data": "fileType" }, 
			{ 
	     		"data": "id"
		        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" '
		        	 	+' onclick="downloadFile('+ oData.id +')"> <i class="fa fa-download"></i> Download </button>';
		            $(nTd).html(txt);
		        } 
//             },
// 			{ 
// 	     		"data": "id"
// 		        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 		        	 var txt = '<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" '
// 		        		 + 'onclick="deleteFile('+ oData.id+')"> <i class="fa fa-trash"></i> Delete </button>';
// 		            $(nTd).html(txt);
// 		        } 
            }
	    ],
	      "aoColumnDefs": [
	      { "sClass": "text-center", "aTargets": [0,2,3,4] },
	    ],
	    rowCallback: function (row, data) {}, 
	    ordering: false, 
		 destroy: true 
	 });
	
 
	  
	 
	_UPLOAD_FILE_VIEW.downloadFile = function(id){
		window.open( cPath+"/fileUpload/get/"+id , "_blank");
	}


	_UPLOAD_FILE_VIEW.loadFile = function(reqId, type){
		$.ajax({
	        url: cPath+"/fileUpload/getFileList.json",
	        data: { "reqId" : reqId , "type" : type }
	    }).done(function (result) {
	    	
	    	$('#uploadViewModal').modal('show');

	    	_UPLOAD_FILE_VIEW.fileTable.clear().draw();
	         if(result.recordsTotal>0){
	        	 _UPLOAD_FILE_VIEW.fileTable.rows.add(result.data).draw();
	         }
	   
	     }).fail(function (jqXHR, textStatus, errorThrown) { 
	    	 
	     });
	}

	
</script>



<%-- 	<%@ include file="requested_upload_new.jsp"%> --%>
	
	
	
	