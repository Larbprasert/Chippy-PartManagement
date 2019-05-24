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
            <i class="fa fa-industry"></i>&nbsp;&nbsp;Stack Result
        </h1>
    </section>
    
    <c:forEach var="ls" items="${EMISSION_STACK}">
     	<input type="hidden" id="${ls.paramCode}" name="${ls.paramCode}" value="${ls.value_2}">
	</c:forEach>
	
	<c:forEach var="ls" items="${STACK_NO}">
     	<input type="hidden" id="${ls.paramId}" name="${ls.paramId}" value="${ls.value_2}">
	</c:forEach>
	
	<%-- <c:forEach var="ls" items="${EMISSION_STD}">
     	<input type="hidden" id="${ls.paramCode}" name="${ls.paramCode}" value="${ls.value_1}">
	</c:forEach> --%>

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
                                        <select class="form-control" name="companyname" id="companyname" onchange="comChange()">
                                            <option value="TPAC" selected>TPAC</option>
                                            <option value="TPCC">TPCC</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="paramType" class="col-lg-4 control-label">Parameter</label>
                                    <div class="col-lg-6">
                                        <select class="form-control" name="param_tpac" id="param_tpac" onchange="changeParam(this.value)">
                                            <option value="TSP" selected >TSP</option>
                                            <option value="NOX" >NOx</option>
                                            <option value="BENZEN" >Benzen</option>
                                            <option value="FORMAL" >Formalin</option>
                                        </select>
                                        <select class="form-control hidden" name="param_tpcc" id="param_tpcc" onchange="changeParam(this.value)">
                                            <option value="MC" selected>MC</option>
                                            <option value="HE" >HE</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="row" style="display: none;">
                            	<div class="col-lg-6">
                                <div class="form-group">
                                    <label for="paramCode" class="col-lg-4 control-label">Stack</label>
                                    <div class="col-lg-6">
                                       <select class="form-control" name="stack_No" id ="stack_No">
											<option value="123">กรุณาเลือก</option>
										</select>
                                    </div>
                                </div>
                            	</div>
                            </div>

							<div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="paramCode" class="col-lg-4 control-label">From Year</label>
                                    <div class="col-lg-6">
                                       <select class="form-control" name="yearFrom" id ="yearFrom">
                                       			<option value="123" >--- All ---</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
													<option value="<%= i %>" ><%= i %></option>
												<% } %>
										</select>
                                    </div>

                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="paramCode" class="col-lg-4 control-label">To Year</label>
                                    <div class="col-lg-6">
                                        <select class="form-control" name="yearTo" id ="yearTo">
                                        		<option value="123"  >--- All ---</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
													<option value="<%= i %>" ><%= i %></option>
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
                                            <button type="reset" class="btn btn-default"> &nbsp;
                                                <i class="fa fa-refresh"></i> Clear
                                            </button>&nbsp;&nbsp;
                                            <button type="button" id="searchBtn" class="btn btn-primary" onclick='clickSearch()'>
                                                <i class="fa fa-search"></i> Search
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
		<div id="stackReport">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary" id="reportResult" style="display: none;">
                    <div class="box-header with-border">
                        <h3 class="box-title" id="label1">Result</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove">
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
                                        <canvas id="mc_1"></canvas>
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
            
            <div class="col-md-6">
                <div class="box box-primary" id="reportResult2" style="display: none;">
                    <div class="box-header with-border">
                        <h3 class="box-title"id="label2">Result</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove">
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
                                        <canvas id="mc_2"></canvas>
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
        </div>
<!--         <div class="row">
            <div class="col-md-12">
                
            </div>
        </div> -->


        </div>

    </section>
</div>

