<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp" %>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
<div class="content-wrapper yung" >
	<!-- à¸«à¸±à¸§à¸à¹à¸­         -->
	<section class="content-header">
		<h1>
			<i class="fa fa-industry"></i>&nbsp;&nbsp;WWT
		</h1>
	</section>
	<!--à¸à¹à¸à¸«à¸²  -->
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
										<label for="paramCode" class="col-lg-4 control-label">WWT</label>
										<div class="col-lg-6">
												<select class="form-control" name="wwt_search"
													id="wwt_search">
												</select>
											</div>
									</div>
								</div>
								<div class="col-lg-6">
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label for="paramCode" class="col-lg-4 control-label">Year
											From</label>
										<div class="col-lg-6">
											<select class="form-control" name="periodFrom">
												<option value=""  >--- All ---</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
													<option><%= i %></option>
												<% } %>
											</select>
										</div>
									</div>
								</div>

								<div class="col-lg-6">
									<div class="form-group">
										<label for="paramCode" class="col-lg-4 control-label">To Year</label>
										<div class="col-lg-6">
											<select class="form-control" name="periodTo">
												<option value="" >--- All ---</option>
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
											</button>
											&nbsp;&nbsp;
											<button type="button" class="btn btn-primary"
												onclick='clickSearch()'>
												<i class="fa fa-search"></i> Search 
											</button>
											&nbsp;&nbsp;
											<button type="button"
												class="btn btn-success "
												onclick="openModal('')" >
												<i class="fa fa-plus"></i> Add
											</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!--à¸à¸¥à¸¥à¸±à¸à¸à¹  -->
		<div class="row hidden" id="mainResult">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title" id="box-title" >Result</h3>
					</div>
					<div class="box-body">
						<div class="row">
							<div class="col-md-12" id="table-result">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>


<!-- Modal -->
<div id="wwtModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
	<div class="modal-dialog modal-lg">

		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="modalTitle">WWT</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="form_modal" data-toggle="validator">

					<div class="row">
						
						<div class="col-lg-6">
							<div class="form-group">
								<label for="paramCode" class="col-lg-4 control-label">WWT</label>
								<div class="col-lg-6">
									<select class="form-control" name="wwt_modal" id="wwt_modal" onchange="changeParam(this.value)">
									</select>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<input type="hidden" name="id" value="0" />
						</div>
					</div>


					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<label for="paramCode" class="col-lg-4 control-label">Year </label>
								<div class="col-lg-6">
									<select class="form-control" name="period">
										<option value="">${_PLEASE_SELECT}</option>
										<% for(int i=curr_year;i>=start_year;i--){ %>
											<option value="<%= i %>"><%= i %></option>
										<% } %>
									</select>	
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="form-group">
								<label for="paramCode" class="col-lg-4 control-label">Factory</label>
								<div class="col-lg-6">
									<select class="form-control" name="factory" id="factory">
									</select>
								</div>
							</div>
						</div>
					</div>

					<fieldset>

						<legend>Concrete Pit</legend>

						<div class="row">
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >January</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="jan" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>

							</div>
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >July</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="jul" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >Febuary</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="feb" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>

							</div>
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >August</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="aug" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >March</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="mar" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>

							</div>
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >September</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="sep" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >April</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="apr" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>

							</div>
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >October</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="oct" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >May</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="may" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>

							</div>
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >November</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="nov" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >June</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="jun" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>

							</div>
							<div class=col-md-6>
								<div class="form-group">
									<label class="col-md-4 control-label" >December</label>
									<div class="form-group has-feedback col-md-6">
										<input type="text" class="form-control number" name="dec" >
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
						</div>
					</fieldset>
				</form>

			</div>
			<div class="modal-footer">
				
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" onClick="submitModal()" >Save</button>
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


