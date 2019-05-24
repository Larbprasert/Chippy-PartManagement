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
				<i class="fa fa-industry"></i>&nbsp;&nbsp;Ambient Air (7 day)
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

							<form class="form-horizontal" id="myForm" >
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramType" class="col-lg-4 control-label">Company</label>
											<div class="col-lg-6">
												<select class="form-control" name="companyName"
													id="companyName" onchange="companySearchChange()">
													<option value="TPAC" selected>TPAC</option>
													<option value="TPCC">TPCC</option>
												</select>
											</div>
										</div>
									</div>


									<div class="col-lg-6"></div>
								</div>

								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramCode" class="col-lg-4 control-label">Period
												From</label>
											<div class="col-lg-6">
												<div class='input-group date' id='dateFrom' name="dateFrom" >
													<input type='text' class="form-control" id='periodFrom' name="periodFrom" /> <span
														class="input-group-addon">  <span
														class="glyphicon glyphicon-calendar"></span> 
													</span>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramCode" class="col-lg-4 control-label">Period
												To</label>
											<div class="col-lg-6">
												<div class='input-group date' id='dateTo' name="dateTo" >
													<input type='text' class="form-control" id='periodTo' name="periodTo" /> <span
														class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group ">
											<div class="col-lg-12 text-center">
												<button type="reset" class="btn btn-default" onclick="resetSearch()">
													&nbsp;<i class="fa fa-refresh"></i> Clear
												</button>
												&nbsp;&nbsp;
												<button type="button" id="searchBtn" class="btn btn-primary"
													onclick='clickSearch()'>
													<i class="fa fa-search"></i> Search
												</button>
												&nbsp;&nbsp;
											<button type="button" class="btn  btn-success"  onclick="doAdd()">
												<i class="fa fa-plus"></i> 
												Add
											</button>
												<!-- 								<button type="button" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
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
									<li onclick="clickTab(this.id)" id="SOx"><a href="#tab_1" data-toggle="tab">SOx</a></li>
									<li onclick="clickTab(this.id)" id="SOx24"><a href="#tab_1" data-toggle="tab">SOx 24(HR)</a></li>
									<li onclick="clickTab(this.id)" id="NOx"><a href="#tab_1" data-toggle="tab">NOx</a></li>
									<li onclick="clickTab(this.id)" id="FORMAL"><a href="#tab_1" data-toggle="tab">Formalin</a></li>
								</ul>
								<ul class="nav nav-tabs hidden" id="tab_tpcc">
									<li class="active" onclick="clickTab(this.id)" id="CO2" ><a href="#tab_1" data-toggle="tab">CO<sub>2</sub></a>
									</li>
									<li onclick="clickTab(this.id)" id="NOx"><a href="#tab_1" data-toggle="tab">NOx</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab_1">
											<div class="row">
											<div class="col-md-12">
											<table  id="resultTable" class="table table-striped table-bordered" >
												<thead class="bg-green color-palette">
													<tr>
														<th class="text-center"rowspan="2">No.</th>
														<th class="text-center"  rowspan="2">
															Period</th>
														<th class="text-center" colspan="2" ><span id="plant-t">TPAC-Plant</span>&nbsp;</th>
														<th class="text-center"  colspan="2">Nong Flab </th>
														<th class="text-center" colspan="2">Chlak Klang</th>
														<th class="text-center" rowspan="2" >Edit</th>
													</tr>
													<tr>
														<th class="text-center">Min</th>
														<th class="text-center">Max</th>
														<th class="text-center">Min</th>
														<th class="text-center">Max</th>
														<th class="text-center">min</th>
														<th class="text-center">max</th>
													</tr>

												</thead>
											</table>
											</div>
											</div>

											<!-- row -->
									</div>
									<!-- /.tab-pane -->
								</div>
								<!-- /.tab-content -->
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
					<h4 class="modal-title">Add/Edit Ambient</h4>
				</div>
				<form class="form-horizontal" id="saveform" action="${cPath}/ambientAir/doSave.htm"  method="post" 
				command="util" data-toggle="validator">
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">Company</label>
							<div class="col-sm-8">
								<div class="col-sm-2"></div>
								<div class="form-group col-sm-9">
										<select class="form-control" name="company-e"
													id="company-e" onchange="comEdit()">
													<option value="TPAC" selected>TPAC</option>
													<option value="TPCC">TPCC</option>
												</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Parameter</label>
							<div class="col-sm-8">
								<div class="col-sm-2"></div>
								<div class=" form-group col-sm-9">
									 <select class="form-control"  name ="parameter_code" id="paramTPAC" onchange="editParam()">
                                            <option value="TSP">TSP</option>
                                            <option value="SOx">SOx</option>
                                            <option value="SOx24">SOx 24(HR)</option>
                                            <option value="NOx">NOx</option>
                                            <option value="FORMAL">Formalin</option>
                                        </select>
									 <select class="form-control"  name ="parameter_code" id="paramTPCC" style="display:none;" onchange="editParam()">
                                            <option value="CO2">CO2</option>
                                            <option value="NOx">NOx</option>
                                     </select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Period</label>

							<div class="col-sm-8">
								<div class="col-sm-2 control-label"></div>
								<div class="form-group has-feedback col-sm-9">
									<div class="input-group date" id ="period-e" name = "period-e">
									
									<input type="text" class="form-control form-control-1 input-sm"  id = "periodMonth" name ="periodMonth"
										required data-remote=""
										data-remote-error="Period already exists.">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
									</div>
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" id="plant-e">TPAC-Plant</label>

							<div class="col-sm-8">
								<label class="col-sm-2 control-label">Min</label>
								<div class="form-group has-feedback col-sm-4">
									<input type="text" class="form-control number" id="plant_min" pattern="^([0-9]{0,14})(\.[0-9]{0,4})?"  required>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>
								<label class="col-sm-2 control-label">Max</label>
								<div class="form-group has-feedback col-sm-4">

									<input type="text" class="form-control number" id="plant_max"   pattern="^([0-9]{0,14})(\.[0-9]{0,4})?" required>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>

							</div>
							<label class="col-sm-1 control-label text-left"></label>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Nong Fab</label>

							<div class="col-sm-8">
								<label class="col-sm-2 control-label">Min</label>
								<div class="form-group has-feedback col-sm-4">
									
									<input type="text" class="form-control number" id="nongfab_min"  pattern="^([0-9]{0,14})(\.[0-9]{0,4})?" required>
									<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
									
								</div>
								
								<label class="col-sm-2 control-label">Max</label>
								<div class="form-group has-feedback col-sm-4">
		
										<input type="text" class="form-control number" id="nongfab_max"   pattern="^([0-9]{0,14})(\.[0-9]{0,4})?" required>
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									
								</div>
							</div>
							<label class="col-sm-1 control-label text-left "></label>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Chlak Klang</label>
							<div class="col-sm-8">
								<label class="col-sm-2 control-label">Min</label>
								<div class="form-group has-feedback col-sm-4">
									
										<input type="text" class="form-control number" id="chkl_min"  pattern="^([0-9]{0,14})(\.[0-9]{0,4})?" required>
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									
								</div>
								<label class="col-sm-2 control-label">Max</label>
								<div class="form-group has-feedback col-sm-4">
									
										<input type="text" class="form-control number" id="chkl_max"  pattern="^([0-9]{0,14})(\.[0-9]{0,4})?" required>
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									
								</div>
							</div>
							<label class="col-sm-1 control-label text-left "></label>
						</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="clickClose()">Close</button>
					<button type="button" class="btn btn-primary" id="saveBtn" >Save</button>
					
				</div>
			</div>

		</div>
	</div>
