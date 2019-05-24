<!DOCTYPE HTML>
<!-- <html xmlns:th="http://www.thymeleaf.org"> -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="common/common-include.jsp"%>

<!--     <body class=" sidebar-mini"> -->
<!--     <body class="skin-black"> -->

     <body class="skin-red  fixed">
	
		<div class="wrapper">   
          
<!--         <div class="wrapper row-offcanvas row-offcanvas-left"> -->
           
           <%@ include file="common/common-navbar.jsp"%>
       	
            <!-- Left side column. contains the logo and sidebar -->
	 		<%@ include file="common/common-sidebar.jsp"%>


            <!-- Right side column. Contains the navbar and content of the page -->
<!--             <aside class="right-side"> -->
              <div class="content-wrapper">
               
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        LSP Dashboard 
                        <small> <i class='fa fa-angle-double-right'></i> Summary all Dealer by Month</small>
                    </h1>
                    
                    <ol class="breadcrumb">
<!--                         <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li> -->
                       <li class="dropdown user-dropdown">
                       <a href="javascript:void(0);" class="dropdown-toggle ng-binding"
						data-toggle="dropdown"><i class="fa fa-refresh"></i> Refresh Time 
						<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
<!-- 								<li><a href="$"><i class="fa fa-id-card-o"></i> View Profile </a></li> -->
<!-- 								<li class="divider"></li> -->
<!-- 		             		<li><a href="#"  ><i class='fa fa-magic'></i> Themes Setting </a></li> -->
<!-- 		             		<li><a th:href="@{/reloadCache}" target="_blank"><i class='fa fa-refresh'></i> Reload Cache</a></li> -->
<!-- 							<li class="divider"></li> -->
							<li>
								<a  href="<%=request.getContextPath()%>/MainServlet?action=DashboardActionPre&page=dashboard&time=5" >5 min.</a>
								<a  href="<%=request.getContextPath()%>/MainServlet?action=DashboardActionPre&page=dashboard&time=10" >10 min.</a>
								<a  href="<%=request.getContextPath()%>/MainServlet?action=DashboardActionPre&page=dashboard&time=15" >15 min.</a>
								<a  href="<%=request.getContextPath()%>/MainServlet?action=DashboardActionPre&page=dashboard&time=30" >30 min.</a>
								<a  href="<%=request.getContextPath()%>/MainServlet?action=DashboardActionPre&page=dashboard&time=60" >60 min.</a>
								<a  href="<%=request.getContextPath()%>/MainServlet?action=DashboardActionPre&page=dashboard&time=90" >90 min.</a>
								<a  href="<%=request.getContextPath()%>/MainServlet?action=DashboardActionPre&page=dashboard&time=120" >120 min.</a>
							</li>
						</ul></li>
                       
                        <li class="active" id="lb-time">  15 min. </li>
                   
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                 

                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner dash-text">
                                    <h3 id="box-prospect">
                                        0
                                    </h3>
                                      <p class="s-type">
<!--                                          Current status is <span id="box-prospect-f">0</span> records -->
                                    </p>
                                </div>
                                <div class="icon">
 										<i class="fa fa-group"></i>
                                </div>
                                <span class="small-box-footer"  > 
                                Prospect
                                </span>
                            </div>
                        </div><!-- ./col -->
                        
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner dash-text">
                                    <h3 id="box-booking">
                                        0
                                    </h3>
                                    <p class="s-type">
<!--                                          Current status is <span id="box-booking-f">0</span> records -->
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-address-book"></i>
                                </div>
                                <span class="small-box-footer" >
                                     Booking
                                </span>
                            </div>
                        </div><!-- ./col -->
                        
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner dash-text">
                                    <h3 id="box-delivery">
                                        0
                                    </h3>
                                     <p class="s-type">
<!--                                     <p>  Current status is <span id="box-delivery-f">0</span> records -->
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-car"></i>
                                </div>
                                 <span class="small-box-footer"  > Delivery </span>
                            </div>
                        </div><!-- ./col -->
                        
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner dash-text">
                                    <h3 id="box-cancel">
                                        0
                                    </h3>
