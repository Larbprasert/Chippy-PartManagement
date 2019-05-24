<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

	<div class="content-wrapper">

		<section class="content-header">
			<h1>
				<i class="fa fa-industry"></i>&nbsp;&nbsp;Stack Result
			</h1>
		</section>

		<section class="content">

			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Criteria</h3>
						</div>
						<div class="box-body">

							<form class="form-horizontal" id="myForm" commandname="sysParam"
								method="post">

								<div class="col-lg-6">
									<div class="form-group">
										<label for="paramType" class="col-lg-4 control-label">Company</label>
										<div class="col-lg-6">
											<select class="form-control" name="companyname"
												id="companyname" onchange="companySearchChange()">
												<option value="TPAC" selected>TPAC</option>
												<option value="TPCC">TPCC</option>
											</select>
										</div>
									</div>
								</div>


								<div class="col-lg-6">
									<div class="form-group">
										<label for="paramCode" class="col-lg-4 control-label">Year</label>
										<div class="col-lg-6">
											<select class="form-control" name="year" id ="year">
												<% for(int i=curr_year;i>=start_year;i--){ %>
													<option><%= i %></option>
												<% } %>
											</select>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group ">
											<div class="col-lg-12 text-center">
												<button type="reset" class="btn btn-default">
													&nbsp;<i class="fa fa-refresh"></i> Clear
												</button>
												&nbsp;&nbsp;
												<button type="button" id="searchBtn" class="btn btn-primary"
													onclick='clickSearch()'>
													<i class="fa fa-search"></i> Search
												</button>
												&nbsp;&nbsp;
											</div>
										</div>
									</div>
								</div>

							</form>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->

				</div>
				<!-- /.box-footer -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-md-12" style="display: none;" id="resultSearch">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Result</h3>
						</div>
						<div class="box-body">
							<div class="nav-tabs-custom">
								<ul class="nav nav-tabs" id="tab_tpac">
								
								<li class="active" onclick="clickTab(this.id)" id="TSP" ><a href="#tab_1" data-toggle="tab">TSP</a>
									</li>
									<li onclick="clickTab(this.id)" id="NOX"><a href="#tab_1" data-toggle="tab">NOx</a></li>
									<li onclick="clickTab(this.id)" id="BENZEN"><a href="#tab_1" data-toggle="tab">Benzen</a></li>
									<li onclick="clickTab(this.id)" id="FORMAL"><a href="#tab_1" data-toggle="tab">Formalin</a></li>
								</ul>
								<ul class="nav nav-tabs hidden" id="tab_tpcc">
									<li class="active" onclick="clickTab(this.id)" id="MC" ><a href="#tab_1" data-toggle="tab">MC</a>
									</li>
									<li onclick="clickTab(this.id)" id="HE"><a href="#tab_1" data-toggle="tab">HE</a></li>
								</ul>
								
								<div class="tab-content" id="tabContent_TPAC">
									<div class="tab-pane active" id="tab_0" >
											<table class="table table-striped table-bordered "
												id="resultTable">
												<thead class="bg-green color-palette">
													<tr>
														<th class="text-center" width="10%" rowspan="2">
															No.</th>
														<th class="text-center" width="20%" rowspan="2">
															Stack</th>
														<th class="text-center" width="30%" colspan="2">O2</th>
														<th class="text-center" width="30%" colspan="2">Emission</th>
														<th class="text-center" rowspan="2" width="10%">Edit
														</th>
													</tr>
													<tr>
														<th class="text-center">1st</th>
														<th class="text-center">2nd</th>
														<th class="text-center">1st</th>
														<th class="text-center" style="border-right-width: 1px;">2nd</th>
													</tr>

												</thead>
												
											</table>
									</div>
								</div>

							</div>
						</div>
						<!-- /.box-body -->

					</div>
					<!-- /.box -->

				</div>
				<!-- /.box-footer -->
			</div>

		</section>

	</div>

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit</h4>
				</div>
				<form class="form-horizontal" id="saveform" command="util" data-toggle="validator">
					<div class="modal-body">
						<div class="form-group">
								<label class="col-sm-3 control-label">Stack : </label>
								<div class="col-sm-8">
									<label class="col-sm-1 control-label"> </label>
									<input type="text" class="form-control" id="stack-e" readonly="readonly">
								</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">O2 : </label>

							<div class="col-sm-9">
								<label class="col-sm-2 control-label">1st</label>
								<div class="form-group has-feedback col-sm-4">
									<input type="text" class="form-control number" id="v1" pattern="^([0-9]{0,14})(\.[0-9]{0,4})?"  required>
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
								</div>
								<label class="col-sm-2 control-label">2nd</label>
								<div class="form-group has-feedback col-sm-4">
									<input type="text" class="form-control number" id="v2" pattern="^([0-9]{0,14})(\.[0-9]{0,4})?"  required>
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
										
								</div>

							</div>
							<!-- <label class="col-sm-1 control-label text-left"></label> -->
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Emission : </label>

							<div class="col-sm-9">
								<label class="col-sm-2 control-label">1st</label>
								<div class="form-group has-feedback col-sm-4">
									<input type="text" class="form-control number" id="v3" pattern="^([0-9]{0,14})(\.[0-9]{0,4})?"   required>
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
										
								</div>
								<label class="col-sm-2 control-label">2nd</label>
								<div class="form-group has-feedback col-sm-4">
									<input type="text" class="form-control number" id="v4"  pattern="^([0-9]{0,14})(\.[0-9]{0,4})?"  required>
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
								</div>

							</div>
							<!-- <label class="col-sm-1 control-label text-left "></label> -->
						</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="clickClose()">Close</button>
					<button type="button" class="btn btn-primary" id="saveBtn">Save</button>
				</div>
			</div>

		</div>
	</div>