<script>
	var pFrom = "";
	var pTo = ""; 
	var pPeriod ="";
	var stateTab = "TSP";
	
	var jsonObj = {
			"id":"",
			"companyName":"",
			"periodFrom":"",
			"periodTo":"",
			"parameter_code":"",
			"period":"",
			"plant_max":"",
			"plant_min":"",
			"nongfab_max":"",
			"nongfab_min":"",
			"chkl_max":"",
			"chkl_min":""
			
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
			{ 	"data": "period",
				"mRender": function ( data, type, full ) {
					var month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
					var year = data.slice(0, 4);
					var mm = parseInt(data.slice(4, 6));
            		return  month[mm-1] + " " + year// d.getFullYear();
        			} 
			}, 
			{ "data": "plant_min" },     
			{ "data": "plant_max" },     
			{ "data": "nongfab_min" },  
			{ "data": "nongfab_max" },    
			{ "data": "chkl_min" },    
			{ "data": "chkl_max" }, 
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
	      { "sClass": "text-center", "aTargets": [0,1,2,3,4,5,6,7,8] }
	    ],
	    rowCallback: function (row, data) {}, 
	    ordering: false, 
   	   	destroy: true 
	 }); 
	
		function clickSearch() {
			jsonObj.companyName = $("#companyName").val();
			jsonObj.periodFrom = pFrom;
			jsonObj.periodTo = pTo;
			jsonObj.parameter_code = stateTab;
			callDataTable();

			$("#resultSearch").show();
			$('#period-e').prop('readonly', false);
			var companyName = $('select[name=companyName]').val();
			if (companyName == "TPAC") {
				$('#plant-t').html('TPAC-Plant');
				$("#tab_tpcc").addClass("hidden");
				$("#tab_tpac").removeClass("hidden");
				
			} else {
				$('#plant-t').html('TPCC-Plant');
				$("#tab_tpac").addClass("hidden");
				$("#tab_tpcc").removeClass("hidden");
				
			}
		};
		
		function comEdit(p) {
			if("TPCC"==$('#company-e').val()){
				$('#plant-e').html("TPCC-Plant");
				$("#paramTPCC").show();
				$("#paramTPAC").hide();
			}else{
				$('#plant-e').html("TPAC-Plant");
				$("#paramTPAC").show();
				$("#paramTPCC").hide();
			}
			onChangeForValidate()
		}
		

		function doAdd(){
// 			$('#company-e').val($('#companyName').val());
// 			$('#year-e').prop('disabled', false);
			
			if("TPCC"==$('#company-e').val()){
				$('#plant-e').html("TPCC-Plant");
				$("#paramTPCC").show();
				$("#paramTPAC").hide();
			}else{
				$('#plant-e').html("TPAC-Plant");
				$("#paramTPAC").show();
				$("#paramTPCC").hide();
			}
			jsonObj.id = "";
			$('#period-e').datepicker('clearDates');
			$('#company-e').prop('disabled', false);
			$('#paramTPAC').prop('disabled', false);
			$('#paramTPCC').prop('disabled', false);
			
			$('period-e').datepicker('destroy');
			$('#saveform').validator('destroy');
			$('#saveform').validator('reset');
			
			$('#period-e').datepicker('remove')
			$('#periodMonth').prop('disabled', false);
			$('#period-e').datepicker({
				format : "M yyyy",
				viewMode : "months",
				minViewMode : "months",
				autoclose:true,
				enableOnReadonly:true
			});
			
			$('#plant_min').val("");
			$('#plant_max').val("");
			$('#nongfab_min').val("");
			$('#nongfab_max').val("");
			$('#chkl_min').val("");
			$('#chkl_max').val("");
			$('#myModal').modal('show');
		}
		
		function doEdit(rec){
			$('#period-e').datepicker({
				format : "M yyyy",
				viewMode : "months",
				minViewMode : "months",
				autoclose:true,
				enableOnReadonly:true
			});
			
			if("TPCC"==$("#companyName").val()){
				$('#plant-e').html("TPCC-Plant");
				$("#paramTPCC").show();
				$("#paramTPAC").hide();
			}else{
				$('#plant-e').html("TPAC-Plant");
				$("#paramTPAC").show();
				$("#paramTPCC").hide();
			}
			$('#saveform').validator('destroy');
			
			jsonObj.period = T_DATA[rec]['period'];
			var data = T_DATA[rec]['period'];
			var d = new Date(data.slice(0, 4),data.slice(4, 6)-1);
			$('#period-e').datepicker('setDate', d);
			
			jsonObj.id =  T_DATA[rec]['id'];
			$('#company-e').val($('#companyName').val());
			$('#paramTPAC').val(stateTab);
			$('#paramTPCC').val(stateTab);
			$('#plant_min').val(T_DATA[rec]['plant_min']);
			$('#plant_max').val(T_DATA[rec]['plant_min']);
			$('#nongfab_min').val(T_DATA[rec]['nongfab_min']);
			$('#nongfab_max').val(T_DATA[rec]['nongfab_max']);
			$('#chkl_min').val(T_DATA[rec]['chkl_min']);
			$('#chkl_max').val(T_DATA[rec]['chkl_max']);
			
			$('#saveform').validator('reset');
			$('#company-e').prop('disabled', true);
			$('#paramTPAC').prop('disabled', true);
			$('#paramTPCC').prop('disabled', true);
			
			// set data-remote when update 
			var path = cPath+"/ambientAir/verify?id="+jsonObj.id+"&companyName="+$('#companyName').val()
					+"&parameter_code="+stateTab+"&period="+pPeriod;
			console.log("change path " + path);
			$("#periodMonth").data("remote", path);
			
			$('#period-e').datepicker('remove')
			$('#periodMonth').prop('disabled', true); 
			
			$('#myModal').modal('show');
		}
		
 		function clickTab(id){
 			stateTab = id;
			jsonObj.companyName = $("#companyName").val();
			jsonObj.periodFrom = pFrom;
			jsonObj.periodTo = pTo;
			jsonObj.parameter_code = id
			callDataTable();
 		}
 		function clickClose(){
 			clearPopupdata()
 		}
 		
 		function getMonth(date) {
 			  var month = date + 1;
 			  return month < 10 ? '0' + month : '' + month; // ('' + month) for string result
 		}  
 		
 		function callDataTable(){
			$.ajax({
	            url: cPath+"/ambientAir/getDataTable.json",
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
 		function callSave(){
			if("TPCC"==$('#company-e').val()){
				jsonObj.parameter_code = $("#paramTPCC").val();
			}else{
				jsonObj.parameter_code = $("#paramTPAC").val();
			}
			jsonObj.period = pPeriod; 
			jsonObj.companyName = $('#company-e').val();
 			jsonObj.plant_min = $('#plant_min').val();
 			jsonObj.plant_max = $('#plant_max').val();
 			jsonObj.nongfab_min = $('#nongfab_min').val();
 			jsonObj.nongfab_max = $('#nongfab_max').val();
 			jsonObj.chkl_min = $('#chkl_min').val();
 			jsonObj.chkl_max = $('#chkl_max').val();
 			
 			$.ajax({
	            url: cPath+"/ambientAir/doSave.htm",
	           	data:jsonObj
	        }).done(function (result) {
	        	clearPopupdata()
	        	$('#myModal').modal('hide');
	        	clickSearch();
	        	
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

 	 	$("#saveBtn").click(function(e){
 	 		jsonObj.period = pPeriod;

 	 		var _f = $('#saveform').validator('validate');
		 	if (_f.has('.has-error').length==0) {
		 		//callVerify();
		 		doSave();
	 	 		
		 	} 

 		});
  	 	function callVerify(){
 	 		$.ajax({
	            url: cPath+"/ambientAir/verify",
	           	data:jsonObj
	        }).done(function (result) {
	        	if(result.status == '0' ){
	        		doSave();
	        	}else{
	        		bootbox.alert({
	        			title: "Alert",
	        			message: "Data alerady exist!", 
	        		    size: 'small'
	        		});
	        	}
	 			
	         }).fail(function (jqXHR, textStatus, errorThrown) { 
	                 // needs to implement if it fails
	        }); 
 	 	} 
 	 	
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
 		
 		function clearPopupdata(){ 
 			//$('#saveform').validator('destroy');
 			$('#period-e').datepicker('clearDates');
 			
 			document.getElementById('saveform').reset();
 			$('#saveform').validator('reset');
 			
 			$('#plant_min').val("");
			$('#plant_max').val("");
			$('#nongfab_min').val("");
			$('#nongfab_max').val("");
			$('#chkl_min').val("");
			$('#chkl_max').val(""); 
 		}
 		function resetSearch(){
 			$('#dateFrom,#dateTo').datepicker('destroy');
 			pTo ="";
 			pFrom ="";
 		}
 		function companySearchChange(){
 			console.log("tab status"+$("#companyName").val() );
 			if ($("#companyName").val() == 'TPAC'){
 				stateTab = "TSP";
				$("#tab_tpac li").removeClass("active");
				$("#tab_tpac li").first().addClass("active");
 			}else{
 				stateTab = "CO2";
				$("#tab_tpcc li").removeClass("active");
				$("#tab_tpcc li").first().addClass("active");
 			}
 		}
 		function onChangeForValidate(){
			var param ="";
			var com = "TPAC";
			var id = jsonObj.id;
			if("TPCC"==$('#company-e').val()){
				param = $("#paramTPCC").val();
			}else{
				param = $("#paramTPAC").val();
			}
			com = $('#company-e').val();
			
			var path = cPath+"/ambientAir/verify?id="+id+"&companyName="+com+"&parameter_code="+param+"&period="+pPeriod;
			console.log("change path " + path);
			$("#periodMonth").data("remote", path);
			$('#periodMonth').trigger('input')

			
 		}
 		
 		function editParam(){
 			onChangeForValidate();
 		}
 		
 		
 		
   		$('#dateFrom,#dateTo,#period-e').datepicker({
			format : "M yyyy",
			viewMode : "months",
			minViewMode : "months",
			autoclose:true,
			enableOnReadonly:true
		}); 
		$('#period-e').on('changeDate', function(e) {
			var period  = e.date.getFullYear()+""+getMonth(e.date.getMonth())
			pPeriod = period
			onChangeForValidate();
		});
		$('#dateFrom').on('changeDate', function(e) {
			var from  = e.date.getFullYear()+""+getMonth(e.date.getMonth())
			pFrom = from
			$('#dateTo').datepicker('setStartDate', e.date);
			
		});
		$("#dateTo").on("changeDate", function(e) {
			var to  = e.date.getFullYear()+""+getMonth(e.date.getMonth())
			pTo = to
			$('#dateFrom').datepicker('setEndDate', e.date);
		});
		
		
	</script>