<!--                                     <p> Current status is <span id="box-cancel-f">0</span> records -->

                                     <p class="s-type"></p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-times-circle"></i>
                                </div>
                               <span class="small-box-footer" >    Cancel Booking
<!--                                      Current status is <span id="box-cancel-f">0</span> records -->
                                </span>
                            </div>
                        </div><!-- ./col -->
                    </div><!-- /.row -->
                    
                    
			        
<!--       ##################  GRAPH 1  -->
                    
				      <div class="row">
				        <div class="col-md-12">
				          <div class="box box-primary report-box" >
				            <div class="box-header with-border">
				              <h2 class="box-title"><i class="fa fa-line-chart"></i> Daily/Monthly</h2>
				
				              <div class="box-tools pull-right">
				                <button type="button" class="btn btn-box-tool" onclick="doSearchTable()"><i class="fa fa-refresh"></i>  </button>
				                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> </button>
<!-- 				                <div class="btn-group"> -->
<!-- 				                  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"> -->
<!-- 				                    <i class="fa fa-wrench"></i></button> -->
<!-- 				                  <ul class="dropdown-menu" role="menu"> -->
<!-- 				                    <li><a href="#">Action</a></li> -->
<!-- 				                    <li><a href="#">Another action</a></li> -->
<!-- 				                    <li><a href="#">Something else here</a></li> -->
<!-- 				                    <li class="divider"></li> -->
<!-- 				                    <li><a href="#">Separated link</a></li> -->
<!-- 				                  </ul> -->
<!-- 				                </div> -->
				                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
				              </div>
				            </div>
				            <!-- /.box-header -->
				            <div class="box-body">
				              <div class="row">
				              
				                <div class="col-md-6">
