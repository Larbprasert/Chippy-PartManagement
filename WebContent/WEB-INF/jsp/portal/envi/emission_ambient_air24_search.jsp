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
				<i class="fa fa-industry"></i>&nbsp;&nbsp;Ambient Air (24 HR)
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

								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramType" class="col-lg-4 control-label">Company</label>
											<div class="col-lg-6">
												<select class="form-control" name="companyName"
													id="companyName">
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
												<div class='input-group date' id='searchFrom'
													data-date-format="M yyyy">
													<input type='text' class="form-control" id='periodFrom'/> <span
														class="input-group-addon"> <span
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
												<div class='input-group date' id='searchTo'
													data-date-format="M yyyy">
													<input type='text' class="form-control" id='periodTo'/> <span
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
												<button type="reset" class="btn btn-default" onclick='resetSearch()'>
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
<!-- 							<div class="box-tools pull-right"> -->
<!-- 								<button type="button" -->
<!-- 									class="btn btn-box-tool btn-success btn-table" -->
<!-- 									data-toggle="modal" data-target="#myModal"> -->
<!-- 									<i class="fa fa-plus"></i> Add -->
<!-- 								</button> -->
<!-- 							</div> -->
						</div>
						<div class="box-body">
							<div class="nav-tabs-custom">
								<ul class="nav nav-tabs" id="tab_tpac">
									<li class="active"><a href="#tab_1" data-toggle="tab">Benzene</a>
									</li>
								</ul>
								<ul class="nav nav-tabs hidden" id="tab_tpcc">
									<li class="active"><a href="#tab_1" data-toggle="tab">Methylene
											Chloride</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab_1">
										<form role="form">

											<table class="table table-striped table-bordered"
												id="resultTable">
												<thead class="bg-green color-palette">
													<tr>
														<th class="text-center" width="5%">No.</th>
														<th class="text-center" width="30%">Period</th>
															<th class="text-center" width="20%"  ><span id="plant-t">TPAC- Plant</span></th>
														<th class="text-center" width="20%">Nong Flab </th>
														<th class="text-center" width="20%">Chlak Klang</th>
									
														<th class="text-center"  width="5%"
															style="border-right-width: 1px;">Edit</th>
													</tr>
												</thead>
											</table>

											<!-- row -->
										</form>
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
					<h4 class="modal-title">Add/Edit</h4>
				</div>
				<form  class="form-horizontal" id="saveform" method="post" 
				command="util" data-toggle="validator">
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-4 control-label">Company</label>
							<div class=" form-group col-sm-5">
										<select class="form-control" name="company-e"
													id="company-e" onchange="comEdit()">
													<option value="TPAC" selected>TPAC</option>
													<option value="TPCC">TPCC</option>
												</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Parameter</label>
							<div class=" form-group  col-sm-5">
									 <select class="form-control"  id="param" >
                                            <option value="BENZEN">Benzene</option>
                                             <option value="METHYL" style="display: none;">Methylene</option>
                                     </select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-4 control-label ">Period</label>
							<div class="form-group has-feedback col-sm-5">

								<div class="input-group date" id="period" name="period" >
									
									<input type="text" class="form-control form-control-1 input-sm" id ="monthInput" required 
									required data-remote="" data-remote-error="Period already exists." >
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
								
								<div class="help-block with-errors"></div>

							</div>
						</div>
						<div class="form-group  ">
							<label class="col-sm-4 control-label" id="plant-e">TPAC-Plant</label>

							<div class="form-group has-feedback col-sm-5">

								<input type="text" class="form-control number" name="plant" id ="plant"   pattern="^([0-9]{0,14})(\.[0-9]{0,4})?" required>
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>

							</div>
							<label class="col-sm-1 control-label text-left"></label>
						</div>
						<div class="form-group ">
							<label class="col-sm-4 control-label">Nong Fab</label>

							<div class="form-group has-feedback col-sm-5">
								<input type="text" class="form-control number" name="nongfab" id ="nongfab"  pattern="^([0-9]{0,14})(\.[0-9]{0,4})?" required>
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							<label class="col-sm-1 control-label text-left "></label>
						</div>

						<div class="form-group ">
							<label class="col-sm-4 control-label">Chlak Klang</label>
							
							<div class=" form-group has-feedback col-sm-5"> 
								<input type="text" class="form-control number" name="chkl" id ="chkl"   pattern="^([0-9]{0,14})(\.[0-9]{0,4})?" required>
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							<label class="col-sm-1 control-label text-left "></label>
						</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="saveBtn">Save</button>

				</div>
				</form>
			</div>

		</div>
	</div>