</body>
<script >
    // chart 
    var jsonObj = {
			"id":"",
			"companyName":"",
			"companyCode":"",
			"yearFrom":"",
			"yearTo":"",
			"parameter_code":"",
			"year":"",
			"o2_1st":"",
			"o2_2nd":"",
			"emission_1st":"",
			"emission_2nd":"",
			"stackNo":""
	} 
    
    var chartLayer1;
    var chartLayer2;
    var labelChart1;
    var labelChart2;
    
	var stackArr  = [];
	
    var o2Arr_1 = [];
    var o2Arr_2 = [];
    var emissionArr_1 = [];
    var emissionArr_2 = [];
    var period = [];
    
    
    function createChart(stack,index){
    	stack = stack.replace( /\s/g, '')
    	var step1 = 0;
    	var max1 = 0
        var maxarr1 = Math.max.apply(Math,getLocalDatao2_1(index));
    	chartLayer1  = new Chart(document.getElementById("mc_"+stack), {
            type: 'bar',
            data: {
                labels: getLocalDataPeriod(index),
                datasets: [
                    {
                        label: "1st",
                        backgroundColor: "#229954",
                        data: getLocalDatao2_1(index)
                    }, {
                        label: "2nd",
                        backgroundColor: "#3498DB",
                        data: getLocalDatao2_2(index)
                    }
                ]
            },
            options: {
                title: {
                    display: true,
                    text: stack+" O2"
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                            callback: function(value, index, values) {
                     		   step1 = values[1];
                     		   max1 = Math.max.apply(Math,values)
         						return round2Digits(value);
     						}
                        }
                    }]
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
                        value: getLocalDataO2STD(stack),
                        borderColor: "#E74C3C",
                        borderWidth: 2,
                        borderDash: [5, 5],
                        label: {
                            enabled: true,
                            content: getLocalDataO2STD(stack)
                        }
                    }]
                } 
            }
        });
        /// mc2

    	var step2 = 0;
    	var max2 = 0
        var maxarr2 = Math.max.apply(Math,getLocalDataEmission1(index));
        chartLayer2 = new Chart(document.getElementById("he_"+stack), {
            type: 'bar',
            data: {
                labels: getLocalDataPeriod(index),
                datasets: [
                    {
                        label: "1st",
                        backgroundColor: "#229954",
                        data: getLocalDataEmission1(index)
                    }, {
                        label: "2nd",
                        backgroundColor: "#3498DB",
                        data: getLocalDataEmission2(index)
                    }
                ]
            },
            options: {
                title: {
                    display: true,
                    text: stack+" Emission"
                },scales: {
                    yAxes: [{
                        ticks: {
                        	beginAtZero: true,
                        	   callback: function(value, index, values) {
                        		   step2 = values[1];
                        		   max2 = Math.max.apply(Math,values)
            						return round2Digits(value);
        						}
                        }
                    }]
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
                } , annotation: {
                    annotations: [{
                        type: 'line',
                        mode: 'horizontal',
                        scaleID: 'y-axis-0',
                        value: getLocalDataEmiSTD(stack),
                        borderColor: "#E74C3C",
                        borderWidth: 2,
                        borderDash: [5, 5],
                        label: {
                            enabled: true,
                            content: getLocalDataEmiSTD(stack)
                        }
                    }]
                }
            }
        });