<!-- 				                  <p class="text-center"> -->
<!-- 				                    <strong>1 October 2017 - 17 October 2017</strong> -->
<!-- 				                  </p> -->
				
				                  <div class="chart">
				                    <!-- Sales Chart Canvas -->
				                    <canvas id="salesChart" ></canvas>
				                  </div>
				                  <!-- /.chart-responsive -->
				                </div>
				                
				                <!-- /.col -->
				                <div class="col-md-4">
				                  <p class="text-center">
				                    <b class="txt-sum-hdr">Daily/Monthly Summary</b>
				                  </p>
				
				                  <div class="progress-group">
				                    <span class="progress-text">Prospect</span>
				                    <span class="progress-number" id="progress-prospect-lb"><b>0</b> / 0</span>
				
				                    <div class="progress sm">
				                      <div class="progress-bar progress-bar-aqua" id="progress-prospect-bar" style="width: 0%"></div>
				                    </div>
				                  </div>
				                  <!-- /.progress-group -->
				                  <div class="progress-group">
				                    <span class="progress-text">Booking</span>
				                    <span class="progress-number" id="progress-booking-lb"><b>0</b> / 0</span>
				
				                    <div class="progress sm">
				                      <div class="progress-bar progress-bar-yellow" id="progress-booking-bar" style="width: 0%"></div>
				                    </div>
				                  </div>
				                  <!-- /.progress-group -->
				                  <div class="progress-group">
				                    <span class="progress-text">Delivery</span>
				                    <span class="progress-number" id="progress-delivery-lb"><b>0</b> / 0</span>
				
				                    <div class="progress sm">
				                      <div class="progress-bar progress-bar-green" id="progress-delivery-bar" style="width: 0%"></div>
				                    </div>
				                  </div>
				                  <!-- /.progress-group -->
				                  <div class="progress-group">
				                    <span class="progress-text">Cancel Booking</span>
				                    <span class="progress-number" id="progress-cancel-lb"><b>0</b> / 0</span>
				
				                    <div class="progress sm">
				                      <div class="progress-bar progress-bar-red" id="progress-cancel-bar" style="width: 0%"></div>
				                    </div>
				                  </div>
				                  <!-- /.progress-group -->
				                </div>
				                <!-- /.col -->
				              </div>
				              <!-- /.row -->
				            </div>
				            
				            <!-- ./box-body -->
				            <div class="box-footer  <%=showCompareData %>">
				              <div class="row">
				                <div class="col-sm-3 col-xs-6">
				                  <div class="description-block border-right">
				                    <h5 class="description-header text-blue" id="today-prospect">0</h5>
				                    <span class="description-text ">TODAY PROSPECT</span>
				                  </div>
				                </div>
				                <div class="col-sm-3 col-xs-6">
				                  <div class="description-block border-right">
				                    <h5 class="description-header text-yellow" id="today-booking">0</h5>
				                    <span class="description-text ">TODAY BOOKING</span>
				                  </div>
				                </div>
				                <div class="col-sm-3 col-xs-6">
				                  <div class="description-block border-right">
				                    <h5 class="description-header text-green" id="today-delivery">0</h5>
				                    <span class="description-text ">TODAY DELIVERY</span>
				                  </div>
				                </div>
				                <div class="col-sm-3 col-xs-6">
				                  <div class="description-block">
				                    <h5 class="description-header text-red" id="today-cancel">0</h5>
				                    <span class="description-text ">TODAY CANCEL BOOKING</span>
				                  </div>
				                </div>
				              </div>
				            </div>
				            
				            <!-- /.box-footer -->
				          </div>
				          <!-- /.box -->
				        </div>
				        <!-- /.col -->
				        
				      </div>
				      <!-- /.row -->
			        
			            <!--           ##################  NEW GRAPH  ##########  -->
			          <div class="row">
			              <div class="col-md-12">
				
				          <!-- BAR CHART -->
				          <div class="box box-warning">
				            <div class="box-header with-border">
				              <h2 class="box-title"><i class="fa fa-line-chart"></i> Sales Trend </h2>
				
				              <div class="box-tools pull-right">
				                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
				                </button>
				                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
				              </div>
				            </div>
				            <div class="box-body">
				              <div class="chart">
				                <canvas id="compareChart"  ></canvas>
				              </div>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
				
				        </div>
				        
				      </div>
				      <!-- /.row -->
				      
			        
			     <!--           ##################  GRAPH ##########  -->
  
                            <!-- /.col (LEFT) -->
			       <div class="row   <%=showCompareData %>">
				         
				         <div class="col-md-3">
				
				          <!-- BAR CHART -->
				          <div class="box box-info">
				            <div class="box-header with-border">
				              <h2 class="box-title"><i class="fa fa-bar-chart"></i> Today : <small id="c-today">xxx</small></h2>
				
				              <div class="box-tools pull-right">
				                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
				                </button>
				                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
				              </div>
				            </div>
				            <div class="box-body">
				              <div class="chart">
				                <canvas id="barChart2" style="height:230px"></canvas>
				              </div>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
				
				        </div>
				        
				         <div class="col-md-3">
				
				          <!-- BAR CHART -->
				          <div class="box box-warning">
				            <div class="box-header with-border">
				              <h2 class="box-title"><i class="fa fa-bar-chart"></i> Monthly : <small id="c-month">xxx</small></h2>
				
				              <div class="box-tools pull-right">
				                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
				                </button>
				                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
				              </div>
				            </div>
				            <div class="box-body">
				              <div class="chart">
				                <canvas id="barChart" style="height:230px" ></canvas>
				              </div>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
				
				        </div>
				        
				        <div class="col-md-6">
				          <!-- BAR CHART -->
				          <div class="box box-success">
				            <div class="box-header with-border">
				              <h2 class="box-title"><i class="fa fa-pie-chart"></i> Monthly Top 5 Dealers : <small id="top-month">xxx</small> </h2>
				
				              <div class="box-tools pull-right">
				                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
				                </button>
				                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
				              </div>
				            </div>
				            <div class="box-body">
				              <div class="chart">
				                <canvas id="pieChart" style="height:230px"></canvas>
				              </div>
				            </div>
				            <!-- /.box-body -->
				          </div>
				          <!-- /.box -->
				
				        </div>
			        </div>
			        

                </section><!-- /.content -->
