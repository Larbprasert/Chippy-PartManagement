<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp" %>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
<% Random rand = new Random(); %>
<div class="content-wrapper">

	<section class="content-header">
		<h1>
			Utility
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
						<form  class="form-horizontal" >
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-4 control-label">Company</label>
										<div class="col-md-6">
											<select class="form-control" name="companyname" id= "companyname">
													<option value="TPAC" selected>TPAC</option>
													<option value="TPCC">TPCC</option>
											</select>
										</div>
									</div>
								</div><!-- col-md-6 -->
							</div><!-- row -->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-4 control-label">From Year</label>
										<div class="col-md-6">
											<select class="form-control" name="fromYear" id="fromYear">
												<option value = "123" >--- All ---</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
													<option  value = "<%= i %>"><%= i %></option>
												<% } %>
											</select>
										</div>
									</div>
								</div><!-- col-md-6 -->
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-4 control-label">To Year</label>
										<div class="col-md-6">
											<select class="form-control" name="toYear" id="toYear">
												<option value = "123" >--- All ---</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
													<option value = "<%= i %>" ><%= i %></option>
												<% } %>
											</select>
										</div>
									</div>
								</div><!-- col-md-6 -->
							</div><!-- row -->
							<div class="row">
								<div class="col-md-12 text-center">
									<button type="reset" class="btn btn-default" onclick="doClear()"> 
										<i class="fa fa-refresh"></i> Clear </button>&nbsp;&nbsp;
									<button type="button" id="searchBtn" class="btn btn-primary" onclick="doSearch()"><i class="fa fa-search"></i> Search </button>
								</div>
							</div>
						</form>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
		</div>
		<!-- /.row -->
		<div class="row" style="display: none;" id="rs_table">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">CO2 Emission</h3>
					</div>
					<div class="box-body">
						<div class="col-md-12">
							<canvas id="year_tpcc"></canvas>
						</div>
						
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
		</div>
		<!-- /.row -->
	</section>

</div>

<script>
	var jsonObj = {
			"id":"",
			"companyCode":"",
			"fromYear":"",
			"toYear":"",
			"companyName":"",
			"year":""
	}
	var chartLayer;
	var companyLabel = "TPAC";
	var colorArr = ["#1ABC9C","#9B59B6","#2980B9","#27AE60","#DB8034","#2C3E50","#3498DB","#F1C40F","#707B7C","#2ECC71"]
	function loadChart(){
		chartLayer = new Chart($("#year_tpcc"), {
		    type: 'bar',
		    data: {
		      labels: ["Electricity", "Water Consumption", "Steam Consumption"],
		      datasets: [
		      ]
		    },
		    options: {
		      title: {
		        display: true,
		        text: companyLabel
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
	
	
	function doSearch(){
		
		if (chartLayer != null){
			chartLayer.chart.config.data.datasets = [];
			chartLayer.chart.config.data.labels = [];
			chartLayer.update(); 
    	}
		companyLabel = $("#companyname").val();
		jsonObj.companyName= $("#companyname").val();
		jsonObj.fromYear= $("#fromYear").val();
		jsonObj.toYear= $("#toYear").val();
		callChart();
		$("#rs_table").show();
	
	}
 	function doClear(){
		//$("#rs_table").hide();
	}
 	
	var TDATA
	function callChart(){
			$.ajax({
	            url: cPath+"/util/getDataChart",
	           	data:jsonObj
	        }).done(function (parsed) {
	        	loadChart();
            	TDATA = parsed;
            	for(var x in parsed.data){
            		
            		addDataSet(x);
            	} 
	           
	           }).fail(function (jqXHR, textStatus, errorThrown) { 
	                 // needs to implement if it fails
	        }); 
 	}
	
	function addDataSet(x){
		var dataArr = [];
		//console.log("................"+ colorArr[x % 10]);
		dataArr.push(round2Digits(TDATA.data[x].elecCo2TonVal));
		dataArr.push(round2Digits(TDATA.data[x].steamCo2TonVal));
		dataArr.push(round2Digits(TDATA.data[x].waterCo2TonVal));
		var strColor = colorArr[x % 10];
		var newDataset = {
				label: TDATA.data[x].year,
				backgroundColor: strColor,
				borderColor: strColor,
				data: dataArr,
				fill: false
		};
	
 		chartLayer.config.data.datasets.push(newDataset);
		window.chartLayer.update();
	}
    function round2Digits( number ) {
        return Math.round( Math.round( number * 1000 ) / 10 ) / 100;
    };
</script>
