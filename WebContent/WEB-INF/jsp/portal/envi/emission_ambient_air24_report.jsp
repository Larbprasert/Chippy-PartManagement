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
												<select class="form-control" name="companyname"
													id="companyname">
													<option value="TPAC" selected>TPAC</option>
													<option value="TPCC">TPCC</option>
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
											<label for="paramCode" class="col-lg-4 control-label">Period
												From</label>
											<div class="col-lg-6">
												<div class='input-group date' id='periodForm'
													data-date-format="M yyyy">
													<input type='text' class="form-control" /> <span
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
												<div class='input-group date' id='periodTo'
													data-date-format="M yyyy">
													<input type='text' class="form-control" /> <span
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

					<div class="box box-primary" style="display: none;"
						id="resultSearch">
						<div class="box-header with-border">
							<h3 class="box-title">Result</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>

						<div class="box-body">

							<form role="form">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-10">
										<div class="chart">
											<canvas id="tsp_tpac"></canvas>
										</div>
									</div>
									<div class="col-md-1"></div>
								</div>
								<!-- row -->
							</form>
						</div>
						<!-- /.box-body -->
					</div>

					<div class="box box-primary" style="display: none;"
						id="resultSearch2">
						<div class="box-header with-border">
							<h3 class="box-title">Result</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>

						<div class="box-body">

							<form role="form">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-10">
										<div class="chart">
											<canvas id="plant_point"></canvas>
										</div>
									</div>
									<div class="col-md-1"></div>
								</div>
								<!-- row -->
							</form>
						</div>
						<!-- /.box-body -->
					</div>

				</div>

			</div>
			<!-- /.row -->

		</section>

	</div>
</body>

<script type="text/javascript">
	// chart 
	var pFrom = "";
	var pTo = ""; 
	var pPeriod ="";
	var stateTab = "TSP";
	var standard = 0;
	var jsonObj = {
			"id":"",
			"companyName":"",
			"periodFrom":"",
			"periodTo":"",
			"parameter_code":"",
			"period":"",
			"plant_val":"",
			"nongfab_val":"",
			"chkl_val":""
	} 
		var plantArr = [];
		var nongfabArr = [];
		var chklArr = [];
		var periodArr = [];
	    // chart 
	    var chartFacLayer;
	    var chartBanLayer;
	    var chartLable;
	    
	function crateChart(){
		chartBanLayer = new Chart(document.getElementById("tsp_tpac"), {
			type : 'line',
			data : {
				labels : periodArr,
				datasets : [
						{
							fill : false,
							label : "โรงเรียนบ้านหนองแฟบ",
							borderColor : "#16A085",
							backgroundColor : "#16A085",
							data : nongfabArr
						},
						{
							fill : false,
							label : "ชุมชนบ้านชากกลาง",
							borderColor : "#F39C12",
							backgroundColor : "#F39C12",
							data : chklArr
						} ]
			},
			options : {
				title : {
					display : true,
					text : this.chartLable
				}, annotation: {
                    annotations: [{
                        type: 'line',
                        mode: 'horizontal',
                        scaleID: 'y-axis-0',
                        value: standard,
                        borderColor: "#E74C3C",
                        borderWidth: 2,
                        borderDash: [5, 5],
                        label: {
                            enabled: true,
                           	content: standard,
                           	position : "right",
                           	//backgroundColor: "rgba(97, 106, 107, 0)",
                        }
                    }]
                }
			}
		});

		chartFacLayer = new Chart(document.getElementById("plant_point"), {
			type : 'line',
			data : {
				labels : periodArr,
				datasets : [ {
					fill : false,
					label : "พื้นที่โรงงาน",
					borderColor : "#16A085",
					backgroundColor : "#16A085",
					data :plantArr
				} ]
			},
			options : {
				title : {
					display : true,
					text : this.chartLable
				} , annotation: {
                    annotations: [{
                        type: 'line',
                        mode: 'horizontal',
                        scaleID: 'y-axis-0',
                        value: standard,
                        borderColor: "#E74C3C",
                        borderWidth: 2,
                        borderDash: [5, 5],
                        label: {
                            enabled: true,
                           	content: standard,
                           	position : "right",
                           	//backgroundColor: "rgba(97, 106, 107, 0)",
                        }
                    }]
                }
			}
		});
	}
	
	function clickSearch() {
		$("#resultSearch").show();
		$("#resultSearch2").show();
		
    	plantArr = [];
    	nongfabArr = [];
    	chklArr = [];
    	periodArr = [];
    	if (chartFacLayer != null){
    		chartBanLayer.chart.config.data.datasets = [];
    		chartBanLayer.chart.config.data.labels = [];
    		chartBanLayer.chart.config.options.annotation.annotations[0].label.content = 0 ;
    		chartBanLayer.chart.config.options.annotation.annotations[0].value = 0 ;
    		chartBanLayer.update(); 
    	}
		var companyName = $('#companyname').val();
		if (companyName == 'TPAC'){
			this.chartLable = 'Benzene';
			jsonObj.parameter_code = 'BENZEN';
			standard = ${AMB_AIR_BENZEN};
		}else{
			this.chartLable = 'Methylene Chlorides';
			jsonObj.parameter_code = 'METHYL';
			standard = ${AMB_AIR_METCHL};
		}
		jsonObj.companyName = $("#companyname").val();
		jsonObj.periodFrom = pFrom;
		jsonObj.periodTo = pTo;
		callChart();

	}	
	var TDATA;
	function callChart(){
		$.ajax({
            url: cPath+"/ambientAir24/getDataChart",
           	//data: $('#myForm').serialize()
           	data:jsonObj
        }).done(function (parsed) {
        	TDATA = parsed;
        	//var parsed = JSON.parse(result);
        	for(var x in parsed.data){
        		periodArr.push(monthYearFormat(parsed.data[x].period));
        		plantArr.push(parsed.data[x].plant_val);
        		nongfabArr.push(parsed.data[x].nongfab_val);
        		chklArr.push(parsed.data[x].chkl_val);
        	}
        	crateChart();
        	chartBanLayer.chart.config.options.annotation.annotations[0].label.content = standard ;
        	chartBanLayer.chart.config.options.annotation.annotations[0].value = standard ;
        	console.log("VAL: "+standard);
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
        }); 
	}
	
	
	function resetSearch(){
			$('#dateFrom,#periodTo').datepicker('destroy');
			pTo ="";
			pFrom ="";
	}
    function monthYearFormat(data){
    	var month = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
		var year = data.slice(0, 4);
		var mm = parseInt(data.slice(4, 6));
		return  month[mm-1] + " " + year
    }
	function getMonth(date) {
		var month = date + 1;
		return month < 10 ? '0' + month : '' + month;
	} 
	$('#periodForm,#periodTo').datepicker({
		fmrmat : "M yyyy",
		viewMode : "months",
		minViewMode : "months",
		autoclose:true,
		enableOnReadonly:true
	});
	$('#periodForm').on('changeDate', function(e) {
		var from  = e.date.getFullYear()+""+getMonth(e.date.getMonth())
		pFrom = from
		$('#periodTo').datepicker('setStartDate', e.date);
		
	});
	$("#periodTo").on("changeDate", function(e) {
		var to  = e.date.getFullYear()+""+getMonth(e.date.getMonth())
		pTo = to
		$('#periodForm').datepicker('setEndDate', e.date);
	});
</script>