<!--             </aside>/.right-side -->
            
        	</div> 
        	
     
<!-- 		<div th:replace="common/common-footer :: common-footer" /> -->
<%-- 		           <%@ include file="common/common-footer.jsp"%> --%>
		
        	
<!-- 		<div th:replace="common/common-sidebar-ctrl :: common-sidebar-ctrl" /> -->
		
        </div><!-- ./wrapper -->


<!--    <input type="hidden" class="form-control" id="startDate" name="startDate"/> -->
<!--      <input type="hidden" class="form-control" id="endDate" name="endDate"/> -->
              	
        	

<script th:inline="javascript">
//<![CDATA[
         
        $('#date-period').daterangepicker();
        
        Chart.plugins.register({
        	  afterDraw: function(chartInstance) {
        	    if (chartInstance.config.options.showDatapoints) {
        	      var helpers = Chart.helpers;
        	      var ctx = chartInstance.chart.ctx;
        	      var fontColor = helpers.getValueOrDefault(chartInstance.config.options.showDatapoints.fontColor, chartInstance.config.options.defaultFontColor);

        	      // render the value of the chart above the bar
//         	      ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, 'normal', Chart.defaults.global.defaultFontFamily);
        	      
                  var fontSize = 14;
                  var fontStyle = 'bold';
                  var fontFamily = Chart.defaults.global.defaultFontFamily;
                  ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
                        
        	      ctx.textAlign = 'center';
        	      ctx.textBaseline = 'bottom';
        	      ctx.fillStyle = 'rgb(0, 0, 0)';

        	      chartInstance.data.datasets.forEach(function (dataset) {
        	        for (var i = 0; i < dataset.data.length; i++) {
        	          var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model;
        	          var scaleMax = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._yScale.maxHeight;
        	          var yPos = (scaleMax - model.y) / scaleMax >= 0.93 ? model.y + 20 : model.y - 5;
        	          ctx.fillText(dataset.data[i], model.x, yPos);
        	        }
        	      });
        	    }
        	  }
        	});
        
        
        // - MONTHLY SALES CHART -
        Chart.defaults.global.elements.line.fill = false;
        

        //############################# /*** Build Dashboard***/ #######################
		function buildDashboard(data) {
			var dashboard = data['dashboard'];
// 			var _b = dashboard['booking']['sumValue']
			$('#box-prospect').animateNumber({ number: dashboard['prospect']['sumValue'] },  1000 );
			$('#box-booking').animateNumber({ number: dashboard['booking']['sumValue'] },  1000 );
			$('#box-delivery').animateNumber({ number: dashboard['delivery']['sumValue'] },  1000 );
			$('#box-cancel').animateNumber({ number: dashboard['cancel']['sumValue'] },  1000 );
			
			$('#box-prospect-f').animateNumber({ number: dashboard['prospect']['currentValue']},  1000 );
			$('#box-booking-f').animateNumber({ number: dashboard['booking']['currentValue']},  1000 );
			$('#box-delivery-f').animateNumber({ number: dashboard['delivery']['currentValue']},  1000 );
			$('#box-cancel-f').animateNumber({ number: dashboard['cancel']['currentValue']},  1000 );
		}
		
		//############################# /*** Build Report***/ #######################
		function buildReportGraph(data) {

			var days_in_month = data['days_range'];
	        
			var salesChart = $('#salesChart').get(0).getContext('2d');
		        new Chart(salesChart, {
				  type: 'line',
				  animationEasing: 'linear',
				  data: {
				    labels: days_in_month,
				    datasets: [{ 
				        data: data['datasets']['prospect'],
				        label: "Prospect",
				        borderColor: "#00c0ef",
				        fill: false
				      }, { 
				    	  data: data['datasets']['booking'],
				        label: "Booking",
				        borderColor: "#f39c12",
				        fill: false
				      }, { 
				    	  data: data['datasets']['delivery'],
				        label: "Delivery",
				        borderColor: "#00a65a",
				        fill: false
				      }, { 
				    	  data: data['datasets']['cancel'],
				        label: "Cancel Booking",
				        borderColor: "#dd4b39",
				        fill: false
				      }
				    ]
				  } ,
				  options : {
						title : {
							display : true,
							text : data['datasets']['startDate'] + ' - ' + data['datasets']['endDate']
						},
						legend : {
// 							display : false
						}, responsive           : true,
						  maintainAspectRatio  : false

					}
				});

		var dash = data['dashboard'];
		
		var total = dash['total'];
		$('#progress-prospect-lb').html(
				"<b>" + dash['prospect']['todayValue'] + " / " + dash['prospect']['sumValue']+"</b> ");
		$('#progress-booking-lb').html(
				"<b>" + dash['booking']['todayValue'] + " / " + dash['booking']['sumValue']+"</b> ");
		$('#progress-delivery-lb').html(
				"<b>" + dash['delivery']['todayValue'] + " / " + dash['delivery']['sumValue']+"</b> ");
		$('#progress-cancel-lb').html(
				"<b>" + dash['cancel']['todayValue'] + " / " + dash['cancel']['sumValue']+"</b> ");

		$('#today-prospect').html(dash['prospect']['todayValue']);
		$('#today-booking').html(dash['booking']['todayValue']);
		$('#today-delivery').html(dash['delivery']['todayValue']);
		$('#today-cancel').html(dash['cancel']['todayValue']);
		
// 		dashboard['prospect']['currentValue']
		var _p1 =dash['prospect']['todayValue'] *100 / dash['prospect']['sumValue'];
		var _p2 =dash['booking']['todayValue'] *100 / dash['booking']['sumValue'];
		var _p3 =dash['delivery']['todayValue'] *100 / dash['delivery']['sumValue'];
		var _p4 =dash['cancel']['todayValue'] *100 / dash['cancel']['sumValue'];
// 		console.log("_p1 : "+_p1);
// 		var _p2
// 		var _p3
// 		var _p4

		$('#progress-prospect-bar').attr("style",
				"width:" + _p1 + "%");
		$('#progress-booking-bar').attr("style",
				"width:" + _p2 + "%");
		$('#progress-delivery-bar').attr("style",
				"width:" + _p3 + "%");
		$('#progress-cancel-bar').attr("style",
				"width:" + _p4 + "%");

	}
		
		//############################# /*** Build Trend***/ #######################
		function buildTrendGraph(data) {
			
			var days_in_month = data['days_range'];
	        
			var salesChart = $('#compareChart').get(0).getContext('2d');
		        new Chart(salesChart, {
				  type: 'line',
				  animationEasing: 'linear',
				  data: {
				    labels: days_in_month,
				    datasets: [{ 
				        data: data['datasets']['prospect_trend'],
				        label: "Prospect Trend",
				        borderColor: "#00c0ef",
				        fill: false
				      }, {
				    	  data: data['datasets']['booking'],
				        label: "Booking",
				        borderColor: "#f39c12",
				        fill: false
				  /*     }, { 
				    	  data: data['datasets']['delivery'],
				        label: "Delivery",
				        borderColor: "#00a65a",
				        fill: false */
				      }, { 
				    	  data: data['datasets']['cancel_trend'],
				        label: "Cancel Trend",
				        borderColor: "#dd4b39",
				        fill: false
				      }
				    ]
				  } ,
				  options : {
// 						title : {
// 							display : true,
// 							text : data['datasets']['startDate'] + ' - ' + data['datasets']['endDate']
// 						},
						legend : {
// 							display : false
						}, responsive           : true,
						  maintainAspectRatio  : false

					}
				});
 

	}
		

	//############################# /*** Build Today Graph***/ #######################
	function buildTodayGraph(data) {
		
		var dash = data['dashboard'];
		
		$('#c-today').html(dash['currentDate']);
		
		var barchart = $('#barChart2').get(0).getContext('2d');
		new Chart(barchart,
				{
					type : 'bar',
					data : {
						labels : [ "Prospect", "Booking", "Delivery",
								"Cancel Booking" ],
						datasets : [ {
							backgroundColor : [ "#3c8dbc", "#f39c12",
									"#00a65a", "#dd4b39" ],
							data : [ dash['prospect']['todayValue'],
									dash['booking']['todayValue'],
									dash['delivery']['todayValue'],
									dash['cancel']['todayValue'], ]
						} ]
					},
					options : {
						legend : {
							display : false
						},
						// 		          showAllTooltips: false,
						showDatapoints : true,
						 responsive           : true,
						  maintainAspectRatio  : false
					}
				});

	}

	//############################# /*** Build  Monthly Graph***/ #######################
	function buildMonthlyGraph(data) {

		var dash = data['dashboard'];
		
		$('#c-month').html(dash['currentMonth']);
		$('#top-month').html(dash['currentMonth']);
		
		var barchart = $('#barChart').get(0).getContext('2d');
		new Chart(barchart, {
				type : 'bar',
				data : {
					labels : [ "Prospect", "Booking", "Delivery",
							"Cancel Booking" ],
					datasets : [ {
						backgroundColor : [ "#3c8dbc", "#f39c12",
								"#00a65a", "#dd4b39" ],
						data : [ dash['prospect']['sumValue'],
								dash['booking']['sumValue'],
								dash['delivery']['sumValue'],
								dash['cancel']['sumValue'], ]
					} ]
				},
				options : {
					legend : {
						display : false
					},
					showAllTooltips : false,
					showDatapoints : true,
					 responsive           : true,
					  maintainAspectRatio  : false
				}
			});

	}

	//- ###########################################   PIE CHART - #######################################
	function buildPieGraph(data) {

		var pieChart = $('#pieChart').get(0).getContext('2d');
		new Chart(pieChart, {
			type : 'pie',
			data : {
				labels : data['rankData']['dealers'],
				datasets : [ {
					backgroundColor : [ "#3e95cd", "#8e5ea2", "#f39c12",
							"#00a65a", "#dd4b39" ],
					data : data['rankData']['values']
				} ]
			},
			options : {
				legend : {
					position : 'right'
				},
				pieceLabel : {
					render : 'value',
// 					 render: 'percent',
					fontColor : 'rgb(0, 0, 0)',
					fontStyle : 'bold'
				},
				 segmentShowStroke    : true,
				    // String - The colour of each segment stroke
				    segmentStrokeColor   : '#fff',
				    // Number - The width of each segment stroke
				    segmentStrokeWidth   : 1,
				    // Number - The percentage of the chart that we cut out of the middle
				    percentageInnerCutout: 50, // This is 0 for Pie charts
				    // Number - Amount of animation steps
				    animationSteps       : 100,
				    // String - Animation easing effect
				    animationEasing      : 'easeOutBounce',
				    // Boolean - Whether we animate the rotation of the Doughnut
				    animateRotate        : true,
				    // Boolean - Whether we animate scaling the Doughnut from the centre
				    animateScale         : false,
				    // Boolean - whether to make the chart responsive to window resizing
				    responsive           : true,
				    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
				    maintainAspectRatio  : false
				    // String - A legend template
<%-- // 				    legendTemplate       : '<ul class=\'<%=name.toLowerCase()%>-legend\'><% for (var i=0; i<segments.length; i++){%><li><span style=\'background-color:<%=segments[i].fillColor%>\'></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>', --%>
				    // String - A tooltip template
<%-- 				    tooltipTemplate      : '<%=value %> <%=label%> users' --%>
			}
// 			showAllTooltips : true
		});

	}
	
