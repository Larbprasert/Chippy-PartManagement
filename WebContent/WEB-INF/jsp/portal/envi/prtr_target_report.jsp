<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp" %>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
<div class="content-wrapper">

	<section class="content-header">
		<h1>
			PRTR Emission Total
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
											<select class="form-control" name="yearFrom">
												<option>--- All ---</option>
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
											<select class="form-control" name="yearTo">
												<option>--- All ---</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
												<option><%= i %></option>
											<% } %>
											</select>
										</div>
									</div>
								</div> 
							</div> 
							
							<div class="row">
								<div class="col-md-12 text-center">
									<button type="reset" class="btn btn-default" onclick="doClear()"> 
										<i class="fa fa-refresh"></i> Clear </button>&nbsp;&nbsp;
									<button type="button" id="searchBtn" class="btn btn-primary" onclick="doSearch()">
										<i class="fa fa-search"></i> Search </button>
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
						<h3 class="box-title">Emission volum </h3>
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
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Transport volum </h3>
					</div>
					<div class="box-body">
						<div class="col-md-12">
							<canvas id="tran-g"></canvas>
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
	new Chart($("#year_tpcc"), {
	    type: 'line',
	    data: { 
		    	  labels: ["2015","2016","2017","2018"],
// 		    	  labels: ["Methanol","Toluene","Ethylene Glycol","Formaldehyde","Phosphoric acid","Benzene","NOx"],
			      datasets: [
			        {
			          label: "2015",
// 			          backgroundColor: "#f56954",
			          data: [ 20799.12,22999.12,21500.12,20205.12]
			        } 
// 			        ,{
// 			          label: "2016",
// 			          backgroundColor: "#00a65a",
// 			          data: [ 20799.12,1.23, 2.28,159.99,0.00,11.30, 3253.45]
// 			        } 
// 			        ,{
// 			          label: "2017",
// 			          backgroundColor: "#f39c12",
// 			          data: [ 20799.12,1.23, 2.28,159.99,0.00,11.30, 3253.45]
// 			        } 
// 			        ,{
// 			          label: "2018",
// 			          backgroundColor: "#A0AZ0Z",
// 			          data: [ 20799.12,1.23, 2.28,159.99,0.00,11.30, 3253.45]
// 			        }
		      ]
	    },
	    options: {
	      title: {
// 	        display: false
// 	        text: 'CO2 Emission (TPAC)'
	      },
// 	      animation: {
// 			    onComplete: function () {
// 			        var ctx = this.chart.ctx;
// 			        var fontSize = 10;
// 	                var fontStyle = 'bold';
// 	                var fontFamily = Chart.defaults.global.defaultFontFamily;
//                   ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
// 			        ctx.fillStyle = "black";
// 			        ctx.textAlign = 'center';
// 			        ctx.textBaseline = 'bottom';
			
// 			        this.data.datasets.forEach(function (dataset)
// 			        {
// 			            for (var i = 0; i < dataset.data.length; i++) {
// 			                for(var key in dataset._meta)
// 			                {
// 			                    var model = dataset._meta[key].data[i]._model;
// 			                    var dataval = dataset.data[i];
// 			                    var lb =  dataval;
// 			                    if(dataval>0){
// 			                    	ctx.fillText(lb, model.x, model.y);
// 			                    }
// 			                }
// 			            }
// 			        });
// 			    }
// 			}
	    }
	});

	new Chart($("#tran-g"), {
	    type: 'bar',
	    data: {
	      labels: ["Methanol", "Toluene", "Ethylene Glycol"],
	      datasets: [
	        {
	          label: "2015",
	          backgroundColor: "#f56954",
	          data: [133,221,783]
	        }, {
	          label: "2016",
	          backgroundColor: "#00a65a",
	          data: [408,547,675]
	        }, {
	          label: "2017",
	          backgroundColor: "#f39c12",
	          data: [433,457,755]
	        }, {
	          label: "2018",
	          backgroundColor: "#3c8dbc",
	          data: [323,347,654]
	        }
	      ]
	    },
	    options: {
	      title: {
	        display: false
// 	        text: 'CO2 Emission (TPAC)'
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

	function doSearch(){
		$("#rs_table").show();
	}
 	function doClear(){
		$("#rs_table").hide();
	}
 	
 	
	
</script>