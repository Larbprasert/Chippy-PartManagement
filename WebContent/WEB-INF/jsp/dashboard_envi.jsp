<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp" %>
<body class="${bodySkin}">
<div class="wrapper">   
<%@ include file="she-navbar.jsp"%>
<%@ include file="she-sidebar.jsp"%>


<!--         !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   Start   CONTENT HERE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
   <div class="content-wrapper">
            <section class="content">
            
            
      <div class="row">
      
        <div class="col-lg-6">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">CO2 Emission : [TPAC]
              </h3>
<!--               <div class="box-tools pull-right"> -->
<!--                 <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> -->
<!--                 </button> -->
<!--                 <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
<!--               </div> -->
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="co2_tpac" ></canvas>
              </div>
            </div>
          </div>
        </div> 
        
        <div class="col-lg-6">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">CO2 Emission : [TPCC]
              </h3>
<!--               <div class="box-tools pull-right"> -->
<!--                 <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> -->
<!--                 </button> -->
<!--                 <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
<!--               </div> -->
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="co2_tpcc" ></canvas>
              </div>
            </div>
          </div>
        </div>
        
        
  </div>
          
          <div class="row"  >
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Emission volum : [TPAC] </h3>
					</div>
					<div class="box-body">
						<div class="col-md-12">
							<canvas id="emiss-g-tpcc"  ></canvas>
						</div>
						
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Emission volum : [TPCC] </h3>
					</div>
					<div class="box-body">
						<div class="col-md-12">
							<canvas id="emiss-g-tpac"  ></canvas>
						</div>
						
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
		</div>
		
		
		       
          <div class="row"  >
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Transport volum : [TPAC] </h3>
					</div>
					<div class="box-body">
						<div class="col-md-12">
							<canvas id="tran-g-tpcc"  ></canvas>
						</div>
						
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Transport volum : [TPCC]  </h3>
					</div>
					<div class="box-body">
						<div class="col-md-12">
							<canvas id="tran-g-tpac"  ></canvas>
						</div>
						
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
		</div>
   

     </section>
            
 </div>
 
 <script>
 var tpac_Consumtion
 var tpcc_Consumtion 
 
// function loadChart(){
 var ctx1 = $('#co2_tpac').get(0).getContext('2d');
 	tpac_Consumtion = new Chart(ctx1, {
	    type: 'bar',
	    data: {
	      labels: ["Electricity", "Water Consumption", "Steam consumption"],
	      datasets: []
	    },
	    options: {
	      title: {
	        display: false
// 	        text: 'CO2 Emission (TPAC)'
	      },
	      animation: {
			    onComplete: function () {
			        var ctx = this.chart.ctx;
			        var fontSize = 8;
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

 
 	tpcc_Consumtion = new Chart(document.getElementById("co2_tpcc"), {
	    type: 'bar',
	    data: {
	      labels: ["Electricity", "Water Consumption", "Steam consumption"],
	      datasets: []
	    },
	    options: {
	      title: {
	        display: false
// 	        text: 'CO2 Emission (TPCC)'
	      },
	      animation: {
			    onComplete: function () {
			        var ctx = this.chart.ctx;
			        var fontSize = 8;
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
 
 //
// }
 
 

	new Chart($("#emiss-g-tpac"), {
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
//	        text: 'CO2 Emission (TPAC)'
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
 

	new Chart($("#emiss-g-tpcc"), {
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
//	        text: 'CO2 Emission (TPAC)'
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

	new Chart($("#tran-g-tpac"), {
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
//	        text: 'CO2 Emission (TPAC)'
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

	
	new Chart($("#tran-g-tpcc"), {
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
//	        text: 'CO2 Emission (TPAC)'
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
	
	var jsonObj = {
			"id":"",
			"companyCode":"",
			"fromYear":"",
			"toYear":"",
			"companyName":"",
			"year":""
	}
	var colorArr = ["#1ABC9C","#9B59B6","#2980B9","#27AE60","#DB8034","#2C3E50","#3498DB","#F1C40F","#707B7C","#2ECC71"]
	var labelArr = ["Electricity", ["Water","Consumption"], ["Steam","Consumption"]]
	$("document" ).ready(function() {
		//loadChart();
		serchTPAC_Cons();
		serchTPCC_Cons();
	});
	var chartLayer
	function serchTPAC_Cons(){
		
		if (tpac_Consumtion != null){
			tpac_Consumtion.chart.config.data.datasets = [];
			tpac_Consumtion.chart.config.data.labels = [];
			tpac_Consumtion.update(); 
    	}
		
		jsonObj.companyName= "TPAC";
		jsonObj.fromYear= <%=curr_year - 3 %>;
		jsonObj.toYear= <%=curr_year %>;
		callService().done(function (res) {
			TDATA = res
			for (var j in labelArr ){
				tpac_Consumtion.config.data.labels.push(labelArr[j])
			}
		   	for(var x in res.data){	
		    	var dataset =  addDataSet(x);
		    	tpac_Consumtion.config.data.datasets.push(dataset);
		    	window.tpac_Consumtion.update();
		    }
		});

	
	}
	function serchTPCC_Cons(){
		
		if (tpcc_Consumtion != null){
			tpcc_Consumtion.chart.config.data.datasets = [];
			tpcc_Consumtion.chart.config.data.labels = [];
			tpcc_Consumtion.update(); 
    	}
		
		jsonObj.companyName= "TPCC";
		jsonObj.fromYear= <%=curr_year - 3 %>;
		jsonObj.toYear= <%=curr_year %>;
		callService().done(function (res) {
			//loadChart();
			TDATA = res
			for (var j in labelArr ){
				tpcc_Consumtion.config.data.labels.push(labelArr[j])
			}
		   	for(var x in res.data){	
		    	var dataset =  addDataSet(x);
		    	tpcc_Consumtion.config.data.datasets.push(dataset);
		    	window.tpcc_Consumtion.update();
		    }
		});
	
	}
	var TDATA
	function callService(){
		var promise = $.ajax({
				url: cPath+"/util/getDataChart",
           		data:jsonObj
		   })
		   .done(function (responseData, status, xhr) {
		       // preconfigured logic for success
		   })
		   .fail(function (xhr, status, err) {
		      //predetermined logic for unsuccessful request
		   });

		   return promise;
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
		return newDataset

	}
    function round2Digits( number ) {
    	return Math.round( Math.round( number * 1000 ) / 10 ) / 100;
    };

	
	
</script>
        
        
        
        
        
        
        
        
        <!--         !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   END CONTENT HERE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
        
		
        </div>
        
        <!-- ./wrapper -->
        	
 
       
    </body>
</html>


