<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="/resources/adminLTE/common.jsp" %>


<style type="text/css">

.row {
    margin-left: -5px;
    margin-right: -5px;
}

.panel-heading{
	  font-weight: bold;
	  font-size: 18px;
}

</style>


<body class="${bodySkin}">

<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<div class="content-wrapper">

<!-- 		<div class="page-header"> -->
<!-- 			<div class="row"> -->
<!-- 				<br> -->
<!-- 				<div class="col-lg-8 col-md-7 col-sm-6"> -->
<!-- 					<h3> -->
<!-- 						<i class='fa fa-bar-chart'></i> Training Summary Report -->
<!-- 					</h3> -->

<!-- 				</div> -->

<!-- 			</div> -->
<!-- 		</div> -->
		
	<section class="content-header">
		 <h1><i class='fa fa-bar-chart'></i> Training Summary Report</h1>
	</section>

<section class="content">
		 <div class="box box-primary " > <div class="box-body">
				<fieldset> 
					   <form class="form-horizontal" id="myForm" commandName="course" method="post" data-toggle="validator" > 
					    
					    
					  <div class="row  ">
						<div class="col-lg-12">


					      <div class="col-lg-6">
				          <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Course Code</label>
			                    <div class="col-lg-6">
			                          <select class="form-control selectpicker" id="courseCode" name="courseCode" title="${_ALL}" multiple >
<%-- 				                       	<option value="">${_ALL}</option> --%>
				                       	<c:forEach var="item" items="${LOV_COURSE_LIST}"> 
									        <option value="${item.courseCode}"   >${item.courseCode} - ${item.courseNameTh}</option>
									    </c:forEach>
				                      </select>
			<%--                         <input type="text" class="form-control" id="courseCode" name="courseCode" value="${param.courseCode}"> --%>
			                    </div>
			                  </div>
			             </div>
				          
				           
			             
			             <div class="col-lg-6">
			                    <div class="form-group">
				                    <label for="" class="col-lg-4 control-label">Company</label>
				                    <div class="col-lg-6">
				                     	<select  class="form-control selectpicker" id="companyCode" name="companyCode"   title="${_ALL}"  multiple >
<%-- 											<option value="">${_ALL}</option> --%>
										    <c:forEach var="item" items="${LOV_COMPANY}">
										     	<option value="${item.code}"  >${item.descTH}</option>
										    </c:forEach>
										</select>
				                    </div>
				                  </div>
			             </div>
			             
			             
			               <div class="col-lg-6">
				          <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">From Date</label>
			                    <div class="col-lg-6">
						                <div class='input-group date'>
						                    <input type='text' class="form-control readonly"  pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='courseDate' name='courseDateStr' 
						                    value="${course.courseDateStr}" required/>
						                    <span class="input-group-addon">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
			                    </div>
			                  </div> 
			                  </div> 
				                  
				                <div class="col-lg-6">
				          <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">To Date</label>
			                    <div class="col-lg-6">
						                <div class='input-group date'>
						                    <input type='text' class="form-control readonly"  pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}"  id='courseDateEnd' name='courseDateEndStr' 
						                    value="${course.courseDateEndStr}" required />
						                    <span class="input-group-addon">
						                        <span class="glyphicon glyphicon-calendar"></span>
						                    </span>
						                </div>
			                    </div>
			                  </div> 
			                  </div> 
				                  
			             
			             <div class="row">
								<div class="col-lg-12">
									<div class="form-group "> 
										<div class="col-lg-12 text-center">
<%-- 											<button type="reset" id="clearBtn" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp; --%>
											<button type="button" id="searchBtn" class="btn btn-primary"><spring:message code="common.searchBtn"/> <i class="fa fa-search"></i></button>&nbsp;&nbsp;
			<!-- 								<button type="button" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
										</div>
									</div>
								</div>
							</div>
							
					</div>
					</div>
							</form> 
			            </fieldset>
							            
			</div>			

		</div>




		<div class="box box-primary" id="box-graph" style="display:none;">


			<div class="box-body">
 
				<div class="row">
					<div class="col-md-12 ">
					
						<div class="panel panel-success">
						<div class="panel-heading"><i class='fa fa-bar-chart'></i>  Number Trained by Company</div>
						<div class="panel-body" id="numChart-g">
							<canvas id="numChart"></canvas>
						</div>
						</div>
					</div>
					
				</div>
				
				<div class="row">
					 
					<div class="col-md-12">
					
						<div class="panel panel-info">
						<div class="panel-heading"><i class='fa fa-pie-chart'></i>  Percent(%) Trained by Company</div>
						<div class="panel-body" id="perChart-g">
							<canvas id="perChart" height="400"></canvas>
						</div>
						</div>
					</div>
					
				</div>
				
				
				<%-- <div class="row">
				
					<div class="col-lg-6">
					
						<div class="panel panel-danger">
						<div class="panel-heading"><i class='fa fa-bar-chart'></i>  Number Trained by Company (All courses)</div>
						<div class="panel-body">
							<canvas id="priceChart" height="150"></canvas>
						</div>
						</div>
					</div>
					
					<div class="col-lg-6">
					
						<div class="panel panel-info">
						<div class="panel-heading"><i class='fa fa-pie-chart'></i>  Percent(%) Trained by Company  (All courses)</div>
						<div class="panel-body">
							<canvas id="allChart" height="150"></canvas>
						</div>
						</div>
					</div>
					
				</div> --%>
				
				 
			</div>
		</div>

	</section>


	</div>






	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-body">
					<div class="te"></div>
				</div>
			</div>
		</div>
	</div>




	<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
	<script>
	
