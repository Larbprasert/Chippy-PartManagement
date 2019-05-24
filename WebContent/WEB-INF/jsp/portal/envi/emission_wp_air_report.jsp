<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp" %>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-industry"></i>&nbsp;&nbsp;Workplace Air Report
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
	                            <div class="col-lg-6">
	                                <div class="form-group">
	                                    <label for="paramCode" class="col-lg-4 control-label">From Year</label>
	                                    <div class="col-lg-6">
	                                        <select class="form-control" name="periodFrom">
	                                            <option value="">--- All ---</option>
	                                            <% for(int i=curr_year;i>=start_year;i--){ %>
	                                                <option><%=i %></option>
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
	                                            <option value="">--- All ---</option>
													<% for(int i=curr_year;i>=start_year;i--){ %>
														<option><%=i %></option>
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
        <div class="col-md-12 hidden"  id="tpacResult">
			<%@ include file="/WEB-INF/jsp/portal/envi/emission_wp_air_tpac_report.jsp"%>
		</div>
		<div class="col-md-12 hidden"  id="tpccResult">
			<%@ include file="/WEB-INF/jsp/portal/envi/emission_wp_air_tpcc_report.jsp"%>
		</div>


    </section>

</div>


<script type="text/javascript">
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
			
			renderCanvas('TPAC', 'TSP');
		} else {
			$('.plant-title').html("TPCC-Plant");
			$("#tpacResult").addClass("hidden");
			$("#tpccResult").removeClass("hidden");
			
			$("#TPCC_tab_button li").removeClass("active");
			$("#TPCC_tab_button li").first().addClass("active");
			
			$("#TPCC_tab_content div.tab-pane").removeClass("active");
			$("#TPCC_tab_content div#tpcc_tab_1").addClass("active");
			
			renderCanvas('TPCC', 'TSP');
		}
	}
	
	function renderCanvas(company , parameterCode){
		if(company == 'TPAC' &&  parameterCode == 'TSP' ){
			requestObj.parameterCode = parameterCode;
			createGraph('#tsp_packing' , "TPAC_POINT_PACKING", 2);
		}
		if(company == 'TPAC' &&  parameterCode == 'BENZENE' ){
			requestObj.parameterCode = parameterCode;
			createGraph('#benzenetable_Formalin_Plant', "TPAC_POINT_FORMALIN", 3);
			createGraph('#benzenetable_Monomer_Plant', "TPAC_POINT_MONOMER", 3);
			createGraph('#benzenetable_Polymer_Plant', "TPAC_POINT_POLYMER", 3);
		}
		if(company == 'TPAC'&&  parameterCode == 'FORMALDEHYDE' ){
			requestObj.parameterCode = parameterCode;
			createGraph('#Formaldehyde_Formalin_Plant', "TPAC_POINT_FORMALIN", 3);
			createGraph('#Formaldehyde_Monomer_Plant', "TPAC_POINT_MONOMER", 3);
			createGraph('#Formaldehyde_Polymer_Plant', "TPAC_POINT_POLYMER", 3);
			createGraph('#Formaldehyde_Wast_water', "TPAC_POINT_WASTE_WATER", 3);
		}
		
		
		if(company == 'TPCC' &&  parameterCode == 'TSP' ){
			requestObj.parameterCode = parameterCode;
			createGraph('#TSP_Packing_and_Pelletizing' , "TPCC_POINT_PACKING" , 2);
		}
		if(company == 'TPCC' &&  parameterCode == 'MC' ){
			requestObj.parameterCode = parameterCode;
			createGraph('#MC_P_Stucture' , "TPCC_POINT_P_STUCTURE", 2);
			createGraph('#MC_G_Stucture' , "TPCC_POINT_G_STUCTURE", 2);
			createGraph('#MC_Polymerization' , "TPCC_POINT_POLYMERIZATION", 2);
		}
		if(company == 'TPCC' &&  parameterCode == 'HE' ){
			requestObj.parameterCode = parameterCode;
			createGraph('#HE_G_Stucture' , "TPCC_POINT_G_STUCTURE", 2);
			createGraph('#HE_Polymerization' , "TPCC_POINT_POLYMERIZATION", 2);
		}
		if(company == 'TPCC' &&  parameterCode == 'CO' ){
			requestObj.parameterCode = parameterCode;
			createGraph('#CO_CG_Process' , "TPCC_POINT_CG_PROCESS", 2);
		}
		if(company == 'TPCC' &&  parameterCode == 'Cl2' ){
			requestObj.parameterCode = parameterCode;
			createGraph('#Cl2_CG_Process' , "TPCC_POINT_CG_PROCESS", 2);
		}
	}
	
	function createGraph(canvId , plantCode, rLeng){
		var reportData = $.ajax({
            url: cPath+"/workPlaceAir/getDataTable.json",
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
		
		
		for(var i = 1; i<= rLeng; i++){
			var data1 = [];
			var data2 = [];
			var data3 = [];
			var data4 = [];
			if(i==1){
				data1 = sampling1Frist;
				data2 = sampling1Second;
				data3 = sampling1Third;
				data4 = sampling1Fourth;
			}else if(i==2){
				data1 = sampling2Frist;
				data2 = sampling2Second;
				data3 = sampling2Third;
				data4 = sampling2Fourth;
			}else{
				data1 = sampling3Frist;
				data2 = sampling3Second;
				data3 = sampling3Third;
				data4 = sampling3Fourth;
			}
			$(canvId+"_"+i).empty();
			$(canvId+"_"+i).append("<canvas></canvas>");
			new Chart($(canvId+"_"+i+" canvas"), {
			    type: 'bar',
			    data: {
			      labels: yearlabel,
			      datasets: [
			        {
			          label: "1st",
		 	          backgroundColor: "#3b5998",
			          data: data1
			        },{
			          label: "2nd",
			          backgroundColor: "#55acee",
			          data: data2
			        }, {
			          label: "3rd",
			          backgroundColor: "#dd4b39",
			          data: data3
			        }, {
			          label: "4th",
			          backgroundColor: "#00c300",
			          data: data4
			        }
			      ]
			    },
			    options: {
			      title: {
			        display: true,
			        text: requestObj.companyCode+i
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
		
	}
</script>