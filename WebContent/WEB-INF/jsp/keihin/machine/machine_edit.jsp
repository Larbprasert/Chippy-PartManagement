<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


	<form action="${cPath}/machine/machine_save.htm" method="post"
		id="myForm" data-toggle="validator" novalidate="true">

		<input name="rAction" type="hidden" value="Edit">

<style>
	hr.style {
	/*   border: 1px solid grey; */
	  display: block;
	  margin-top: 0.5em;
	  margin-bottom: 0.5em;
	  margin-left: auto;
	  margin-right: auto;
	  border-style: inset;
	  border-width: 1px;
	}
</style>

<div class="content-wrapper">
		<section class="content-header">
			<h1 class="page-header">Machine - Edit</h1>
		</section> 
		<hr class="style">
		
		<section class="content">
		

			<div class="row">
				<div class="col-lg-3"></div>

				<div class="col-lg-6">
					<div class="panel panel-success">
						<div class="panel-heading">
							<b>Machine :</b> ${machineBean.machine_name}
						</div>


						<div class="panel-body">

							<div class="row">
								<div class="col-lg-4">
									<p class="help-block">
										<b>Machine ID : </b>
									</p>
								</div>
								<div class="col-lg-8">
									<input type="text" class="form-control"
										placeholder="User Type ID" name="machine_ID" id="machine_ID"
										value="${machineBean.machine_ID}" readonly>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-lg-4">
									<p class="help-block">
										<b>Machine Name : </b>
									</p>
								</div>
								<div class="col-lg-8">
									<input type="text" class="form-control"
										placeholder="machine Name" name="machine_name"
										id="machine_name" value="${machineBean.machine_name}">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-lg-4">
									<p class="help-block">
										<b>Production Line : </b>
									</p>
								</div>
								<div class="col-lg-8">
									<select class="form-control"
										name="productionLine.productionLine_ID" required>
										<c:forEach var="item" items="${LOV_PRODUCTIONLINE}">
											<option value="${item.code}"
												${item.code == machineBean.productionLine.productionLine_ID ? 'selected="selected"' : ''}>${item.descTH}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-lg-4">
									<p class="help-block">
										<b>Status : </b>
									</p>
								</div>
								<div class="col-lg-8">
									<select class="form-control" name="activeFlag" required>
										<c:forEach var="item" items="${LOV_ACTIVE_FLG}">
											<option value="${item.code}"
												${item.code == machineBean.activeFlag ? 'selected="selected"' : ''}>${item.descTH}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<br>
							<!-- /.row -->
							<div class="row">
								<div class="col-lg-12">

									<div class="table-title">
										<div class="row">
											<div class="col-sm-12">
												<button type="button" class="btn btn-info add-new"
													id="btnnewPart" onclick="popupAddpart()">
													<i class="fa fa-plus"></i> Add Part
												</button>
												&nbsp;
<!-- 												<button type="button" class="btn btn-danger" id="btnDelPart" -->
<!-- 													onclick="selectDelete()"> -->
<!-- 													<i class="fa fa-trash-o"></i> Delete Part -->
<!-- 												</button> -->
											</div>
										</div>
									</div>


									<table id="part-table"
										class="table table-striped table-hover table-bordered">
										<thead class="bg-green color-palette">
											<tr>
												<th>#</th>
												<th>Part ID</th>
												<th>Part Name</th>
												<th>Qty</th>
												<th>Actions</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
							<!-- /.row -->




						</div>
						<div class="panel-footer">
							<input type="button" value="Save" name="rAction" role="button"
								class="btn btn-info" onclick="doSaveMachine()"> <a
								type="reset" class="btn btn-default"
								href="${cPath}/machine/machine_list.htm" role="button">Cancel</a>
						</div>

					</div>
				</div>
				<div class="col-lg-3"></div>
			</div>
			<!-- /.col-lg-4 -->
			</section>
		</div>

	<%@ include file="machine_add_part.jsp"%>
	<%@ include file="machine_edit_part.jsp"%>

	</form>

	<script type="text/javascript">