// 		$('.date').datepicker({
// 			format : 'dd/mm/yyyy'
// 		});

		/* function doSearch() {
			$.ajax({
				url : cPath + "/assetmanage/getDataTable.json",
				data : $('#myForm').serialize()
			}).done(function(result) {
				rsTable.clear().draw();
				if (result.recordsTotal > 0) {
					rsTable.rows.add(result.data).draw();
				} else {
					bootbox.alert({
						message : "No Data Found!",
						size : 'small'
					});
				}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				// needs to implement if it fails
			});
		};

		function doPopup() {
			$('#myModal').removeData('bs.modal');
		}; */

		  
	</script>


<script> 

 	var  numChart ;
 	var  perChart ;
      
        //############################# /*** Build Report***/ #######################
		function buildNumberGraph(data) {
			 var gData = {
			  labels: data['labels'],
			  datasets: data['datasets']	
			};
				
			var chartOptions = {
// 				scale: {
// 					ticks: {
// 						beginAtZero: true
// 					}
// 				}
// 				 tooltips: {
// 		            mode: 'nearest'
// 		        }
 				title : {
						display : true,
						text : data['datasets']['startDate'] + ' - ' + data['datasets']['endDate']
					},
				showDatasetLabels : true
				,animation: {
				    onComplete: function () {
				        var ctx = this.chart.ctx;
				        var fontSize = 12;
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
			};
			
			if(numChart!=null){
			 	numChart.destroy();
			}
			var ctx = $('#numChart').get(0).getContext('2d');
			numChart = new Chart( ctx, {
			    type: 'bar',
			    data: gData,
 			 	options: chartOptions
			});
			
	}
	
	function buildPercentGraph(data) {
 			var gData = {
			  labels: data['labels'],
			  datasets: data['datasets']	
			};
				
			 if(perChart!=null){
			 	perChart.destroy();
			}
			perChart = new Chart(document.getElementById("perChart"), {
			    type: 'horizontalBar',
			   	data: gData,
			    options: {
			      title : {
						display : true,
						text : data['datasets']['startDate'] + ' - ' + data['datasets']['endDate']
					}
// 			       scales: {
// 				        yAxes: [{ticks: {mirror: true}}]
// 				    }

					,animation: {
						    onComplete: function () {
						        var ctx = this.chart.ctx;
						        var fontSize = 12;
				                var fontStyle = 'normal';
				                var fontFamily = Chart.defaults.global.defaultFontFamily;
			                    ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
						        ctx.fillStyle = "black";
// 						        ctx.textAlign = 'right';
// 						        ctx.textBaseline = 'bottom';
						        ctx.textBaseline = 'middle';
						
						        this.data.datasets.forEach(function (dataset)
						        {
						            for (var i = 0; i < dataset.data.length; i++) {
						                for(var key in dataset._meta){
						                    var model = dataset._meta[key].data[i]._model;
						                    var dataval = dataset.data[i];
						                    if(dataval>0){
						                    	var lb =  dataval+'%' ;
// 						                    	var lb = dataset.label+' : '+dataval+'%';
						                    	ctx.fillText(lb, model.x+ 2, model.y);
						                    }
						                }
						            }
						        });
						    }
						}
			    }
			});
			
			
	}
	
	
	
			
	 function refreshDashboard(c_data){

		buildNumberGraph(c_data['Data1']);
		
		buildPercentGraph(c_data['Data2']);
		
	// 	buildReportGraph();
	
	// 	buildAllGraph();
 	 }
 	 
	var COLORS = [
		'#4dc9f6',
		'#f67019',
		'#f53794',
		'#537bc4',
		'#acc236',
		'#166a8f',
		'#00a950',
		'#58595b',
		'#8549ba',
// 		'#3FB618',
		'#E9FB00',
		'#00DC13',
		'#0F00DC'
	];
	
	function regroupJson(result){
 		var ouputJson = {};
 		ouputJson['Data1'] = {};
 		ouputJson['Data2'] = {};
 		ouputJson['Data3'] = {};
 		ouputJson['Data4'] = {};

// 		console.log(result);
		
 		ouputJson['Data1']['labels'] = [];
 		ouputJson['Data1']['datasets'] = [];
 		ouputJson['Data1']['companyVal'] = [];
 		ouputJson['Data1']['companyPer'] = [];
 		
 		var LOV_COMPANY = result['LOV_COMPANY'];
 		var courseList = result['courseList'];
 		var reportData = result['reportData'];
 		
		var filCompCode	= $('#companyCode').val();
		if(null!=filCompCode){
			var LOV_COMPANY_FILL = LOV_COMPANY.filter(function(cm){
				var cv =filCompCode.indexOf(cm['code']);
			  	return cv >= 0;
			});
			LOV_COMPANY= LOV_COMPANY_FILL;
		}
		
		var filCourseCode	= $('#courseCode').val();
		if(null!=filCourseCode){
			var courseList_FILL = courseList.filter(function(cm){
				var cv =filCourseCode.indexOf(cm['courseCode']);
			  	return cv >= 0;
			});
			courseList= courseList_FILL;
		}
		
		
 		for(var i in LOV_COMPANY){
 			var comarr = [];
 			var perarr = [];
 			
		 	for(var j in courseList){
		 		var _c1 = LOV_COMPANY[i]['code']+"_"+courseList[j]['courseCode'];
				var isfound = false;
				var _cv1 = 0;
				var _cv2= 0;
				var _cv_per = 0;
				for(var k in reportData){
					var _k1= reportData[k]['COMPANY_CODE']+"_"+reportData[k]['course_CODE'];
					if(_c1 == _k1){
			 			_cv1 =  reportData[k]['COUNT_TRAIN'];
			 			_cv2 =  reportData[k]['OWN_COMPANY_SUM'];
			 			_cv_per = (_cv1/_cv2*100);
			 			isfound = true;
			 			break;
					}
			 	}
// 			 	console.log(_c1 + " : "+_cv1);
				comarr.push(_cv1);
				perarr.push(_cv_per.toFixed(2));
// 			 	ouputJson['Data1']['companyVal'][ = _cv1;
			}
			ouputJson['Data1']['companyVal'][i] = comarr;
			ouputJson['Data1']['companyPer'][i] = perarr;
 		}
 		
		for(var i in courseList){
			ouputJson['Data1']['labels'].push(courseList[i]['courseNameTh']);
 		}
 		
//  		ouputJson['Data2'] = ouputJson['Data1'];
 		ouputJson['Data2']['datasets'] = [];
 		ouputJson['Data2']['labels'] = ouputJson['Data1']['labels'];
 		
 		ouputJson['Data1']['datasets']['startDate'] = $('#courseDate').val() ;
 		ouputJson['Data1']['datasets']['endDate'] = $('#courseDateEnd').val() ;
 		ouputJson['Data2']['datasets']['startDate'] = $('#courseDate').val() ;
 		ouputJson['Data2']['datasets']['endDate'] = $('#courseDateEnd').val() ;
 		
 		for(var i in LOV_COMPANY){
			var colorName = COLORS[i % COLORS.length];
			var companyData = {
				  label: LOV_COMPANY[i]['descTH'],
				  data: ouputJson['Data1']['companyVal'][i],
				  backgroundColor: colorName,
				  borderColor: colorName,
				  borderWidth: 0
				};
				
			var companyPerData = {
				  label: LOV_COMPANY[i]['descTH'],
				  data: ouputJson['Data1']['companyPer'][i],
				  backgroundColor: colorName,
				  borderColor: colorName,
				  borderWidth: 0
				};
			
 			ouputJson['Data1']['datasets'].push(companyData);
 			ouputJson['Data2']['datasets'].push(companyPerData);
 		}
 		
 		
 		refreshDashboard(ouputJson);
 		
 	}
	
	
	
 	 var resultJSON = {};
 	function reportNumberTrain() {
		$.ajax({
			type: "POST",
		    dataType: "json",
			url : cPath + "/history/reportNumberTrain.json",
			data : $('#myForm').serialize()
		}).done(function(result) {
			resultJSON = JSON.parse(result);
			regroupJson(resultJSON);
		}).fail(function(jqXHR, textStatus, errorThrown) {
		});
	};
	  
		$("#searchBtn").click(function(){
		
			var _f = $('#myForm').validator('validate');
			if (_f.has('.has-error').length==0) {
				$("#box-graph").show();
	         	reportNumberTrain() ;
			} 
				
        });
        
		$("#clearBtn").click(function(){
//          	 reportNumberTrain() ;
         	 $("#box-graph").hide();
        });
	
	
           var startDate = new Date(currYear, 0 , 1);
           
           $("#courseDateEnd").datepicker({  format: 'dd/mm/yyyy' })
           .datepicker("setDate", "-0d"); 
           
           $("#courseDate").datepicker({  format: 'dd/mm/yyyy' })
             .datepicker("setDate", startDate); 
		 
        

</script>
    
    

</body>

</html>