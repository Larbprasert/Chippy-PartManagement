<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


 <style>
	.content-wrapper {
/* 		background-image: url(${cPath}/resources/images/tp/Home_logo.png); */
/* 		background-repeat: no-repeat; */
/* 		background-position: center center; */
/* 		background-size: 50%; */
/* 		background-attachment: fixed; */
	}
	
	.small-box h3{
		font-size: 50px;
	}
	
	.small-box p{
	    font-size: 20px;
	}
	
</style>


<div class="content-wrapper">
		
		<section class="content-header">
			<h1 class="page-header">Dashboard</h1>
		</section> 
		
  <section class="content">
		
		<div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3  id="new-txt">0</h3>

              <p>New Request</p>
            </div>
            <div class="icon">
              <i class="fa  fa-plus-circle"></i>
            </div>
<!--             <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a> -->
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3  id="process-txt">0</h3>

              <p>In Process</p>
            </div>
            <div class="icon">
              <i class="fa fa-retweet"></i>
            </div>
<!--             <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a> -->
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3 id="com-txt">0</h3>

              <p>Complete</p>
            </div>
            <div class="icon">
              <i class="fa fa-check-square-o"></i>
            </div>
<!--             <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a> -->
          </div>
        </div>
   
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3 id="sum-txt">0</h3>

              <p>Summary</p>
            </div>
            <div class="icon">
              <i class="fa fa-pie-chart"></i>
            </div>
<!--             <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a> -->
          </div>
        </div>
   
      </div>
		
		<div class="row">
		
		<div class="col-lg-6">
        
		<div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Request Type Percent (%)</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
<!--                 <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-lg-12">
                  <div class=" ">
                    <canvas id="pieChart" height="143" width="206" style="width: 206px; height: 143px;"></canvas>
                  </div>
                </div>
                 
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-body -->
            <!-- <div class="box-footer no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="#">United States of America
                  <span class="pull-right text-red"><i class="fa fa-angle-down"></i> 12%</span></a></li>
                <li><a href="#">India <span class="pull-right text-green"><i class="fa fa-angle-up"></i> 4%</span></a>
                </li>
                <li><a href="#">China
                  <span class="pull-right text-yellow"><i class="fa fa-angle-left"></i> 0%</span></a></li>
              </ul>
            </div> -->
            <!-- /.footer -->
          </div>
          </div>
          
          
          
          
        <div class="col-lg-6">
		<div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title">Part Stock Top 5 Usage</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
<!--                 <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button> -->
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin" id="top-table">
                  <thead>
                  <tr>
                    <th  class="text-center">No.</th>
                    <th class="text-center">Part ID</th>
                    <th class="text-center">Part Name</th>
                    <th class="text-center">Total Qty.</th>
                    <th class="text-center">Total Price</th>
                  </tr>
                  </thead>
                  
                  <tbody>
                   
                   
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
             
          </div>
          
          </div>
		
		
        
          </div>
          
		
</section>

		
		</div>

</body>
</html>

		
		
		
		<script type="text/javascript">
		

		function loadDash(){
			$.ajax({
		        url: cPath+"/request/getDashBoard.json"
		    }).done(function (result) {
		        if(result.code=200){
		        	
// 		        	console.log(result.data);
		        	
		        	var r_count = result.data.request_count
		        	$("#new-txt").html(r_count['Create'])
		        	$("#process-txt").html(r_count['On_Process'])
		        	$("#com-txt").html(r_count['Complete'])
		        	$("#sum-txt").html(r_count['Summary'])
		        	
		        	buildTop(result.data.part_top_5);
		        	
		        	buildPie(result.data.request_type);
		        }
		      }).fail(function (jqXHR, textStatus, errorThrown) { 
		            // needs to implement if it fails
		      });
			
		}


		function buildPie(data){
			var ctx = document.getElementById('pieChart').getContext('2d');
			
			var data_new = {
				labels : [],
				datasets:[]
			}
		  
			
			$.each( data, function( key, value ) {
				  data_new.datasets.push(value['Percentage']);
				  data_new.labels.push(value['requesttype_name']);
// 				  data_new.backgroundColor.push(palette[context.dataIndex % palette.length]);
		    });
				
// 			 console.log(data_new);
			 var palette = [
// 			                'rgb(255, 159, 64)',
			                'rgb(255, 205, 86)',
			                'rgb(0, 163, 51)',
			                'rgb(54, 162, 235)',
			                'rgb(153, 102, 255)',
			                'rgb(201, 203, 207)',
			                'rgb(0,0,255)'
			               ];

			              
			var myChart = new Chart(ctx, {
			    type: 'pie',
			    data: {
			        labels: data_new.labels,
			        datasets: [{
			            data: data_new.datasets,
			            backgroundColor: palette
			        }] 
			    }
			});
			
		}
		
		
		function buildTop(data){
// 			for()
			var i = 1;
			$.each( data, function( key, value ) {
// 				  console.log( key + ": " + value );
				  
				  $('#top-table').find('tbody').append(
						 "<tr> "+
		                 "  <td class='text-center'>"+(i++)+"</td> "+
		                 "  <td class='text-center'>"+value['part_id']+"</td> "+
		                 "  <td>"+value['part_name']+"</td> "+
		                 "  <td class='text-center'>"+value['total_use']+"</td> "+
		                 "  <td class='text-center'>"+value['total_cost']+"</td> "+
		                 "</tr>  "
				  );
				  
		    });
				
				
		}
		
		
		 loadDash();
		</script>
		