// 		var machineID = "${requestObj.machine_ID}";
// 		var jsonObj = {
// 			"machine_ID" : machineID
// 		};

		function doSaveMachine() {

			bootbox.confirm({
				title : "Confirm",
				message : _confirmSaveTxt,
				buttons : {
					cancel : {
						label : '<i class="fa fa-times"></i> Cancel',
						className : 'btn-danger'
					},
					confirm : {
						label : '<i class="fa fa-check"></i> Confirm',
						className : 'btn-success'
					}
				},
				callback : function(result) {
					if (result) {
						$("#myForm").submit();
					}
				}
			});
		}

		function popupAddpart() {
			$('#addPartMachineModal').modal('show');
			$('#qty,#part_ID').val('');
			$('#part_ID').empty();
			$('#part_ID').html('');
			$('#part_ID').selectpicker('deselectAll');
			$('#part_ID').selectpicker("refresh");
		}

		function loadPart() {
			$.ajax({
				url : cPath + "/machine/getPartMachine.json",
				data : {
					machine_ID :  $('#machine_ID').val()
				}
			}).done(function(result) {
				PART_TABLE.clear().draw();
				if (result.recordsTotal > 0) {
					PART_TABLE.rows.add(result.data).draw();
				}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				// needs to implement if it fails
			});

		}

		function getActionColumn(oData,iRow) {
		 	 var htm = '';
// 		  	 		htm += '<button type="button" onclick="doEditPart(\''+ iRow +'\')" class="btn btn-warning btn-sm"><i class="fa fa-edit"></i> Edit</button>  &nbsp;' ;			 	 	
					htm += ' <button type="button" onclick="doEditPart(\''+ oData.part_ID  +'\', \''+ oData.part_name  +'\',\''+ oData.qty + '\')"  class="btn btn-info btn-sm"><i class="fa fa-pencil-square-o"></i> Edit</button>  ' ;
			 	 	
					htm += ' <button type="button" onclick="doDeletePart(\''+ oData.part_ID  +'\', \''+ oData.part_name  +'\')"  class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i> Delete</button>  ' ;
		 	 return htm;
		}
		
		var PART_TABLE = $('#part-table').DataTable({
			autoWidth : false,
			data : [],
			columns : [ {
				"data" : "machine_ID",
				"sWidth" : "30px",
				"fnCreatedCell" : function(nTd, sData, oData, iRow, iCol) {
// 					if (reqStatus != 3) {
						var txt = iRow;
						$(nTd).html(++txt);
// 					}
				}
			}, {
				"data" : "part_ID",
				"sWidth" : "120px"
			}, {
				"data" : "part_name"
			}, {
				"data" : "qty",
				"sWidth" : "100px"
			}, {
				"data" : "part_ID",
				"sWidth" : "100px",
				"fnCreatedCell" : function(nTd, sData, oData, iRow, iCol) {
					$(nTd).html(getActionColumn(oData, iRow));
					// 	        	 var txt = '<button type="button" class="btn btn-info btn-sm" data-toggle="modal" '
					// 	        	 	+' onclick="downloadFile('+ oData.id +')"> <i class="fa fa-download"></i> Download </button>';
					// 	            $(nTd).html(txt);
				}
			} ],
			"aoColumnDefs" : [ {
				"sClass" : "text-center",
				"aTargets" : [ 0, 1, 3, 4 ]
			} ],
			rowCallback : function(row, data) {
			},
			ordering : false,
			destroy : true,
			autoWidth : false,
			"searching" : false,
			"paging" : false
		// 	"info":   false
		});

		function doDeletePart(partID , partName) { 
			 
			bootbox.confirm({
				    title: "Confirm",
				    size: 'small',
				    message: "Confirm delete this part ["+partName+"] ?",
				    buttons: {
				        cancel: {
				            label: '<i class="fa fa-times"></i> Cancel',
				            className: 'btn-danger'
				        },
				        confirm: {
				            label: '<i class="fa fa-check"></i> Confirm',
				            className: 'btn-success'
				        }
				    },
				    callback: function (result) {
				    	 if(result){ 
//		  		        	var del_ids = sel.join(",");	
		 					$.ajax({
		 						method : "POST",
		 						url : cPath + "/machine/partMachineDelete",
		 						data: { 
		 							machine_ID: $('#machine_ID').val(), 
		 							part_ID: partID
		 						}
		 					}).done(function (result) {
		 							alert("Delete successfully !");
		 							loadPart();
		 					});
		 		        }
				    }
				}); 
		}
		
		function doEditPart(partID , partName, qty) { 
			
			$('#part_ID_edit').val(partID);
			$('#part_Name_edit').val(partID+" - "+partName);
    		$('#qty_edit').val(qty);
    		$('#qty_bf_edit').val(qty);
			
			$('#editPartMachineModal').modal('show');
		}
		
		loadPart() ;
</script>