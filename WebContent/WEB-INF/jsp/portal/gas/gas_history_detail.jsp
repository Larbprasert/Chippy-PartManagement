 <!DOCTYPE HTML>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<!--###############  Modal Desc ############# -->
	
	<div id="historyModal" class="modal fade" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog  modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-edit"></i>Gas Detector History
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
										 <label  class="detail-label" id="history-deptName"></label>
									</div>
								</div>
							</div>
							<div class="col-md-6"></div><div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Equipment
										Code</label>
									<div class="col-lg-6">
										<label  id="history-id" class="hidden"></label>
										<label  class="detail-label" id="history-eqCode"></label>
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
										<label  class="detail-label" id="history-eqTypeName"></label>
									</div>
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Serial No.</label>
									<div class="col-lg-6">
										<label  class="detail-label" id="history-serialNo"></label>
									</div>
								</div>
							</div>
							
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Brand</label>
									<div class="col-lg-6 ">
										<label  class="detail-label" id="history-brand"></label>
									</div>
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Model</label>
									<div class="col-lg-6">
										<label  class="detail-label" id="history-model"></label>
									</div>
								</div>
							</div>
						</div>
						
						 
<!-- 		 	 HISTORY -->
						 
						<div class="row">
							<div class="col-md-12">
								<h4 class="border-bottom">History</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4">

										<div class="form-group">
											<label for="" class="col-lg-4 control-label">Job No.
											</label>
											<div class="col-lg-8">
												<input type="text" class="form-control" id="history-jobNo" >
											</div>
										</div>

									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="" class="col-lg-4 control-label">Date
												From </label>
											<div class="col-lg-8">
<!-- 												<input type="date" class="form-control"> -->
												
												<div class='input-group date' id='f-dateFrom' >
													<input type='text' class="form-control" id='history-dateFrom' name='dateFrom'/> <span
														class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>
								
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="" class="col-lg-4 control-label">Date To
											</label>
											<div class="col-lg-8">
												<div class='input-group date' id='f-dateTo' >
													<input type='text' class="form-control" id='history-dateTo' name='dateTo'/> <span
														class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">

									<div class="col-md-12">

										<div class="box-tools text-center">
											<button type="reset" class="btn btn-default" >
													&nbsp;<i class="fa fa-refresh"></i> Clear
												</button>
												&nbsp;&nbsp;
											<button type="button" id="f-searchBtn" class="btn btn-primary" >
													<i class="fa fa-search"></i> Search
												</button>
										</div>


									</div>
								</div>

							</div>
						</div>
						 <br><hr>
						<div class="row">
							<div class="col-md-12">
								<table id="result-table-History" class="table table-striped table-bordered">
									<thead class="bg-green color-palette">
										<tr>
											<th class="text-center" width="5%">No</th>
											<th class="text-center" width="8%">Job No</th>
											<th class="text-center" width="15%" >Status</th>
											<th class="text-center" width="40%">Remark</th>
											<th class="text-center" >Date</th>
											<th class="text-center" >Update by</th>
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

					</div>

				</form>
			</div>
		</div>
	</div>
	
	
<script type="text/javascript">

	var EQ_HIST = {};
	

	$('#f-dateFrom,#f-dateTo').datepicker({
		format : "dd/mm/yyyy", // important!!
		autoclose:true,
		enableOnReadonly:true
	}); 


	var historyTable = $('#result-table-History').DataTable({
		autoWidth: false,
		data:[],
	    columns: [
// 			{ "data": "id" }, 
			{
				"data" : "id",
				"fnCreatedCell" : function(nTd, sData,
						oData, iRow, iCol) {
					var txt = iRow;
					$(nTd).html(txt + 1);
				}
			},    
			{ "data": "jobNo" }, 
// 			{ "data": "jobType" }, 
			{ "data": "jobStatus" }, 
			{ "data": "remark" },
			{ "data": "createDateStr" },
			{ "data": "createBy" }
			 
	    ],
	      "aoColumnDefs": [
	      { "sClass": "text-center", "aTargets": [0,1,2,4,5] },
	    ],
	    rowCallback: function (row, data) {}, 
	    ordering: false, 
		 destroy: true 
	 });
	

	 EQ_HIST.loadHistoryList = function(id){
	 	
		console.log("loadHistoryList : "+id);
		
		EQ_HIST.eqId = id;
		
		EQ_HIST.loadHistoryDetails(id);
		
		$.ajax({
            url: cPath+"/gasRegistered/getEquipmentDetail.json",
            data: { "id" : id }
        }).done(function (result) {
        	
	       	for (key in result) {
	       	    if (result.hasOwnProperty(key)) {
	       	        var sval = result[key];
	       	        sval = sval==null? '':sval;
	       	        $('#history-'+key).html(sval);
	       	    }
	       	}    
	    	
         }).fail(function (jqXHR, textStatus, errorThrown) { 
               // needs to implement if it fails
         });

	}
	 
	 
	 EQ_HIST.loadHistoryDetails = function(id){
			
			$.ajax({
	            url: cPath+"/jobHistory/getDataTable.json",
	            data: { 
	            	"eqId" : id ,
	            	"jobNo" :  $('#history-jobNo').val() ,
	            	"dateFrom" : $('#history-dateFrom').val()  ,
	            	"dateTo" : $('#history-dateTo').val()  
	            }
	        }).done(function (result) {
	        	
	        	historyTable.clear().draw();
	            if(result.recordsTotal>0){
		            historyTable.rows.add(result.data).draw();
	            }else{
	            }
	       
	           }).fail(function (jqXHR, textStatus, errorThrown) { 
	                 // needs to implement if it fails
	           });
		 
	 }
	 
	 
	 $( "#f-searchBtn" ).click(function() {
		 	EQ_HIST.loadHistoryDetails(EQ_HIST.eqId);
	 });
	 
	 
	 
	 EQ_HIST.uploadHistory = function(){
		 
		$('#historyUploadModal').modal('show');
		
// 		console.log(" EQ_HIST.uploadHistory : "+EQ_HIST.eqId );
		
		$('#fileupload').bind('fileuploadsubmit', function (e, data) {
		    data.formData = {eqId: EQ_HIST.eqId};
		});
		
		
		$("#historyUploadModal").on("hidden.bs.modal", function () {
			EQ_HIST.loadHistoryList(EQ_HIST.eqId);
		});
		
		$("table tbody.history-file").empty();
		
	 }
		
	 
	 
	function deleteFile (id){
	 
	  	if (!window.confirm("Do you really want to delete the file?")) {
            return false;
        }
	  	
		$.ajax({
            url: cPath+"/fileHistory/fileRemove/"+id,
        }).done(function (result) {
        	 
        	EQ_HIST.loadHistoryList(EQ_HIST.eqId);
        	
          }).fail(function (jqXHR, textStatus, errorThrown) { 
                // needs to implement if it fails
          });
	  
	}
	 
	function downloadFile (id){
		window.open( cPath+"/fileHistory/get/"+id , "_blank");
	}


</script>

	
	