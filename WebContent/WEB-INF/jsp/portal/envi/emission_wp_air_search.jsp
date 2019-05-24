<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp" %>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
<div class="content-wrapper">

	<section class="content-header">
		<h1>
			<i class="fa fa-industry"></i>&nbsp;&nbsp;Workplace Air Result
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

						<form class="form-horizontal" id="myForm" commandname="sysParam" method="post">

							<div class="row">	
							<div class="col-lg-6">
								<div class="form-group">
									<label for="paramType" class="col-lg-4 control-label">Company</label>
									<div class="col-lg-6">
										<select class="form-control" name="companyname" id="companySearch">
											<option value="TPAC" selected>TPAC</option>
											<option value="TPCC" >TPCC</option>
										</select>
									</div>
								</div>
							</div>
							</div>
							
							<div class="row">
							 <div class="col-md-6">
									<div class="form-group">
										<label class="col-md-4 control-label">From Year</label>
										<div class="col-md-6">
											<select class="form-control" name="periodFrom">
												<option value="">--- All ---</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
												<option><%= i %></option>
											<% } %>
											</select>
										</div>
									</div>
								</div><!-- col-md-6 -->
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-4 control-label">To Year</label>
										<div class="col-md-6">
											<select class="form-control" name="periodTo">
												<option value="">--- All ---</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
													<option><%= i %></option>
												<% } %>
											</select>
										</div>
									</div>
								</div> 
							</div> 
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group ">
										<div class="col-lg-12 text-center">
											<button type="reset" class="btn btn-default">
												<i class="fa fa-refresh"></i> Clear
											</button>&nbsp;&nbsp;
											<button type="button" id="searchBtn" class="btn btn-primary" onclick='clickSearch()'>
												<i class="fa fa-search"></i> Search
											</button>&nbsp;&nbsp;
											<button type="button" class="btn btn-success" onClick="openModal('')" >
												<i class="fa fa-plus"></i> Add
											</button>
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
			<div class="col-md-12 hidden"  id="tpacResult">
				<%@ include file="/WEB-INF/jsp/portal/envi/emission_wp_air_tpac_result.jsp"%>
			</div>
			<div class="col-md-12 hidden"  id="tpccResult">
				<%@ include file="/WEB-INF/jsp/portal/envi/emission_wp_air_tpcc_result.jsp"%>
			</div>
			<!-- /.box-footer -->
		</div>

	</section>

</div>

