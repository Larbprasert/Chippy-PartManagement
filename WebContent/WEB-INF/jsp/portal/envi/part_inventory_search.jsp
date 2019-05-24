<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp" %>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
<% Random rand = new Random(); %>
<div class="content-wrapper">

	<section class="content-header">
		<h1>
			<i class="fa fa-cubes"></i> Part Inventory
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
						<form  class="form-horizontal" id="myForm">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-4 control-label">Company</label>
										<div class="col-md-6">
											<select class="form-control" name="companyName" id= "companyName">
													<option value="TPAC" selected>TPAC</option>
													<option value="TPCC">TPCC</option>
											</select>
										</div>
									</div>
								</div><!-- col-md-6 -->
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-4 control-label">From Year</label>
										<div class="col-md-6">
											<select class="form-control" name="fromYear">
												<option value="">--- All ---</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
												<option  ><%= i %></option>
											<% } %>
											</select>
										</div>
									</div>
								</div><!-- col-md-6 -->
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-4 control-label">To Year</label>
										<div class="col-md-6">
											<select class="form-control" name="toYear">
												<option value="">--- All ---</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
												<option><%= i %></option>
											<% } %>
											</select>
										</div>
									</div>
								</div> 
							</div><!-- row -->
							<div class="row">
								<div class="col-md-12 text-center">
									<button type="reset" class="btn btn-default" onclick="doClear()">
										<i class="fa fa-refresh"></i> Clear
									</button>&nbsp;&nbsp;
									<button type="button" id="searchBtn" class="btn btn-primary" onclick="doSearch()">
										<i class="fa fa-search"></i>
										Search
									</button>&nbsp;&nbsp;
									<button type="button" class="btn  btn-success"  onclick="doAdd()">
										<i class="fa fa-plus"></i> 
										Add
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
						<h3 class="box-title">Result</h3>
					</div>
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<table id="result-table"  class="table table-striped table-bordered" >
									<thead class="bg-green color-palette">
										<tr>
											<th class="text-center" rowspan="2" >Year</th>
											<th class="text-center" rowspan="2">Product</th>
											<th class="text-center" colspan="3">
												Electrical Consumption
											</th>
											<th class="text-center" colspan="3">
												Water Consumption
											</th>
											<th class="text-center" colspan="3">
												Steam Consumption
											</th>
											<th class="text-center" rowspan="2">Total</th>
											<th class="text-center" rowspan="2" class="text-center">Action</th>
										</tr>
										<tr>
											<th class="text-center">
												Consumption
											</th>
											<th class="text-center">
												CO2 emission
											</th>
											<th class="text-center">
												Kg-CO2/Ton Product
											</th>
											
											<th class="text-center">
												Consumption
											</th>
											<th class="text-center">
												CO2 emission
											</th>
											<th class="text-center">
												Kg-CO2/Ton Product
											</th>
											
											
											<th class="text-center">
												Consumption
											</th>
											<th class="text-center">
												CO2 emission
											</th>
											<th class="text-center">
												Kg-CO2/Ton Product
											</th>
										</tr>
									</thead>
									 
								</table>
							</div> <!-- col-md-12 -->
						</div> <!-- row -->
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
		</div>
		<!-- /.row -->
	</section>

</div>

<!-- Modal Add/Edit -->
<div id="myModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog" >

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"><i class="fa fa-edit"></i> Add/Edit</h4>
			</div>
			<form class="form-horizontal" id="saveform" action="${cPath}/util/doSave.htm" 
			method="post" command="util" data-toggle="validator">
				<div class="modal-body">
					<div class="form-group has-feedback">
						<label class="col-sm-4 control-label">Company</label>
<!-- 						<span class="glyphicon glyphicon-star" aria-hidden="true"></span> -->
						<div class="col-sm-6">
									<input id="id" type="hidden"  name="id" >
									<select class="form-control" name="companyCode" id= "company-e" required>
											<option value="" >${_PLEASE_SELECT}</option>
											<option value="TPAC">TPAC</option>
											<option value="TPCC">TPCC</option>
									</select>
									 <div class="help-block with-errors"></div>
						</div>
					</div>
					
					<div class="form-group has-feedback">
						<label class="col-sm-4 control-label">Year</label>
						<div class="col-sm-6">
							<select class="form-control" name="year"  id="year-e" data-remote-error="This year already exists."  
							   required>
											<option value="" >${_PLEASE_SELECT}</option>
												<% for(int i=curr_year;i>=start_year;i--){ %>
													<option><%= i %></option>
												<% } %>
											</select>
<!-- 							 <span class="glyphicon form-control-feedback" aria-hidden="true"></span> -->
							<div class="help-block with-errors"></div>
						</div>
					</div>
					
					
					<div class="form-group  has-feedback">
						<label class="col-sm-4 control-label">Product</label>

						<div class="col-sm-6">
							<input type="text" class="form-control number" name="productVal" id="productVal" required>
						    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="form-group   has-feedback">
						<label class="col-sm-4 control-label">Electrical (Consumption)</label>

						<div class="col-sm-6"> 
							<input type="text" class="form-control number" name="elecConVal"  id="elecConVal" required>
							 <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
							<div class="help-block with-errors"></div></div>
						<label class="col-sm-2 text-left">kwh</label>
					</div>
					<div class="form-group   has-feedback">
						<label class="col-sm-4 control-label">Water (Consumption)</label>

						<div class="col-sm-6">
							<input type="text" class="form-control number" name="waterConVal"  id="waterConVal" required>
							 <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
							<div class="help-block with-errors"></div></div>
						<label class="col-sm-2 text-left">m2</label>
					</div>
					<div class="form-group   has-feedback">
						<label class="col-sm-4 control-label">Steam (Consumption)</label>

						<div class="col-sm-6">
							<input type="text" class="form-control number" name="steamConVal"   id="steamConVal" required>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
							<div class="help-block with-errors"></div></div>
						<label class="col-sm-2 text-left">Mwh</label>
						
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="saveBtn" >Save</button>
				</div>
			
			</form>
		</div>

	</div>
