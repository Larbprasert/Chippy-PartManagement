<!DOCTYPE HTML>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- Modal Desc -->
	<div id="uploadModal" class="modal fade" role="dialog"
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
											<th class="text-center" width="10%">Delete</th>
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
	
	<div id="load_post" > </div>

<script type="text/javascript">

	var _UPLOAD_FILE = {};

	var fileTable = $('#upload-table').DataTable({
		autoWidth: false,
		data:[],
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
            },
			{ 
	     		"data": "id"
		        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		        	 var txt = '<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" '
		        		 + 'onclick="deleteFile('+ oData.id+')"> <i class="fa fa-trash"></i> Delete </button>';
		            $(nTd).html(txt);
		        } 
            }
	    ],
	      "aoColumnDefs": [
	      { "sClass": "text-center", "aTargets": [0,2,3,4,5] },
	    ],
	    rowCallback: function (row, data) {}, 
	    ordering: false, 
		 destroy: true 
	 });
	

	 _UPLOAD_FILE.loadFileList = function(id,type){
	 	
		console.log("loadFileList:"+id+", type:"+type);
		
		if("1"==type){
			$('#upload-btn-new').hide();
		}else if("2"==type){
			$('#upload-btn-new').show();
		}
		
// 		$('#file-up-id').val(id);
// 		_UPLOAD_FILE.reqId = id;
		/* 
		$.ajax({
            url: cPath+"/gasRegistered/getEquipmentDetail.json",
            data: { "id" : id }
        }).done(function (result) {
        	
//         	console.log(result);
        	for (key in result) {
        	    if (result.hasOwnProperty(key)) {
        	        var sval = result[key];
        	        sval = sval==null? '':sval;
        	        $('#File-'+key).html(sval);
        	    }
        	}    
	    	
        	
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
		
		 */
		 
		 $('#uploadModal').modal('show');
		 
	/* 	$.ajax({
            url: cPath+"/fileUpload/getFileList.json",
            data: { "reqId" : id , "type" : type }
        }).done(function (result) {
        	
        	fileTable.clear().draw();
            if(result.recordsTotal>0){
	            fileTable.rows.add(result.data).draw();
            }
       
        	
           }).fail(function (jqXHR, textStatus, errorThrown) { 
           });
		 */
	}
	 
	 _UPLOAD_FILE.uploadNew = function(){
		 
		$('#fileUploadModal').modal('show');
		
// 		console.log(" _UPLOAD_FILE.uploadFile : "+_UPLOAD_FILE.ereqId);
		
		$('#fileupload').bind('fileuploadsubmit', function (e, data) {
		    data.formData = {reqId: _UPLOAD_FILE.reqId};
		});
		
		
		$("#fileUploadModal").on("hidden.bs.modal", function () {
			_UPLOAD_FILE.loadFileList(_UPLOAD_FILE.reqId);
		});
		
		$("table tbody.file-file").empty();
		
	 }
		
	 
	 
	function deleteFile (id){
	 
	  	if (!window.confirm("Do you really want to delete the file?")) {
            return false;
        }
	  	
		$.ajax({
            url: cPath+"/fileUpload/fileRemove/"+id,
        }).done(function (result) {
        	 
        	_UPLOAD_FILE.loadFileList(_UPLOAD_FILE.reqId);
        	
          }).fail(function (jqXHR, textStatus, errorThrown) { 
                // needs to implement if it fails
          });
	  
	}
	 
	function downloadFile (id){
		window.open( cPath+"/fileUpload/get/"+id , "_blank");
	}


</script>



	<%@ include file="requested_upload_new.jsp"%>
	
	
	
	