<script type="text/javascript">
var requestObj = {
		"parameterReq":"",
		"plantReq":"",
		"periodFrom":"",
		"periodTo":"",	
};
var T_DATA = [];
var mainParameter = [{ 	"name":"Temp",
					"plant":["TPAC1", "TPAC2","TPAC3","TPCC1","TPCC2"]
				 },
				 { 	"name":"pH",
					"plant":["TPAC1", "TPAC2","TPAC3","TPCC1","TPCC2"]
				 },
				 { 	"name":"SS",
					"plant":["TPAC1", "TPAC2","TPAC3","TPCC1","TPCC2"]
				 },
				 { 	"name":"TDS",
					"plant":["TPAC1", "TPAC2","TPAC3","TPCC1","TPCC2"]
				 },
				 { 	"name":"BOD",
					"plant":["TPAC1", "TPAC2","TPAC3", "T-918", "TPCC1","TPCC2", "3V-916"]
				 },
				 { 	"name":"COD",
					"plant":["TPAC1", "TPAC2","TPAC3", "TPCC1","TPCC2", "3V-916"]
				 },
				 { 	"name":"OG",
					"plant":["TPAC1", "TPAC2","TPAC3", "TPCC1","TPCC2",]
				 },
				 { 	"name":"TOC",
					"plant":[ "TPCC1","TPCC2",]
				 },
				];
var columnlist = [
    { "data": "period" },
    { "data": "jan" },
    { "data": "feb" },
    { "data": "mar" },
    { "data": "apr" },
    { "data": "may" },
    { "data": "jun" },
    { "data": "jul" },
    { "data": "aug" },
    { "data": "sep" },
    { "data": "oct" },
    { "data": "nov" },
    { "data": "dec" },
    { "data": "id"
     ,"sWidth": "60px"
     ,"fnCreatedCell": function (nTd, data) {
     	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" onclick="openModal('+ data +')"> <i class="fa fa-edit"></i> edit </button>';
         $(nTd).html(txt);
     } 
    }
];
var wwtSearch = $("#wwt_search");
var wwtModal = $("#wwt_modal");

$(document).ready(function() {
	wwtSearch.empty();
	wwtModal.empty();
	$.each(mainParameter, function( index, value ) {
		wwtSearch.append("<option value='"+value.name+"' > "+value.name+" </option>");
		wwtModal.append("<option value='"+value.name+"' > "+value.name+" </option>");
	});
	
	$('#wwtModal').on('hidden.bs.modal', function () {
		$("select[name='wwt_modal']").attr('disabled', false);
		$("select[name='period']").attr('disabled', false);
		$("select[name='factory']").attr('disabled', false);
		$('#form_modal').trigger("reset");
	});
});

function clickSearch() {
	requestObj.parameterReq = $('select[name=wwt_search]').val();
	requestObj.periodFrom = $('select[name=periodFrom]').val();
	requestObj.periodTo = $('select[name=periodTo]').val();
	
	$("#box-title").empty();
	$("#table-result").empty();
	
	$("#box-title").append(requestObj.parameterReq+" Result");
	$("#mainResult").removeClass("hidden");
	$.each(mainParameter, function( index, value ) {
		if(value.name == requestObj.parameterReq ){
			for(var i = 0 ; i < value.plant.length ; i++){
				requestObj.plantReq = value.plant[i];
				createTag(value.plant[i]);
			}
			
			return;
		}
	});
}
function openModal(selectid){
	
	$("#modalTitle").empty();
	if(selectid == ''){
		$("#modalTitle").html("Add");
		$( "select[name='wwt_modal']" ).val("Temp");
		changeParam("Temp");
		$('input[name=id]').val(0);
	}else{
		var	valObj = T_DATA.find((obj, i) => {
		    if (obj.id == selectid) {
		    	return obj;
		    }
		});
		$("select[name='wwt_modal']").attr('disabled', true);
		$("select[name='period']").attr('disabled', true);
		$("select[name='factory']").attr('disabled', true);
		setModal(valObj);
	}
	$("#wwtModal").modal('show');
}
function changeParam(idParam){
	
	$("#factory").empty();
	$("#factory").append("<option value='' >${_PLEASE_SELECT}</option>");
	$.each(mainParameter, function( index, value ) {
		if(value.name == idParam ){
			for(var i = 0 ; i < value.plant.length ; i++){
				$("#factory").append("<option value='"+value.plant[i]+"' >"+value.plant[i]+"</option>");
			}
			return;
		}
	});
}
function setModal(valObj){
		$('input[name=id]').val(valObj.id);
		changeParam(valObj.parameterCode);
		$('select[name=wwt_modal]').val(valObj.parameterCode);
		$('select[name=period]').val(valObj.period);
		$('select[name=factory]').val(valObj.plantCode);
		
		$('input[name=jan]').val(valObj.jan);
		$('input[name=feb]').val(valObj.feb);
		$('input[name=mar]').val(valObj.mar);
		$('input[name=apr]').val(valObj.apr);
		$('input[name=may]').val(valObj.may);
		$('input[name=jun]').val(valObj.jun);
		$('input[name=jul]').val(valObj.jul);
		$('input[name=aug]').val(valObj.aug);
		$('input[name=sep]').val(valObj.sep);
		$('input[name=oct]').val(valObj.oct);
		$('input[name=nov]').val(valObj.nov);
		$('input[name=dec]').val(valObj.dec);
		
}