<!-- Modal -->
<div id="wpAirModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
	<div class="modal-dialog modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="modalTitle"></h4>
			</div>
			<form class="form-horizontal" id="formModal" data-toggle="validator" >
				<div class="modal-body">
				
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<label for="paramType" class="col-lg-4 control-label">Company</label>
								<div class="col-lg-6">
									<input type="hidden" name="id" value="" />
									<select class="form-control" name="companyCode" id="companyModal" onchange="changeCompany(this.value)">
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
									<select class="form-control" name="period" required>
										<option value="">${_PLEASE_SELECT}</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
												<option><%= i %></option>
											<% } %>
										
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<label for="paramType" class="col-lg-4 control-label">Parameter</label>
								<div class="col-lg-6">
									<select class="form-control" name="parameterCode" id="parameterModal" required>
									</select>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
						
								<div class="form-group">
								<label for="paramType" class="col-lg-4 control-label">Sampling Point</label>
								<div class="col-lg-6">
									<select class="form-control" name="samplingPoint" id="samplingPointModal" onchange="changeSampling(this.value)">
									</select>
								</div>
							</div>
							
					
						</div>
					</div>
					<legend></legend>
					<div class="form-group">
					
						<label class="col-sm-4 control-label"></label>
						<label class="col-sm-7 control-label"></label>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" id="samplinghead1">TPAC1</label>

						<div class="col-sm-8">
							<label class="col-sm-2 control-label">1st</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling1Frist" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							<label class="col-sm-2 control-label">2nd</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling1Second" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
						</div>
						<label class="col-sm-1 control-label text-left"></label>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"></label>

						<div class="col-sm-8">
							<label class="col-sm-2 control-label">3rd</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling1Third" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							<label class="col-sm-2 control-label">4th</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling1Fourth" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
						</div>
						<label class="col-sm-1 control-label text-left"></label>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" id="samplinghead2">TPAC2</label>

						<div class="col-sm-8">
							<label class="col-sm-2 control-label">1st</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling2Frist" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
		
							<label class="col-sm-2 control-label">2nd</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling2Second" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
						</div>
						<label class="col-sm-1 control-label text-left"></label>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"></label>

						<div class="col-sm-8">
							<label class="col-sm-2 control-label">3rd</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling2Third" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							
							<label class="col-sm-2 control-label">4th</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling2Fourth" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
						</div>
						<label class="col-sm-1 control-label text-left"></label>
					</div>
					<div class="form-group sampling3">
						<label class="col-sm-3 control-label" id="samplinghead3">TPAC3</label>

						<div class="col-sm-8">
							<label class="col-sm-2 control-label">1st</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling3Frist" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							
							<label class="col-sm-2 control-label">2nd</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling3Second" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							
						</div>
						<label class="col-sm-1 control-label text-left"></label>
					</div>
					<div class="form-group sampling3">
						<label class="col-sm-3 control-label"></label>

						<div class="col-sm-8">
							<label class="col-sm-2 control-label">3rd</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling3Third" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							
							<label class="col-sm-2 control-label">4th</label>
							<div class="form-group has-feedback col-md-4">
								<input type="text" class="form-control number" name="sampling3Fourth" >
								<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
								<div class="help-block with-errors"></div>
							</div>
							
						</div>
						<label class="col-sm-1 control-label text-left"></label>
					</div>
			</form>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" onClick="submitModal()" >Save</button>
			</div>
			</div>

		</div>
	</div>
