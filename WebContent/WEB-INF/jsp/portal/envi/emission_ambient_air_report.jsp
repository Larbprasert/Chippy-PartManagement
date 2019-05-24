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
                        <h3 class="box-title">Report</h3>
                    </div>
                    <div class="box-body">

                        <form class="form-horizontal" id="myForm" commandname="sysParam" method="post">
                        
						<div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="paramType" class="col-lg-4 control-label">Company</label>
                                    <div class="col-lg-6">
                                        <select class="form-control" name="companyName" id="companyName" onchange="comChange()">
<!--                                             <option value="TPAC" selected>TPAC</option> -->
<!--                                             <option value="TPCC">TPCC</option> -->
											<c:forEach var="ls" items="${LOV_COMPANY}">
					                       	 	<option value="${ls.code}" ${ls.descTH == sysParam.companyName ? 'selected="selected"' : ''}>${ls.descTH}</option>
										    </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="paramType" class="col-lg-4 control-label">Parameter</label>
                                    <div class="col-lg-6">
                                        <select class="form-control"  id="paramTPAC">
                                            <option value="TSP">TSP</option>
                                            <option value="SOx">SOx</option>
                                            <option value="SOx24">SO<sub>x</sub> 24(HR)</option>
                                            <option value="NOx">NO<sub>x</sub></option>
                                            <option value="FORMAL">Formalin</option>
                                        </select>
									 <select class="form-control"  id="paramTPCC" style="display:none;">
                                            <option value="CO2" >CO<sub>2</sub></option>
                                            <option value="NOx">NOx</option>
                                        </select>
                                    </div>
                                </div>
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
                                                <i class="fa fa-refresh"></i> Clear
                                            </button>&nbsp;&nbsp;
                                            <button type="button" id="searchBtn" class="btn btn-primary" onclick='clickSearch()'><i class="fa fa-search"></i> Search
                                            </button>&nbsp;&nbsp;
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

                <div class="box box-primary" id="reportResult" style="display: none;">
                    <div class="box-header with-border">
                        <h3 class="box-title">Result</h3>
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

            </div>

        </div>
        <!-- /.row -->

    </section>

</div>
</body>

<script>
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
		"plant_max":"",
		"plant_min":"",
		"nongfab_max":"",
		"nongfab_min":"",
		"chkl_max":"",
		"chkl_min":""
} 
	var plantArr = [];
	var nongfabArr = [];
	var chklArr = [];
	var periodArr = [];
    // chart 
    var chartLayer;
    var chartLable;
    function loadChart(){
    	chartLayer = new Chart(document.getElementById("tsp_tpac"), {
            type: 'bar',
            data: {
                labels: periodArr,
                datasets: [
                    {
                        label: "โรงงาน",
                        backgroundColor: "#3498DB",
                        data: plantArr
                    }, {
                        label: "โรงเรียนบ้านหนองแฟบ",
                        backgroundColor: "#16A085",
                        data: nongfabArr
                    }, {
                        label: "ชุมชนบ้านชากกลาง",
                        backgroundColor: "#F39C12",
                        data: chklArr
                    }
                ]
            },
            options: {
                title: {
                    display: true,
                    text: this.chartLable
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

                        this.data.datasets.forEach(function (dataset) {
                            for (var i = 0; i < dataset.data.length; i++) {
                                for (var key in dataset._meta) {
                                    var model = dataset._meta[key].data[i]._model;
                                    var dataval = dataset.data[i];
                                    var lb = dataval;
                                    if (dataval > 0) {
                                        ctx.fillText(lb, model.x, model.y);
                                    }
                                }
                            }
                        });
                    }
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
    }
    
    ///

    function clickSearch() {
    	plantArr = [];
    	nongfabArr = [];
    	chklArr = [];
    	periodArr = [];
    	if (chartLayer != null){
        	chartLayer.chart.config.data.datasets = [];
        	chartLayer.chart.config.data.labels = [];
        	chartLayer.chart.config.options.annotation.annotations[0].label.content = 0 ;
        	chartLayer.chart.config.options.annotation.annotations[0].value = 0 ;
        	chartLayer.update(); 
    	}
    	
		jsonObj.companyName = $("#companyName").val();
		jsonObj.periodFrom = pFrom;
		jsonObj.periodTo = pTo;
		if("TPCC"==$('#companyName').val()){
			chartLable = $("#paramTPCC option:selected").text();
			jsonObj.parameter_code = $("#paramTPCC").val();
			//console.log("paramname:"+jsonObj.parameter_code);
		}else{
			chartLable = $("#paramTPAC option:selected").text();
			jsonObj.parameter_code = $("#paramTPAC").val();
			//console.log("paramname:"+jsonObj.parameter_code);
			checkSTD($("#paramTPAC").val());
		}
		callChart();
        $("#reportResult").show();

    }
	function resetSearch(){
 			$('#dateFrom,#dateTo').datepicker('destroy');
 			pTo ="";
 			pFrom ="";
 	}
    
	function comChange(p) {
		if("TPCC"==$('#companyName').val()){
			$("#paramTPCC").show();
			$("#paramTPAC").hide();
		}else{
			$("#paramTPAC").show();
			$("#paramTPCC").hide();
		}
	}
	var TDATA
	function callChart(){
			$.ajax({
	            url: cPath+"/ambientAir/getDataChart",
	           	//data: $('#myForm').serialize()
	           	data:jsonObj
	        }).done(function (parsed) {
            	TDATA = parsed;
            	//var parsed = JSON.parse(result);
            	for(var x in parsed.data){
            		periodArr.push(monthYearFormat(parsed.data[x].period));
            		plantArr.push(parsed.data[x].plant_max);
            		nongfabArr.push(parsed.data[x].nongfab_max);
            		chklArr.push(parsed.data[x].chkl_max);
            	}
	            loadChart();
	        	chartLayer.chart.config.options.annotation.annotations[0].label.content = standard ;
	        	chartLayer.chart.config.options.annotation.annotations[0].value = standard ;
	        	console.log("VAL: "+standard);
	           }).fail(function (jqXHR, textStatus, errorThrown) { 
	                 // needs to implement if it fails
	        }); 
 	}
	// receive format yyyymm convert to MM yyyy
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
	function checkSTD(value){
		console.log("STD: "+value);
		if(value =="TSP"){
			standard = ${AMB_AIR_TSP};
		}if(value =="NOx"){
			standard = ${AMB_AIR_NOX};
		}if(value =="SOx"|| value == "SOx24"){
			standard = ${AMB_AIR_SOX};
		}if(value =="FORMAL"){
			standard = ${AMB_AIR_FORMAL};
		}if(value =="CO"){
			standard = ${AMB_AIR_CO};
		}
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