function submitModal() {
	var check = false;
	if(! $("select[name=wwt_modal]").val() ){
		var ele = $("select[name=wwt_modal]").parent(".col-lg-6 ").parent(".form-group");
		ele.addClass("has-error has-danger");
		check = true;
	}
	if(! $('select[name=period]').val() ){
		var ele = $("select[name=period]").parent(".col-lg-6 ").parent(".form-group");
		ele.addClass("has-error has-danger");
		check = true;
	}
	if(! $('select[name=factory]').val() ){
		var ele = $("select[name=factory]").parent(".col-lg-6 ").parent(".form-group");
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
			    var url = cPath+"/wwt/addAndUpdateData.json";
			    dataRequest = {"id": $("input[name='id']").val()
						, "parameterCode": $("select[name=wwt_modal]").val()
						, "period":	$('select[name=period]').val()
						, "plantCode":	$('select[name=factory]').val()
						, "jan"	: $( "input[name='jan']" ).val()
						, "feb"	: $( "input[name='feb']" ).val()
						, "mar"	: $( "input[name='mar']" ).val()
						, "apr"	: $( "input[name='apr']" ).val()
						, "may"	: $( "input[name='may']" ).val()
						, "jun"	: $( "input[name='jun']" ).val()
						, "jul"	: $( "input[name='jul']" ).val()
						, "aug"	: $( "input[name='aug']" ).val()
						, "sep"	: $( "input[name='sep']" ).val()
						, "oct"	: $( "input[name='oct']" ).val()
						, "nov"	: $( "input[name='nov']" ).val()
						, "dec"	: $( "input[name='dec']" ).val()
				} 
			    $.ajax({
			           type: "POST",
			           url: url,
			           data: dataRequest, 
			           success: function(data)
			           {	if(parseInt(data) == -1){
				    		   bootbox.alert("Duplicate data !");
				    	   }else{
				        	   if(parseInt(data) > 0){
				        		   clickSearch();
				        	   		$('#wwtModal').modal('toggle');
				        	   		
				        			 $.notify({
											title: "<strong>Success!</strong> ",
											message: " Save successfully"
										});
// 				        	   		$('#successModal').modal().show();
				           		}
				    	   }
			           }
			        });
	    	}// if result
	    }
	});

}
function createTag(plantCode){
	var resultHTML = "";
	resultHTML = "<fieldset>"
	resultHTML += "<legend>"+plantCode+"</legend>";
	resultHTML += "<div class='table-responsive '>";
	resultHTML += "<table class='table table-striped table-bordered text-center' id='"+plantCode+"'>";
	resultHTML += "<thead class='bg-green color-palette'><tr>";
	resultHTML += "<th width='8%'>Year</th>";
	resultHTML += "<th width='7%'>January</th>";
	resultHTML += "<th width='7%'>February</th>";
	resultHTML += "<th width='7%'>March</th>";
	resultHTML += "<th width='7%'>April</th>";
	resultHTML += "<th width='7%'>May</th>";
	resultHTML += "<th width='7%'>June</th>";
	resultHTML += "<th width='7%'>July</th>";
	resultHTML += "<th width='7%'>August</th>";
	resultHTML += "<th width='7%'>September</th>";
	resultHTML += "<th width='7%'>October</th>";
	resultHTML += "<th width='7%'>November</th>";
	resultHTML += "<th width='7%'>December</th>";
	resultHTML += "<th width='8%'>Action</th>";
	resultHTML += "</tr></thead><tbody></tbody></table></div></fieldset>";
	$('#table-result').append(resultHTML);
	callDataTable(plantCode);
}

function callDataTable(plantCode){
	T_DATA = [];
	$("#"+plantCode).DataTable( {
		destroy: true,
	    serverSide: false,
	    searching: false,
	    async: false,
	    ajax: {
	        url: cPath+"/wwt/getDataTable.json",
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
</script>