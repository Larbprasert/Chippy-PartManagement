<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
<div class="content-wrapper">
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
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
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




<script type="text/javascript">
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
var wwtSearch = $("#wwt_search");
var requestObj = {
		"parameterReq":"",
		"plantReq":"",
		"periodFrom":"",
		"periodTo":"",	
};
$(document).ready(function() {
	wwtSearch.empty();
	$.each(mainParameter, function( index, value ) {
		wwtSearch.append("<option value='"+value.name+"' > "+value.name+" </option>");
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
function createTag(plantCode){
	var resultHTML = "";
	resultHTML = "<fieldset>"
	resultHTML += "<legend>"+plantCode+"</legend>";
	resultHTML += "<div  id='"+plantCode+"' >";
	resultHTML += "<canvas></canvas>";
	resultHTML += "</div></fieldset>";
	$('#table-result').append(resultHTML);
	callData(plantCode);
}
function callData(plantCode){
	var color = ["#3b5998", "#55acee", "#dd4b39", "#00c300", "#f39c12"];
	var reportData = $.ajax({
        url: cPath+"/wwt/getDataTable.json",
        data: requestObj,
        type: "POST",
        async: false,
        dataType: 'json',
        success: function (data) { 
				return data; 
        }
    });
	
	var setVal;
	
	var monthlabel = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ];
	var dataset = new Array();
	var i = 0;
	reportData.responseJSON.data.forEach(function (obj)
    {	if(i<5){
			setVal = new Array();
			//yearlabel.push(obj.period);
	    	setVal.push(obj.jan);
	    	setVal.push(obj.feb);
	    	setVal.push(obj.mar);
	    	setVal.push(obj.apr);
			
	    	setVal.push(obj.may);
	    	setVal.push(obj.jun);
	    	setVal.push(obj.jul);
	    	setVal.push(obj.aug);
			
	    	setVal.push(obj.sep);
	    	setVal.push(obj.oct);
	    	setVal.push(obj.nov);
	    	setVal.push(obj.dec);
	    	
	    	dataset.push({
		      	label: obj.period,
		      	fill: false,
		      	borderColor : color[i],
		      	data: setVal
		    });
    		i++;
    	}
    	
    });
	
	createGraph(plantCode, dataset , monthlabel );
}

function createGraph(canvasId, dataset, monthlabel){
	$("#"+canvasId).empty();
	$("#"+canvasId).append("<canvas></canvas>");
	new Chart($("#"+canvasId+" canvas"), {
	    type: 'line',
	    data: {
	      labels: monthlabel,
	      datasets: dataset
	    },
	    options: {
	      title: {
	        display: true,
	        text: canvasId
	      }
	    }
	});
}
</script>