</body>
<script >
var pFrom = "";
var pTo = ""; 
var stateTab = "TSP";
var pPeriod = "";

var jsonObj = {
		"id":"",
		"companyName":"",
		"periodFrom":"",
		"periodTo":"",
		"parameter_code":"",
		"period":"",
		"parameter":"",
		"plant_val":"",
		"nongfab_val":"",
		"chkl_val":""
} 

	var dataTable = $('#resultTable').DataTable({
		autoWidth: false,
		data:[],
	    columns: [
			{ "data": "id",
				"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
	        	 var txt = iRow ;
		            $(nTd).html(txt+1); 
		        } 
			}, 
			{ 	"data": "period",
				"mRender": function ( data, type, full ) {
					var month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
					var year = data.slice(0, 4);
					var mm = parseInt(data.slice(4, 6));
					/* var d = new Date(year,month-1); */
            		return  month[mm-1] + " " + year// d.getFullYear();
        			} 
			}, 
			{ "data": "plant_val" },        
			{ "data": "nongfab_val" },     
			{ "data": "chkl_val" },    
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
	      { "sClass": "text-center", "aTargets": [0,1,2,3,4,5] }
	    ],
	    rowCallback: function (row, data) {}, 
	    ordering: false, 
   	   	destroy: true 
	 });
	
	function clickSearch() {
		jsonObj.companyName = $("#companyName").val();
		jsonObj.periodFrom = pFrom;
		jsonObj.periodTo = pTo;
		callDataTable();
		
		$("#resultSearch").show();
		//document.getElementById("tabSarchResult").style.visibility = "visible"
		var companyName = $('select[name=companyName]').val();
		if (companyName == "TPAC") {
			$('#plant-t').html("TPAC-Plant");
			$("#tab_tpcc").addClass("hidden");
			$("#tab_tpac").removeClass("hidden");
			
			$("#tab_tpac li").removeClass("active");
			$("#tab_tpac li").first().addClass("active");

		} else {
			$('#plant-t').html("TPCC-Plant");
			$("#tab_tpac").addClass("hidden");
			$("#tab_tpcc").removeClass("hidden");
			
			$("#tab_tpcc li").removeClass("active");
			$("#tab_tpcc li").first().addClass("active");
		}
	}
	
	function callDataTable(){
			$.ajax({
	            url: cPath+"/ambientAir24/getDataTable",
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
			jsonObj.parameter_code = $("#param").val();
			jsonObj.period = pPeriod; 
			jsonObj.companyName = $('#company-e').val();
 			jsonObj.plant_val = $('#plant').val();
 			jsonObj.nongfab_val = $('#nongfab').val();
 			jsonObj.chkl_val = $('#chkl').val();
 			
 			$.ajax({
	            url: cPath+"/ambientAir24/doSave.htm",
	           	data:jsonObj
	        }).done(function (result) {
	        	clearPopupdata()
	        	$('#myModal').modal('hide');
	        	clickSearch()
	        	
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
 		
 		
 	 $("#saveBtn").click(function(e){
 		jsonObj.parameter_code = $("#param").val();
 		jsonObj.period = pPeriod;
	 	//console.log("verify id"+jsonObj.id+" period "+ jsonObj.period)
	 	 
		var _f = $('#saveform').validator('validate');
 		if (_f.has('.has-error').length==0) {
 			//callVerify();
 			doSave();
 		}
 		
/*  		$('#saveform').validator('validate').on('click',function (e) {
 			  if (e.isDefaultPrevented()) {
 			    console.log("validtation start")
 			   	
 			  } else {
 			    // everything looks good!
 			    doSave();
 			     console.log("validtation looks good")
 			  }
 		}) */
 		

 		
 	});
	 function callVerify(){
 	 		$.ajax({
	            url: cPath+"/ambientAir24/verify",
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
 	 	}/* ,#period */
	$('#searchFrom,#searchTo').datepicker({
		format : "M yyyy",
		viewMode : "months",
		minViewMode : "months",
		autoclose:true,
		enableOnReadonly:true
	}); 
	$('#period').on('changeDate', function(e) {
		var period  = e.date.getFullYear()+""+getMonth(e.date.getMonth())
		pPeriod = period
		onChangeForValidate()
	});
	$('#searchFrom').on('changeDate', function(e) {
		var from  = e.date.getFullYear()+""+getMonth(e.date.getMonth())
		pFrom = from
		$('#searchTo').datepicker('setStartDate', e.date);
		
	});
	$("#searchTo").on("changeDate", function(e) {
		var to  = e.date.getFullYear()+""+getMonth(e.date.getMonth())
		pTo = to
		$('#searchFrom').datepicker('setEndDate', e.date);
	});
	
	function resetSearch(){
 		$('#searchFrom,#searchTo').datepicker('destroy');
 		pTo ="";
 		pFrom ="";
 	}

	function doAdd(){
//			$('#company-e').val($('#companyName').val());
//			$('#year-e').prop('disabled', false);
		clearPopupdata()
		jsonObj.id = "";
		$('#company-e').prop('disabled', false);
		$('#param').prop('disabled', false);
		
		$('#saveform').validator('destroy');
		$('#saveform').validator('reset');
		
		$('#period').datepicker('remove')
		$('#monthInput').prop('disabled', false);
		$('#period').datepicker({
			format : "M yyyy",
			viewMode : "months",
			minViewMode : "months",
			autoclose:true,
			enableOnReadonly:true
		});
		
		$('#myModal').modal('show');
	}
	
	function doEdit(rec){
		$('#period').datepicker({
			format : "M yyyy",
			viewMode : "months",
			minViewMode : "months",
			autoclose:true,
			enableOnReadonly:true
		});
		
		$('#company-e').val($('#companyName').val());
		
		if("TPAC"==$('#companyName').val()){
			$('#plant-e').html("TPAC-Plant");
			$("#param").val('BENZEN').change();
		}else{
			$('#plant-e').html("TPCC-Plant");
			$("#param").val('METHYL').change();
		}  
		
		$('#saveform').validator('destroy');
		$('#saveform').validator('reset');
		
		var data = T_DATA[rec]['period'];
		var d = new Date(data.slice(0, 4),data.slice(4, 6)-1);
		$('#period').datepicker('setDate', d);
		
		jsonObj.id =  T_DATA[rec]['id'];
		//$('#param').val(stateTab);
		$('#plant').val(T_DATA[rec]['plant_val']);
		$('#nongfab').val(T_DATA[rec]['nongfab_val']);
		$('#chkl').val(T_DATA[rec]['chkl_val']);
		
		$('#saveform').validator('reset');
		$('#company-e').prop('disabled', true);
		$('#param').prop('disabled', true);
		
		$('#period').datepicker('remove')
		$('#monthInput').prop('disabled', true); 
		
		var path = cPath+"/ambientAir24/verify?id="+jsonObj.id+"&companyName="+$('#companyName').val()
		+"&parameter_code="+$("#param").val()+"&period="+pPeriod;
		$("#monthInput").data("remote", path);
		
		$('#myModal').modal('show');
	}
	
	function comEdit(p) {
		if("TPAC"==$('#company-e').val()){
			$('#plant-e').html("TPAC-Plant");
			$("#param option[value=METHYL]").hide();
			$("#param").val('BENZEN');
		}else{
			$('#plant-e').html("TPCC-Plant");
			$("#param option[value=BENZEN]").hide();
			$("#param").val('METHYL');
		}        
		onChangeForValidate()
	}
	
	function clearPopupdata(){ 
 			$('#saveform').validator('destroy');
 			$('#period').datepicker('clearDates');
 			document.getElementById('saveform').reset();

 			$('#plant').val("");
			$('#nongfab').val("");
			$('#chkl').val(""); 
 	}
 	
	function getMonth(date) {
		var month = date + 1;
		return month < 10 ? '0' + month : '' + month; // ('' + month) for string result
	} 
	
	function onChangeForValidate(){
			var param ="";
			var com = "TPAC";
			var id = jsonObj.id;
			param = $("#param").val();
			com = $('#company-e').val();
			
			var path = cPath+"/ambientAir24/verify?id="+id+"&companyName="+com+"&parameter_code="+param+"&period="+pPeriod;
			console.log("change path " + path);
			
			$("#monthInput").data("remote", path);
			$('#monthInput').trigger('input')
			
 	}
	function editParam(){
 		onChangeForValidate();
 	}
	
</script>