</body>
<script >
	var stateTab = "TSP";

	var jsonObj = {
			"id":"",
			"companyName":"",
			"companyCode":"",
			"yearFrom":"",
			"yearTo":"",
			"parameter_code":"",
			"year":"",
			"o2_1st":"",
			"o2_2nd":"",
			"emission_1st":"",
			"emission_2nd":"",
			"stackNo":""
			
	} 
 	var dataTable = $('#resultTable').DataTable({
		autoWidth: false,
		data:[],
	    columns: [
			{ 	"data": "id"
				,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		        	 var txt = iRow ;
		            $(nTd).html(txt+1);
		        } 
			}, 
			{ "data": "stackNo" },  
			{ "data": "o2_1st" },     
			{ "data": "o2_2nd" },     
			{ "data": "emission_1st" },  
			{ "data": "emission_2nd" }, 
			{ 
	     		"data": "id"
		        ,"sWidth": "60px"
		        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" onclick="doEdit('+ iRow+')"> <i class="fa fa-edit"></i> edit </button>';
		            $(nTd).html(txt);
		        } 
            }
	    ],
	      "aoColumnDefs": [
	      { "sClass": "text-center", "aTargets": [0,1,2,3,4,5,6] }
	    ],
	    rowCallback: function (row, data) {}, 
	    ordering: false, 
   	   	destroy: true 
	 }); 

	function clickSearch() {
		var companyName = $('select[name=companyname]').val();
		$("#resultSearch").show(); 
		if (companyName == "TPAC") {
			stateTab = "TSP";
			//$('#plant-t').html("TPAC-Plant");
			$("#tab_tpcc").addClass("hidden");
			$("#tab_tpac").removeClass("hidden");
			
			$("#tab_tpac li").removeClass("active");
			$("#tab_tpac li").first().addClass("active");
				
		} else {
			stateTab = "MC";
			//$('#plant-t').html("TPCC-Plant");
			$("#tab_tpac").addClass("hidden");
			$("#tab_tpcc").removeClass("hidden");
			
			$("#tab_tpcc li").removeClass("active");
			$("#tab_tpcc li").first().addClass("active");
		}
		jsonObj.companyName = $("#companyname").val();
		jsonObj.year = $("#year").val();
		jsonObj.parameter_code = stateTab;
		callDataTable();
			
	}
	var T_DATA;
		function callDataTable(){
			$.ajax({
	            url: cPath+"/stackResult/getDataTable",
	           	//data: $('#myForm').serialize()
	           	data:jsonObj
	        }).done(function (result) {
	        	dataTable.clear().draw();
	            if(result.recordsTotal>0){
	            	T_DATA = result.data;
	            	dataTable.rows.add(result.data).draw();
	            }else{
	            } 
	           }).fail(function (jqXHR, textStatus, errorThrown) { 
	                 // needs to implement if it fails
	                 
	        }); 
 		}
		
 		function clickTab(id){
 			stateTab = id;
			jsonObj.companyName = $("#companyname").val();
			jsonObj.year = $("#year").val();
			jsonObj.parameter_code = id
			callDataTable();
 		}
 		
		function doEdit(rec){
			jsonObj.id =  T_DATA[rec]['id'];
			$('#stack-e').val( T_DATA[rec]['stackNo']);
			$('#v1').val( T_DATA[rec]['o2_1st']);
			$('#v2').val( T_DATA[rec]['o2_2nd']);
			$('#v3').val( T_DATA[rec]['emission_1st']);
			$('#v4').val( T_DATA[rec]['emission_2nd']);
			$('#myModal').modal('show');
		}
		
 	 	$("#saveBtn").click(function(e){
 			var _f = $('#saveform').validator('validate');
 			if (_f.has('.has-error').length==0) {
 		    	doSave();
 			} 
 		});
 	 	
 	 	function doSave(e){
 			bootbox.confirm({
 			    title: "Confirm",
 			    message: _confirmSaveTxt,
 			    size: 'small',
 			    buttons: {
 			        cancel: {
 			            label: '<i class="fa fa-times"></i> Cancel'
 			        },
 			        confirm: {
 			            label: '<i class="fa fa-check"></i> Confirm',
 			            className: 'btn-success'
 			        }
 			    },
 			    callback: function (result) {
 			        if(result){
 			        	//$('#saveform').submit();
 			        	callSave();
 			        }
 			    }
 			});

 		};
 		function callSave(){

			jsonObj.year = $('#year').val(); 
			jsonObj.companyName = $('#companyname').val();
			jsonObj.parameter_code = stateTab;
 			jsonObj.o2_1st = $('#v1').val();
 			jsonObj.o2_2nd = $('#v2').val();
 			jsonObj.emission_1st = $('#v3').val();
 			jsonObj.emission_2nd = $('#v4').val();
 			jsonObj.stackNo = $('#stack-e').val();
 			
 			$.ajax({
	            url: cPath+"/stackResult/doSave",
	           	data:jsonObj
	        }).done(function (result) {
	        	clearPopupdata()
	        	$('#myModal').modal('hide');
	        	callDataTable();
	        	
	        	$.notify({
						title: "<strong>Success!</strong> ",
						message: " Save successfully"
				});
	        	
	        }).fail(function (jqXHR, textStatus, errorThrown) { 
	                 // needs to implement if it fails
	            clearPopupdata()
	        	$('#myModal').modal('hide');
	                 
	            $.notify({
	            	title: "<strong>Fail!</strong> ",
	            	message: 'Save Fail!' 
	            },{
	            	type: 'danger'
	            });
	        });
 		}

 		function companySearchChange(){
 			console.log("tab status"+$("#companyname").val() );
 			if ($("#companyname").val() == 'TPAC'){
 				stateTab = "TSP";
 			}else{
 				stateTab = "MC";
 			}
 		}
 		
 		function clickClose(){
 			clearPopupdata()
 		}
 		
 		function clearPopupdata(){ 
 			$('#saveform').validator('destroy');
 			$('#saveform').validator('reset');
 			document.getElementById('saveform').reset();
 			$('#stack-e').val("");
			$('#v1').val("");
			$('#v2').val("");
			$('#v3').val("");
			$('#v4').val("");
 		}
	
	
</script>