</div>

<script>

	
	var rsTable = $('#result-table').DataTable({
// 		autoWidth: false,
		data:[],
	    columns: [
			{ "data": "year" }, 
			{ "data": "productVal", "render": _renderNumber(2) }, 
			{ "data": "elecConVal", "render": _renderNumber(2) },     
			{ "data": "elecCo2Val", "render": _renderNumber(2) },     
			{ "data": "elecCo2TonVal", "render": _renderNumber(2) },  
			{ "data": "waterConVal" , "render": _renderNumber(2)},    
			{ "data": "waterCo2Val", "render": _renderNumber(2) },    
			{ "data": "waterCo2TonVal", "render": _renderNumber(2) }, 
			{ "data": "steamConVal", "render": _renderNumber(2) },    
			{ "data": "steamCo2Val" , "render": _renderNumber(2)},    
			{ "data": "steamCo2TonVal", "render": _renderNumber(2) },
			{ "data": "total" , "render": _renderNumber(2) },
			{ 
	     		"data": "id"
// 		        ,"sWidth": "60px"
		        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" onclick="doEdit('+ iRow+')"> <i class="fa fa-edit"></i> edit </button>';
		            $(nTd).html(txt);
		        } 
            }
	    ],
	      "aoColumnDefs": [
	      { "sClass": "text-center", "aTargets": [0,12] },
	      { "sClass": "text-right", "aTargets": [1,2,3,4,5,6,7,8,9,10,11] }
	    ],
	    rowCallback: function (row, data) {}, 
	    ordering: false, 
   	   	destroy: true 
	 });
	 
	
	var T_DATA = {};
	function doSearch(){
		$.ajax({
            url: cPath+"/util/getDataTable.json",
            data: $('#myForm').serialize()
        }).done(function (result) {
            rsTable.clear().draw();
            if(result.recordsTotal>0){
            	T_DATA = result.data;
	            rsTable.rows.add(result.data).draw();
            }else{
//             	bootbox.alert({
// 				    message: "No Data Found!",
// 				    size: 'small'
// 				});
            }
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
		
		$("#rs_table").show();
		
 	};
 	

// 	function doSearch(){
		
		
// 		$("#rs_table").show();
// 	}
	
	function doAdd(){
		
		$('#saveform').validator('destroy');
		$('#company-e,#year-e,#id,#productVal,#elecConVal,#steamConVal,#waterConVal').val('');
		$('#company-e').prop('disabled', false);
		$('#year-e').prop('disabled', false);
		$('#myModal').modal('show');
	}
	
	function doEdit(rec){
		$('#saveform').validator('destroy');
		
		$('#company-e').val(T_DATA[rec]['companyCode']);
		$('#year-e').val(T_DATA[rec]['year']);
		 
		$('#id').val(T_DATA[rec]['id']);
		$('#productVal').val(T_DATA[rec]['productVal']);
		$('#elecConVal').val(T_DATA[rec]['elecConVal']);
		$('#steamConVal').val(T_DATA[rec]['steamConVal']);
		$('#waterConVal').val(T_DATA[rec]['waterConVal']);
		
		$('#company-e').prop('disabled', true);
		$('#year-e').prop('disabled', true);
		
		
		$(".error").removeClass("error");
		
		$('#myModal').modal('show');
	}
	
 	function doClear(){
		$("#rs_table").hide();
	}
 	
 	
 	function doSave(e){
		bootbox.confirm({
		    title: "Confirm",
		    message: _confirmSaveTxt,
		    size: 'small',
		    buttons: {
		        cancel: {
		            label: '<i class="fa fa-times"></i> Cancel'
		        },
		        confirm: {
		            label: '<i class="fa fa-check"></i> Confirm',
		            className: 'btn-success'
		        }
		    },
		    callback: function (result) {
		        if(result){
		        	$('#saveform').submit();
		        }
		    }
		});
	};
	
// 	$('#saveform').validate({
//         rules: {
//             year: {
//                 remote: {
//                     url: "available.php",
//                     type: "post",
//                     data: {
//                       user_nickname: function() {
//                         return $( "#user_nickname" ).val();
//                       }
//                     }
//                   }               
//             }
//         },
//         messages:{
//             user_nickname: {
//                 remote: "Username already taken"
//             }
//         }
//     });

		var _status = '${param["status"]}';
		var _id = '${param["id"]}';
		
// 		console.log('companyCode : '+'${companyCode}');

		if(_status=="S"){
		    if(_id!=''){
		    	doSearch();
		    }
		    $.notify({
					title: "<strong>Success!</strong> ",
					message: " Save successfully"
				});
		    
		}
		
	
// 	function verifyDup(){
 		
// 		$.ajax({
// 	     url: cPath+"/util/verify",
// 	     data: {  "companyCode" : companyCode , "year" : year}
// 		}).done(function (result) {
	 	
// 		 	console.log(result);
		 	
// 		 }).fail(function (jqXHR, textStatus, errorThrown) { 
// 		          // needs to implement if it fails
// 	   });
	
 		
// 		return false;
// 	}
	
 	$("#saveBtn").click(function(e){
		var _f = $('#saveform').validator('validate');
		if (_f.has('.has-error').length==0) {
			
// 			if(verifyDup()){
	    		doSave();
// 			}
		} 
	});

	 
</script>
