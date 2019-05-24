<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp" %>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
<div class="content-wrapper">

	<section class="content-header">
		<h1>
			<i class="fa fa-industry"></i>&nbsp;&nbsp;Workplace Noise Report
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
										<select class="form-control" name="companyname" id="companyname">
											<option value="TPAC" selected>TPAC</option>
											<option value="TPCC">TPCC</option>
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
											<select class="form-control" name=periodFrom>
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
											<button type="button" class="btn btn-success"  onClick="openModal('')">
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
			<div class="col-md-12 hidden" id="tpacResult">
				<%@ include file="/WEB-INF/jsp/portal/envi/emission_wp_noise_tpac_report.jsp"%>
			</div>
			<div class="col-md-12 hidden" id="tpccResult">
				<%@ include file="/WEB-INF/jsp/portal/envi/emission_wp_noise_tpcc_report.jsp"%>
			</div>
			<!-- /.box-footer -->
		</div>

	</section>

</div>
<script type="text/javascript">
var T_DATA = [];
var pointTPAC;
var pointTPCC;
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
		
		callData('TPAC', 'NOISE_POINT_TPAC_PACKING' , [1, 1, 0]);
	} else {
		$('.plant-title').html("TPCC-Plant");
		$("#tpacResult").addClass("hidden");
		$("#tpccResult").removeClass("hidden");
		
		$("#TPCC_tab_button li").removeClass("active");
		$("#TPCC_tab_button li").first().addClass("active");
		
		$("#TPCC_tab_content div.tab-pane").removeClass("active");
		$("#TPCC_tab_content div#tpcc_tab_1").addClass("active");
		
		callData('TPCC', 'NOISE_POINT_TPCC_CCR_VP1' , [1, 0, 0] );
	}
}
function callData(company, sampling, columnSize){
	requestObj.samplingPoint = sampling;
	T_DATA = [];
	var reportData = $.ajax({
        url: cPath+"/workPlaceNoise/getDataTable.json",
        data: requestObj,
        type: "POST",
        async: false,
        dataType: 'json',
        success: function (data) { 
				return data; 
        }
    }); 
	
	var yearlabel = [];
	var sampling1Frist = [];
	var sampling1Second = [];
	var sampling1Third = [];
	var sampling1Fourth = [];
	
	var sampling2Frist = [];
	var sampling2Second = [];
	var sampling2Third = [];
	var sampling2Fourth = [];
	
	var sampling3Frist = [];
	var sampling3Second = [];
	var sampling3Third = [];
	var sampling3Fourth = [];

	reportData.responseJSON.data.forEach(function (obj)
    {	yearlabel.push(obj.period);
        sampling1Frist.push(obj.sampling1Frist);
		sampling1Second.push(obj.sampling1Second);
		sampling1Third.push(obj.sampling1Third);
		sampling1Fourth.push(obj.sampling1Fourth);
		
		sampling2Frist.push(obj.sampling2Frist);
		sampling2Second.push(obj.sampling2Second);
		sampling2Third.push(obj.sampling2Third);
		sampling2Fourth.push(obj.sampling2Fourth);
		
		sampling3Frist.push(obj.sampling3Frist);
		sampling3Second.push(obj.sampling3Second);
		sampling3Third.push(obj.sampling3Third);
		sampling3Fourth.push(obj.sampling3Fourth);
    });
	
	var dataset; 
	if(columnSize[0] == 1 ){
		dataset =  new Array();
		dataset.push({
	          	label: "1st",
 	          	backgroundColor: "#3b5998",
	          	data: sampling1Frist
	        });
		dataset.push({
				label: "2nd",
	          	backgroundColor: "#55acee",
	          	data: sampling1Second
	        });
		dataset.push({
				label: "3rd",
	          	backgroundColor: "#dd4b39",
	          	data: sampling1Third
	        });
		dataset.push({
				label: "4th",
	          	backgroundColor: "#00c300",
	          	data: sampling1Fourth
	        });
		createGraph(sampling.toLowerCase()+"_1", dataset, yearlabel, company+"1" );
	}
	if(columnSize[1] == 1){
		dataset =  new Array();
		dataset.push({
	          	label: "1st",
 	          	backgroundColor: "#3b5998",
	          	data: sampling2Frist
	        });
		dataset.push({
				label: "2nd",
	          	backgroundColor: "#55acee",
	          	data: sampling2Second
	        });
		dataset.push({
				label: "3rd",
	          	backgroundColor: "#dd4b39",
	          	data: sampling2Third
	        });
		dataset.push({
				label: "4th",
	          	backgroundColor: "#00c300",
	          	data: sampling2Fourth
	        });
		createGraph(sampling.toLowerCase()+"_2", dataset, yearlabel, company+"2");
	}
	if(columnSize[2] == 1){
		dataset =  new Array();
		dataset.push({
	          	label: "1st",
 	          	backgroundColor: "#3b5998",
	          	data: sampling3Frist
	        });
		dataset.push({
				label: "2nd",
	          	backgroundColor: "#55acee",
	          	data: sampling3Second
	        });
		dataset.push({
				label: "3rd",
	          	backgroundColor: "#dd4b39",
	          	data: sampling3Third
	        });
		dataset.push({
				label: "4th",
	          	backgroundColor: "#00c300",
	          	data: sampling3Fourth
	        });
		createGraph(sampling.toLowerCase()+"_3", dataset, yearlabel, company+"3");
	}

}
function createGraph(canvasId, dataset, yearlabel, company){
	$("#"+canvasId).empty();
	$("#"+canvasId).append("<canvas></canvas>");
	new Chart($("#"+canvasId+" canvas"), {
	    type: 'bar',
	    data: {
	      labels: yearlabel,
	      datasets: dataset
	    },
	    options: {
	      title: {
	        display: true,
	        text: company
	      },
	      animation: {
			    onComplete: function () {
			        var ctx = this.chart.ctx;
			        var fontSize = 10;
	                var fontStyle = 'bold';
	                var fontFamily = Chart.defaults.global.defaultFontFamily;
                  ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
			        ctx.fillStyle = "black";
			        ctx.textAlign = 'center';
			        ctx.textBaseline = 'bottom';
			
			        this.data.datasets.forEach(function (dataset)
			        {
			            for (var i = 0; i < dataset.data.length; i++) {
			                for(var key in dataset._meta)
			                {
			                    var model = dataset._meta[key].data[i]._model;
			                    var dataval = dataset.data[i];
			                    var lb =  dataval;
			                    if(dataval>0){
			                    	ctx.fillText(lb, model.x, model.y);
			                    }
			                }
			            }
			        });
			    }
			}
	    }
	});
}
</script>