</div>
<div id="successModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"> Success !</h4>
			</div>
			<div class="modal-body">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<div id="alertModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"> Success !</h4>
			</div>
			<div class="modal-body">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var company ;
	var pointTPAC ;
	var pointTPCC ;
	var paramTPAC ;
	var paramTPCC ;
	var T_DATA = [];
	$(document).ready(function() {
		$("#companySearch").empty();
		$("#companyModal").empty();
		
		$('#wpAirModal').on('hidden.bs.modal', function () {
			$("#wpAirModal form").trigger("reset");
			resetModal();
		});
		$.ajax({
            url: cPath+"/workPlaceAir/getSysParam.json",
            data: {param : "COMPANY"},
            type: "POST",
            async: false,
            dataType: 'json',
            success: function (data) { 
            	
            	company = data;
            	var content = ""
            	$.each(data, function(index, val) {
            		if(index == 0){
            			content = "<option value="+val['code']+" SELECTED>"+val['name']+"</option>";
            		}else{
            			content = "<option value="+val['code']+" >"+val['name']+"</option>";
            		}
                    $("#companySearch").append(content);
                    $("#companyModal").append(content);
                });
            }
        });
		
		$.ajax({
            url: cPath+"/workPlaceAir/getSysParam.json",
            data: {param : "WP_AIR_POINT_TPCC"},
            type: "POST",
            async: false,
            dataType: 'json',
            success: function (data) { 
            	pointTPCC = data;
            }
        });
		
		$.ajax({
            url: cPath+"/workPlaceAir/getSysParam.json",
            data: {param : "WP_AIR_PARAM_TPAC"},
            type: "POST",
            async: false,
            dataType: 'json',
            success: function (data) { 
            	paramTPAC = data;
            }
        });
		$.ajax({
            url: cPath+"/workPlaceAir/getSysParam.json",
            data: {param : "WP_AIR_PARAM_TPCC"},
            type: "POST",
            async: false,
            dataType: 'json',
            success: function (data) { 
            	paramTPCC = data;
            }
        });
		$.ajax({
            url: cPath+"/workPlaceAir/getSysParam.json",
            data: {param : "WP_AIR_POINT_TPAC"},
            type: "POST",
            async: false,
            dataType: 'json',
            success: function (data) { 
            	pointTPAC = data;
            	changeCompany("TPAC");
            }
        });
	});
	var requestObj = {
			"companyCode":"",
			"parameterCode":"",
			"periodFrom":"",
			"periodTo":"",
			"samplingPoint":""
	} 
	function clickSearch() {
		requestObj.companyCode = $('select[name=companyname]').val();
		requestObj.periodFrom = $('select[name=periodFrom]').val();
		requestObj.periodTo = $('select[name=periodTo]').val();
	
		if (requestObj.companyCode == "TPAC") {
			$('.plant-title').html("TPAC-Plant");
			$("#tpccResult").addClass("hidden");
			$("#tpacResult").removeClass("hidden");
			
			$("#TPAC_tab_button li").removeClass("active");
			$("#TPAC_tab_button li").first().addClass("active");
			
			$("#TPAC_tab_content div.tab-pane").removeClass("active");
			$("#TPAC_tab_content div#tab_1").addClass("active");
			
			callDataTable('TPAC', 'TSP');
		} else {
			$('.plant-title').html("TPCC-Plant");
			$("#tpacResult").addClass("hidden");
			$("#tpccResult").removeClass("hidden");
			
			$("#TPCC_tab_button li").removeClass("active");
			$("#TPCC_tab_button li").first().addClass("active");
			
			$("#TPCC_tab_content div.tab-pane").removeClass("active");
			$("#TPCC_tab_content div#tpcc_tab_1").addClass("active");
			
			callDataTable('TPCC', 'TSP');
		}
	}
	
	function changeCompany(company){
		$("#samplingPointModal").empty();
		content = "<option value='' SELECTED>${_PLEASE_SELECT}</option>";
		$("#samplingPointModal").append(content);
		
		$("#parameterModal").empty();
		paramContent = "<option value='' SELECTED>${_PLEASE_SELECT}</option>";
		$("#parameterModal").append(paramContent);
		
		$("#samplinghead1").empty();
		$("#samplinghead2").empty();
		$("#samplinghead3").empty();
		if(company == "TPCC"){
			$("#samplinghead1").append("VP!");
			$("#samplinghead2").append("VP2");
			$(".sampling3").addClass("hidden");
			
			$.each(pointTPCC, function(index, val) {
        		if(index == 0){
        			content = "<option value="+val['code']+" >"+val['name']+"</option>";
        		}else{
        			content = "<option value="+val['code']+" >"+val['name']+"</option>";
        		}
                $("#samplingPointModal").append(content);
            });
			
			$.each(paramTPCC, function(index, val) {
        		if(index == 0){
        			paramContent = "<option value="+val['code']+" >"+val['name']+"</option>";
        		}else{
        			paramContent = "<option value="+val['code']+" >"+val['name']+"</option>";
        		}
        		$("#parameterModal").append(paramContent);
            }); 
			
		}else{
			$("#samplinghead1").append("K2T");
			$("#samplinghead2").append("K2U");
			$("#samplinghead3").append("K2w");
			$(".sampling3").removeClass("hidden");
			
			$.each(pointTPAC, function(index, val) {
        		if(index == 0){
        			content = "<option value="+val['code']+" >"+val['name']+"</option>";
        		}else{
        			content = "<option value="+val['code']+" >"+val['name']+"</option>";
        		}
                $("#samplingPointModal").append(content);
            });
			
			$.each(paramTPAC, function(index, val) {
        		if(index == 0){
        			paramContent = "<option value="+val['code']+" >"+val['name']+"</option>";
        		}else{
        			paramContent = "<option value="+val['code']+" >"+val['name']+"</option>";
        		}
        		$("#parameterModal").append(paramContent); 
            });
		
		}
	}
	function changeSampling(val){
		var company = $("#companyModal").val();
		if(company == 'TPAC'){
			if(val == 'TPAC_POINT_PACKING'){
				$(".sampling3").addClass("hidden");
			}else{
				$(".sampling3").removeClass("hidden");
			}
		}
	}
	function openModal(selectid){
		$("*modalTitle").empty();
		if(selectid == ''){
			$("#wpAirModal").modal();
			$("#modalTitle").html("Add");
		}else{
			var	valObj = T_DATA.find((obj, i) => {
			    if (obj.id == selectid) {
			    	return obj;
			    }
			});
			setModal(valObj);
			$("#modalTitle").html("Edit");
			
		}
		$("#wpAirModal").modal('show');
	}
	$('#wpAirModal').on('hidden.bs.modal', function () {
		resetModal();
	});
	function resetModal(){
		$( "input[name='id']" ).val('');
		$( "input[name='sampling1Frist']" ).val('');
		$( "input[name='sampling1Second']" ).val('');
		$( "input[name='sampling1Third']" ).val('');
		$( "input[name='sampling1Fourth']" ).val('');
		
		$( "input[name='sampling2Frist']" ).val('');
		$( "input[name='sampling2Second']" ).val('');
		$( "input[name='sampling2Third']" ).val('');
		$( "input[name='sampling2Fourth']" ).val('');
		
		$( "input[name='sampling3Frist']" ).val('');
		$( "input[name='sampling3Second']" ).val('');
		$( "input[name='sampling3Third']" ).val('');
		$( "input[name='sampling3Fourth']" ).val('');
		
		$( "select[name='samplingPoint']" ).val("");
		$( "select[name='parameterCode']" ).val("");
		$( "select[name='period']" ).val("");
		
		$("select[name='companyCode']").attr('disabled', false);
		$("select[name='samplingPoint']").attr('disabled', false);
		$("select[name='parameterCode']").attr('disabled', false);
		$("select[name='period']").attr('disabled', false);
	}
	function setModal(valObj){
		$( "select[name='companyCode']" ).val(valObj.companyCode);
		changeCompany($( "select[name='companyCode']" ).val());
		$( "select[name='samplingPoint']" ).val(valObj.samplingPoint);
		changeSampling($( "select[name='samplingPoint']" ).val());
		
		$( "select[name='parameterCode']" ).val(valObj.parameterCode);
		$( "select[name='period']" ).val(valObj.period);
		
		
		$( "input[name='id']" ).val(valObj.id);
		$( "input[name='sampling1Frist']" ).val(valObj.sampling1Frist);
		$( "input[name='sampling1Second']" ).val(valObj.sampling1Second);
		$( "input[name='sampling1Third']" ).val(valObj.sampling1Third);
		$( "input[name='sampling1Fourth']" ).val(valObj.sampling1Fourth);
		
		$( "input[name='sampling2Frist']" ).val(valObj.sampling2Frist);
		$( "input[name='sampling2Second']" ).val(valObj.sampling2Second);
		$( "input[name='sampling2Third']" ).val(valObj.sampling2Third);
		$( "input[name='sampling2Fourth']" ).val(valObj.sampling2Fourth);
		
		$( "input[name='sampling3Frist']" ).val(valObj.sampling3Frist);
		$( "input[name='sampling3Second']" ).val(valObj.sampling3Second);
		$( "input[name='sampling3Third']" ).val(valObj.sampling3Third);
		$( "input[name='sampling3Fourth']" ).val(valObj.sampling3Fourth);
		
		
		
		$("select[name='companyCode']").attr('disabled', true);
		$("select[name='samplingPoint']").attr('disabled', true);
		$("select[name='parameterCode']").attr('disabled', true);
		$("select[name='period']").attr('disabled', true);
	}
	function submitModal(){
		var check = false;
		if(! $("select[name=parameterCode]").val() ){
			var ele = $("select[name=parameterCode]").parent(".col-lg-6 ").parent(".form-group");
			ele.addClass("has-error has-danger");
			check = true;
		}
		if(! $('select[name=period]').val() ){
			var ele = $("select[name=period]").parent(".col-lg-6 ").parent(".form-group");
			ele.addClass("has-error has-danger");
			check = true;
		}
		if(! $('select[name=samplingPoint]').val() ){
			var ele = $("select[name=samplingPoint]").parent(".col-lg-6 ").parent(".form-group");
			ele.addClass("has-error has-danger");
			check = true;
		}
		if(check){
			return ;
		}
		
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
				    	var url = cPath+"/workPlaceAir/addAndUpdateData.json";
					    dataRequest = {"id": $("input[name='id']").val()
								, "companyCode": $("select[name=companyCode]").val()
								, "parameterCode": $("select[name=parameterCode]").val()
								, "period":	$('select[name=period]').val()
								, "samplingPoint":	$('select[name=samplingPoint]').val()
								, "sampling1Frist"	: $( "input[name='sampling1Frist']" ).val()
								, "sampling1Second"	: $( "input[name='sampling1Second']" ).val()
								, "sampling1Third"	: $( "input[name='sampling1Third']" ).val()
								, "sampling1Fourth"	: $( "input[name='sampling1Fourth']" ).val()
								, "sampling2Frist"	: $( "input[name='sampling2Frist']" ).val()
								, "sampling2Second"	: $( "input[name='sampling2Second']" ).val()
								, "sampling2Third"	: $( "input[name='sampling2Third']" ).val()
								, "sampling2Fourth"	: $( "input[name='sampling2Fourth']" ).val()
								, "sampling3Frist"	: $( "input[name='sampling3Frist']" ).val()
								, "sampling3Second"	: $( "input[name='sampling3Second']" ).val()
								, "sampling3Third"	: $( "input[name='sampling3Third']" ).val()
								, "sampling3Fourth"	: $( "input[name='sampling3Fourth']" ).val()
						}
					    $.ajax({
					           type: "POST",
					           url: url,
					           data: dataRequest, 
					           success: function(data)
					           {
					        	   if(parseInt(data) == -1){
					        		   bootbox.alert("Duplicate data !");
					        	   }else{
					        		   if(parseInt(data) > 0){
					        			   resetModal();
						        		   clickSearch();
						        	   		$('#wpAirModal').modal('toggle');
						        	   		
// 						        	   		$('#successModal').modal().show();
						       			 $.notify({
												title: "<strong>Success!</strong> ",
												message: " Save successfully"
											});
						           		}
					        	   }
					        	   
					           }
					        });
			    	}// if result
			    }
			});
			
	}
	
	function callDataTable(company , parameterCode){
		T_DATA = [];
		if(company == 'TPAC' &&  parameterCode == 'TSP' ){
			requestObj.parameterCode = parameterCode;
			createtable('#tsp_packing', columnlist1 , "TPAC_POINT_PACKING");
		}
		if(company == 'TPAC' &&  parameterCode == 'BENZENE' ){
			requestObj.parameterCode = parameterCode;
			createtable('#benzenetable_Formalin_Plant', columnlist2, "TPAC_POINT_FORMALIN");
			createtable('#benzenetable_Monomer_Plant', columnlist2, "TPAC_POINT_MONOMER");
			createtable('#benzenetable_Polymer_Plant', columnlist2, "TPAC_POINT_POLYMER");
		}
		if(company == 'TPAC'&&  parameterCode == 'FORMALDEHYDE' ){
			requestObj.parameterCode = parameterCode;
			createtable('#Formaldehyde_Formalin_Plant', columnlist2, "TPAC_POINT_FORMALIN");
			createtable('#Formaldehyde_Monomer_Plant', columnlist2, "TPAC_POINT_MONOMER");
			createtable('#Formaldehyde_Polymer_Plant', columnlist2, "TPAC_POINT_POLYMER");
			createtable('#Formaldehyde_Wast_water', columnlist2, "TPAC_POINT_WASTE_WATER");
		}
		
		
		if(company == 'TPCC' &&  parameterCode == 'TSP' ){
			requestObj.parameterCode = parameterCode;
			createtable('#TSP_Packing_and_Pelletizing', columnlist1 , "TPCC_POINT_PACKING");
		}
		if(company == 'TPCC' &&  parameterCode == 'MC' ){
			requestObj.parameterCode = parameterCode;
			createtable('#MC_P_Stucture', columnlist1 , "TPCC_POINT_P_STUCTURE");
			createtable('#MC_G_Stucture', columnlist1 , "TPCC_POINT_G_STUCTURE");
			createtable('#MC_Polymerization', columnlist1 , "TPCC_POINT_POLYMERIZATION");
		}
		if(company == 'TPCC' &&  parameterCode == 'HE' ){
			requestObj.parameterCode = parameterCode;
			createtable('#HE_G_Stucture', columnlist1 , "TPCC_POINT_G_STUCTURE");
			createtable('#HE_Polymerization', columnlist1 , "TPCC_POINT_POLYMERIZATION");
		}
		if(company == 'TPCC' &&  parameterCode == 'CO' ){
			requestObj.parameterCode = parameterCode;
			createtable('#CO_CG_Process', columnlist1 , "TPCC_POINT_CG_PROCESS");
		}
		if(company == 'TPCC' &&  parameterCode == 'Cl2' ){
			requestObj.parameterCode = parameterCode;
			createtable('#Cl2_CG_Process', columnlist1 , "TPCC_POINT_CG_PROCESS");
		}
		
	}
	function createtable(tableName, columnlist, plantCode){
		requestObj.samplingPoint = plantCode; 
		$(tableName).DataTable( {
			destroy: true,
		    serverSide: false,
		    searching: false,
		    ajax: {
		        url: cPath+"/workPlaceAir/getDataTable.json",
		        data: requestObj,
		        type: "POST",
		        dataSrc: function(result){
		        	T_DATA = $.merge( T_DATA , result.data );
		        	return result.data;
		        }
		    },
		    "columns": columnlist
		
		} );
		
	}
	
	var columnlist1 = [
        { "data": "period" },
        { "data": "sampling1Frist" },
        { "data": "sampling1Second" },
        { "data": "sampling1Third" },
        { "data": "sampling1Fourth" },
        { "data": "sampling2Frist" },
        { "data": "sampling2Second" },
        { "data": "sampling2Third" },
        { "data": "sampling2Fourth" },
        { "data": "id"
	        ,"sWidth": "60px"
	        ,"fnCreatedCell": function (nTd, data) {
	        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" onclick="openModal('+ data +')"> <i class="fa fa-edit"></i> edit </button>';
	            $(nTd).html(txt);
	        } 
        }
    ];
	
	var columnlist2 = [
        { "data": "period" },
        { "data": "sampling1Frist" },
        { "data": "sampling1Second" },
        { "data": "sampling1Third" },
        { "data": "sampling1Fourth" },
        { "data": "sampling2Frist" },
        { "data": "sampling2Second" },
        { "data": "sampling2Third" },
        { "data": "sampling2Fourth" },
        { "data": "sampling3Frist" },
        { "data": "sampling3Second" },
        { "data": "sampling3Third" },
        { "data": "sampling3Fourth" },
        { 
     		"data": "id"
	        ,"sWidth": "60px"
	        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
	        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" onclick="openModal('+ oData.id +')"> <i class="fa fa-edit"></i> edit </button>';
	            $(nTd).html(txt);
	        } 
        }
    ];
</script>