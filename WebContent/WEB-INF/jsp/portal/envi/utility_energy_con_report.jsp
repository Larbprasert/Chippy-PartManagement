<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp" %>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
<div class="content-wrapper">

	<section class="content-header">
		<h1>
			Consumption Report
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
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-4 control-label">Year</label>
										<div class="col-md-6">
											<select class="form-control" name="year" id="year" >
												<% for(int i=curr_year;i>=start_year;i--){ %>
													<option value= "<%= i %>" ><%= i %></option>
												<% } %> 
											</select>
										</div>
									</div>
								</div><!-- col-md-6 -->					
							</div><!-- row -->
							<div class="row">
								<div class="col-md-12 text-center">
									<button type="reset" class="btn btn-default" onclick="doClear()"> 
										<i class="fa fa-refresh"></i> Clear 
									</button>&nbsp;&nbsp;
									<button type="button" id="searchBtn" class="btn btn-primary" onclick="doSearch()">
										<i class="fa fa-search"></i> Search 
									</button>
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
						<h3 class="box-title">Consumption</h3>
					</div>
					<div class="box-body text-center">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<canvas id="rs-graph" height="250"></canvas>
						</div>
						<div class="col-md-3"></div>
						
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
		"companyCode":"",
		"companyName":"",
		"year":""
	}
	var chartLayer;
	
	function loadChart(){
		chartLayer = new Chart($("#rs-graph"), {
			   type: 'pie',
			    data: {
			    	 labels: [ "Electricity", "Water Consumption", "Steam Consumption" ],
			         datasets: [{
			           label: "Consumption",
			           backgroundColor: [ "#8e5ea2","#3cba9f","#e8c3b9" ],
			           data: dataArr
			        }
			      ]
			    },
			    options: {
			      title: {
			        display: true,
			         text: '[ Company : '+companyLabel+' ]  [ Year : '+yearLabel+' ]'
			      }
			    }
		});
	}
	var TDATA
	var dataArr = [];
	function callChart(){
		$.ajax({
            url: cPath+"/util/getDataChart",
           	data:jsonObj
        }).done(function (parsed) {
        	//loadChart();
        	TDATA = parsed;
        	for(var x in parsed.data){
        		if (x == 0 ){
        			var product =  TDATA.data[x].productVal;
        			var steamVal = TDATA.data[x].steamConVal/product;
        			var electVal = TDATA.data[x].elecConVal/product;
        			var waterVal = TDATA.data[x].waterConVal/product;
        			var sum = steamVal + electVal + waterVal;
        			//console.log ("steamVal : "+steamVal +" electVal : "+electVal+ " waterVal: "+ waterVal);
        			
        			dataArr.push(round2Digits((electVal/sum)*100));
        			dataArr.push(round2Digits((steamVal/sum)*100));
        			dataArr.push(round2Digits((waterVal/sum)*100));
        		}
        	} 
        	loadChart();
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
        }); 
	}



	function doSearch(){
		if (chartLayer != null){
			chartLayer.chart.config.data.datasets[0].data = [];
			chartLayer.chart.config.data.labels = [];
			chartLayer.update(); 
    	}
		dataArr = [];
		companyLabel = $("#companyname").val();
		yearLabel =  $("#year").val();
		jsonObj.companyName= $("#companyname").val();
		jsonObj.year= $("#year").val();
		callChart();
		$("#rs_table").show();
	}
 	function doClear(){
		//$("#rs_table").hide();
	}
    function round2Digits( number ) {
        return Math.round( Math.round( number * 1000 ) / 10 ) / 100;
    };
	
</script>