<!DOCTYPE HTML>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- Modal Desc -->
	<div id="certModal" class="modal fade" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog  modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-edit"></i> Gas Detector Certificate
					</h4>
				</div>

				<form class="form-horizontal" id="form" action="userSave.htm"
					method="post" command="userProfile" data-toggle="validator"
					novalidate="true">

					<!-- 	           <fieldset class="well"><div class="w  "> -->

					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<h4 class="border-bottom">Equipment</h4>
							</div>
						</div>
						<div class="row">
						
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Department
									</label>
									<div class="col-lg-6">
										 <label  class="detail-label" id="cert-deptName"></label>
									</div>
								</div>
							</div>
							<div class="col-md-6"></div><div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Equipment
										Code</label>
									<div class="col-lg-6">
										<label  id="cert-id" class="hidden"></label>
										<label  class="detail-label" id="cert-eqCode"></label>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Equipment
										Type</label>
									<div class="col-lg-6">
										<label  class="detail-label" id="cert-eqTypeName"></label>
									</div>
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Serial No.</label>
									<div class="col-lg-6">
										<label  class="detail-label" id="cert-serialNo"></label>
									</div>
								</div>
							</div>
							
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Brand</label>
									<div class="col-lg-6 ">
										<label  class="detail-label" id="cert-brand"></label>
									</div>
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Model</label>
									<div class="col-lg-6">
										<label  class="detail-label" id="cert-model"></label>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<h4 class="border-bottom">Certificate</h4>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<div class="box-tools pull-right">
									<button type="button"  onclick="EQ_CERT.uploadCert()"
										class="btn btn-box-tool btn-success btn-table"> 
										<i class="fa fa-plus"></i> Upload
									</button>
								</div>
							</div>
						</div>
						
						<br>
						
						<div class="row">
							<div class="col-md-12">
							
							<table id="cert-table"class="table table-striped table-bordered" style="width: 100%">
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

	var EQ_CERT = {};

	var certTable = $('#cert-table').DataTable({
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
	

	 EQ_CERT.loadCertList = function(id){
	 	
// 		console.log("loadCertList : "+id);
		
// 		$('#cert-up-id').val(id);
		EQ_CERT.eqId = id;
		
		$.ajax({
            url: cPath+"/gasRegistered/getEquipmentDetail.json",
            data: { "id" : id }
        }).done(function (result) {
        	
//         	console.log(result);
        	for (key in result) {
        	    if (result.hasOwnProperty(key)) {
        	        var sval = result[key];
        	        sval = sval==null? '':sval;
        	        $('#cert-'+key).html(sval);
        	    }
        	}    
	    	
        	
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
		
		
		$.ajax({
            url: cPath+"/cert/getDataTable.json",
            data: { "eqId" : id }
        }).done(function (result) {
        	
        	certTable.clear().draw();
            if(result.recordsTotal>0){
	            certTable.rows.add(result.data).draw();
            }else{
            }
       
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
		
	}
	 
	 EQ_CERT.uploadCert = function(){
		 
		$('#certUploadModal').modal('show');
		
// 		console.log(" EQ_CERT.uploadCert : "+EQ_CERT.eqId );
		
		$('#fileupload').bind('fileuploadsubmit', function (e, data) {
		    data.formData = {eqId: EQ_CERT.eqId};
		});
		
		
		$("#certUploadModal").on("hidden.bs.modal", function () {
			EQ_CERT.loadCertList(EQ_CERT.eqId);
		});
		
		$("table tbody.cert-file").empty();
		
	 }
		
	 
	 
	function deleteFile (id){
	 
	  	if (!window.confirm("Do you really want to delete the file?")) {
            return false;
        }
	  	
		$.ajax({
            url: cPath+"/fileCert/fileRemove/"+id,
        }).done(function (result) {
        	 
        	EQ_CERT.loadCertList(EQ_CERT.eqId);
        	
          }).fail(function (jqXHR, textStatus, errorThrown) { 
                // needs to implement if it fails
          });
	  
	}
	 
	function downloadFile (id){
		window.open( cPath+"/fileCert/get/"+id , "_blank");
	}


</script>



<%@ include file="gas_certificate_upload.jsp"%>
	
	
	
	