// 	Chart.defaults.global.animationEasing = "easeOutBounce";

	
 	  var p_time = <%= request.getParameter("time")%>;
      p_time = p_time==null? 15 : p_time;
      
      $("#lb-time").html(p_time+' min.');
      
      p_time = parseInt(p_time)*60*1000 ; 
      
      
//       console.log("p_time : "+p_time);
 	  
 	
	 /*************** Table ******************/
    function doSearchTable(){
		 
    	$(".content").LoadingOverlay("show");
    	
		$.ajax({
		      type: "POST",
		      dataType: "json",
	        url: cPath+"JsonChannel?action=getDashboardData&t="+_TodayDate.getTime(),
//             url: cPath+"jsp/dashboard/common/json/dashboard.json?t="+_TodayDate.getTime(),
            data: $('#myForm').serialize()
        }).done(function (result) {
//         	var json = result.responseText.evalJSON();
//             $(".content").LoadingOverlay("hide");
            regroupJson(result);
        }).fail(function (jqXHR, textStatus, errorThrown) { 
              // needs to implement if it fails
        }).always(function() {
        	$(".content").LoadingOverlay("hide");
		});
		
		
		
// 		*********** SET TIME *************
		setTimeout(function(){doSearchTable()}, p_time);
		
 	};
 	
 	
 	function regroupJson(result){
 		var ouputJson = {};
 		ouputJson['dashboard'] = result['DASHBOARD_HEADER'];
 		ouputJson['dashboard']['prospect'] = result['DASHBOARD_PROSPECT'];
 		ouputJson['dashboard']['booking'] = result['DASHBOARD_BOOKING'];
 		ouputJson['dashboard']['delivery'] = result['DASHBOARD_DELIVERY'];
 		ouputJson['dashboard']['cancel'] = result['DASHBOARD_CANCEL'];
 		
 		ouputJson['datasets'] = result['DATASETS_HEADER'];
 		ouputJson['datasets']['prospect'] = [];
 		ouputJson['datasets']['booking'] = [];
 		ouputJson['datasets']['delivery'] =[];
 		ouputJson['datasets']['cancel'] = [];
 		ouputJson['datasets']['prospect_trend'] = [];
 		ouputJson['datasets']['cancel_trend'] = [];
 		
 		ouputJson['rankData'] = {
			 'dealers' : [],
			 'values' : []
 		}
 		
 		var values = result['RANKDATA_VALUES'];
 		var dealers = result['RANKDATA_DEALER'];
 		for(var i in values){
 			ouputJson['rankData']['dealers'].push(dealers[i]['dealers']);
 			ouputJson['rankData']['values'].push(values[i]['values']);
 		}
 		
 		/**Dataset */
 		var d_prospect = result['DATASETS_PROSPECT'];
 		var d_booking = result['DATASETS_BOOKING'];
 		var d_delivery = result['DATASETS_DELIVERY'];
 		var d_cancel = result['DATASETS_CANCEL'];
 		for(var i in d_prospect){
 			ouputJson['datasets']['prospect'].push(d_prospect[i]['value']);
 	 		ouputJson['datasets']['booking'].push(d_booking[i]['value']);
 	 		ouputJson['datasets']['delivery'].push(d_delivery[i]['value']);
 	 		ouputJson['datasets']['cancel'].push(d_cancel[i]['value']);
 		}
 		
 		var d_days = result['DATASETS_DAYS'];
 		var tr_prospect = result['DATASETS_PROSPECT_TREND'];
 		var tr_cancel = result['DATASETS_CANCEL_TREND'];
 		ouputJson['days_range'] = [];
 		for(var i in d_days){
 			ouputJson['days_range'].push(d_days[i]['DAYS']);
 			ouputJson['datasets']['prospect_trend'].push(tr_prospect[i]['value']);
 	 		ouputJson['datasets']['cancel_trend'].push(tr_cancel[i]['value']);
 		}
 		
 		
 		//console.log(ouputJson);
 		
 		refreshDashboard(ouputJson);
 		
 	}
	
 	
 	 function refreshDashboard(c_data){

			buildDashboard(c_data);
		
			buildReportGraph(c_data);
			
			buildTrendGraph(c_data);
			
			buildTodayGraph(c_data);
		
			buildMonthlyGraph(c_data);
		
			buildPieGraph(c_data);
 	 }
 	 
 	doSearchTable();
 
	//]]>
</script>        
        
       
    </body>
</html>