// 		set max value chart
    	var temp = max1 - (step1/10);
    	var temp2 = max2 - (step2/10);
    	//console.log("create std at chart by stack "+stack+" temp 2 "+temp);
    	if ( temp2 < getLocalDataEmiSTD(stack) ){
    		step2 = max2 + step2;
    	}else{
    		step2 = max2;
    	}
    	
    	if ( temp < getLocalDataO2STD(stack) ){
    		step1 = max1 + step1;
    	}else{
    		step1 = max1;
    	}
        
    	chartLayer1.chart.config.options.scales.yAxes[0].ticks.max = round2Digits(step1);
    	chartLayer2.chart.config.options.scales.yAxes[0].ticks.max = round2Digits(step2);
        chartLayer1.update(); 
		chartLayer2.update(); 
        
    }

	function comChange(p) {
		if("TPCC"==$('#companyname').val()){
			$("#param_tpcc").removeClass("hidden");
			
			$("#param_tpcc").show();
			$("#param_tpac").hide();
			
			changeParam("MC");
		}else{
			$("#param_tpac").show();
			$("#param_tpcc").hide();
			
			changeParam("TSP");
		}
	}
	
    function clickSearch() {
        $("#reportResult").show();
        $("#reportResult2").show();
        
        o2Arr_1 = [];
        o2Arr_2 = [];
        emissionArr_1 = [];
        emissionArr_2 = [];
        period = [];
        
    	if (chartLayer1 != null){
    		chartLayer1.chart.config.data.datasets = [];
    		chartLayer1.chart.config.data.labels = [];
    		chartLayer2.chart.config.data.datasets = [];
    		chartLayer2.chart.config.data.labels = [];
    /* 		chartBanLayer.chart.config.options.annotation.annotations[0].label.content = 0 ;
    		chartBanLayer.chart.config.options.annotation.annotations[0].value = 0 ; */
    		chartLayer1.update(); 
    		chartLayer2.update(); 
    	}
        
		var companyName = $('#companyname').val();
		if (companyName == 'TPAC'){
			jsonObj.parameter_code = $('#param_tpac').val();	
		}else{
			jsonObj.parameter_code = $('#param_tpcc').val();
		}
		
        jsonObj.companyName = $("#companyname").val();
        jsonObj.yearFrom = $("#yearFrom").val();
        jsonObj.yearTo = $("#yearTo").val();
        
        this.labelChart1 = "O2 "+$("#stack_No").val();
        this.labelChart2 = "Emission "+$("#stack_No").val();
        
        jsonObj.stackNo = stackArr.toString();
    	callChart();
    	
    }
    var T_DATA = [];
	function callChart(){
		$.ajax({
            url: cPath+"/stackResult/getDataChart",
           	//data: $('#myForm').serialize()
           	data:jsonObj
        }).done(function (parsed) {
        	T_DATA = parsed;
        	appendHTML();
        	
        	// for create chart
        	for (var i = 0 ; i < stackArr.length ; i++ ){
        		createChart(stackArr[i],i);
        	}
         	
        	/* chartBanLayer.chart.config.options.annotation.annotations[0].label.content = standard ;
        	chartBanLayer.chart.config.options.annotation.annotations[0].value = standard ; */
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
        }); 
	}

    changeParam("TSP");
    //get stack No. at hidden field
    function changeParam(value){
    	stackArr = [];
    	$("#stack_No").empty();
    	var st = "#STACK_PARAM_"+value;
    	var id_st = $(st).val();
    	var array = id_st.split(',')
    	//append option value 
    	for (var i = 0 ; i < array.length ; i++ ){
    		var tem = "#"+array[i];
    		var key = $(tem).val();
    		stackArr.push(key);
    		$('#stack_No').append($("<option></option>").attr("value",key).text(key));
    		//console.log($(tem).val());
    	}
    }
    
    function appendHTML(){
    	var txt = "";
    	for (var i = 0 ; i < stackArr.length ; i++ ){
    		txt = txt + createHTMLbySrtack(stackArr[i]);
    	}
    	$("#stackReport").empty();
    	$('#stackReport').append(txt);
    }
    
    function createHTMLbySrtack(stakc){
    	var text = stakc.replace( /\s/g, '')
    	var tagHtm = "  <div class='row'><div class='col-md-6'> "
       			+" <div class='box box-primary' >"
            	+" <div class='box-header with-border'> "
               	+" <h3 class='box-title' >"+stakc+" O2</h3>"
               	+" <div class='box-tools pull-right'> "
                +" </div></div> "
            	+" <div class='box-body'>"
				+" <form role='form'><div class='row'> <div class='col-md-1'></div> "
                +" <div class='col-md-10'><div class='chart'> "
                +" <canvas id='mc_"+text+"'></canvas> </div></div> "
                +" <div class='col-md-1'></div> </div> </form> </div> "
           		+" </div> </div>"
           		// col 2
           		+" <div class='col-md-6'> "
       			+" <div class='box box-primary' >"
            	+" <div class='box-header with-border'> "
               	+ "<h3 class='box-title' >"+stakc+" Emission</h3>"
               	+" <div class='box-tools pull-right'>  </div></div> "
            	+" <div class='box-body'>"
				+" <form role='form'><div class='row'> <div class='col-md-1'></div> "
                +" <div class='col-md-10'><div class='chart'> "
                +" <canvas id='he_"+text+"'></canvas> </div></div> "
                +" <div class='col-md-1'></div> </div> </form> </div> "
           		+" </div> </div> "
           		+" </div> "
         return tagHtm;
    }
    
    function getLocalDatao2_1(i){
    	var temp = [];
    	var index = parseInt(i);
    	var obj = T_DATA[index].data;
    	for(var x in obj){
    		temp.push(obj[x].o2_1st);
    	}
    	return temp;
    }
    function getLocalDatao2_2(i){
    	var temp = [];
    	var index = parseInt(i);
    	var obj = T_DATA[index].data;
    	for(var x in obj){
    		temp.push(obj[x].o2_2nd);
    	}
    	return temp;
    }
    function getLocalDataEmission1(i){
    	var temp = [];
    	var index = parseInt(i);
    	var obj = T_DATA[index].data;
    	for(var x in obj){
    		temp.push(obj[x].emission_1st);
    	}
    	return temp;
    }    
    function getLocalDataEmission2(i){
    	var temp = [];
    	var index = parseInt(i);
    	var obj = T_DATA[index].data;
    	for(var x in obj){
    		temp.push(obj[x].emission_2nd);
    	}
    	return temp;
    }
    function getLocalDataO2STD(stack){
    	var id = stack+"_"+jsonObj.parameter_code+"_O2";
    	id = id.replace( /\s/g, '')
    	//return $(id).val();"#"+
    	return findSTDValbyStack(id);
    }
    function getLocalDataEmiSTD(stack){
    	var id = stack+"_"+jsonObj.parameter_code+"_EMI";
    	id = id.replace( /\s/g, '');
    	//return $(id).val();
    	return findSTDValbyStack(id);
    }
    function getLocalDataPeriod(i){
    	var temp = [];
    	var index = parseInt(i);
    	var obj = T_DATA[index].data;
    	for(var x in obj){
    		temp.push(obj[x].year);
    	}
    	return temp;
    }
    function round2Digits( number ) {
        return Math.round( Math.round( number * 1000 ) / 10 ) / 100;
    };
    var stdJSON = ${EMISSION_STD_JSON};
    function findSTDValbyStack(stackID){
    	for(var x in stdJSON){
    		if( stdJSON[x].paramCode == stackID ){ 
    			return stdJSON[x].value_1;
    		}
    	}
    	return null;
    	
    }
    
    

</script>