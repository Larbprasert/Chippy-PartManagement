<!-- TODO  Delete & ALert -->


<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
	
	<div class="content-wrapper yung">
		<section class="content-header">
			<h1>
				<i class="fa fa-flask"></i>&nbsp;&nbsp;Target Chemical List 
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
							<form class="form-horizontal">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label class="col-md-4 control-label">Name of
												Chemical</label>
											<div class="col-md-6">
												<input name="NameOfChemicalSearch" id="NameOfChemicalSearch"
													class="form-control">
											</div>
										</div>
									</div>
									<!-- col-md-6 -->

									<div class="col-md-6">
										<div class="form-group">
											<label class="col-md-4 control-label">Status</label>
											<div class="col-md-6">
												<select class="form-control" name="activeSearch"
													id="activeSearch">
													<option value="" selected="selected"> All</option>
													<option value="Y">Active</option>
													<option value="N">Inactive</option>
												</select>
											</div>
										</div>
									</div>
									<!-- col-md-4 -->
								</div>
								<!-- row -->
								<div class="row">
									<div class="col-md-12 text-center">
										<button type="reset" class="btn btn-default"
											onclick="doClear()">
											<i class="fa fa-refresh"></i> Clear
										</button>
										&nbsp;&nbsp;
										<button type="button" id="searchBtn" class="btn btn-primary"
											onclick="searchChemical()">
											<i class="fa fa-search"></i> Search
										</button>
										&nbsp;&nbsp;
										<button type="reset" class="btn btn-success"
											onclick="preAdd()">
											<i class="fa fa-plus"></i> Add
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



			<!--à¸à¸¥à¸¥à¸±à¸à¸à¹  -->
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Result</h3>
						</div>
						<div class="box-body">
							<div class="row">
								<div class="col-md-12">
									<!-- 								<fieldset> -->
									<!-- 									<legend>List of Target Chemical.</legend> -->

									<!-- 								</fieldset> -->
									<div class="table-responsive">

										<table class="table table-striped table-bordered "
											id="myTable">
											<thead class="bg-green color-palette">
												<tr>
													<th class="text-center">No.</th>
													<th>Name of Chemical substance</th>
													<th class="text-center">Molecula Formula</th>
													<th class="text-center">CAS No.</th>
													<th class="text-center">TPCC</th>
													<th class="text-center">TPAC</th>
													<th class="text-center">Status</th>

													<th>Edit</th>

												</tr>
											</thead>

										</table>
									</div>
								</div>
							</div>



						</div>
					</div>
				</div>
			</div>
		</section>
	</div>


	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Chemical</h4>
				</div>
					<form class="form-horizontal" id="saveform" command="util"
						data-toggle="validator">
				<div class="modal-body">

						<fieldset>
							<input type="hidden" class="form-control input-md" id="idFrom"
								name="idFrom">

							<!-- 						<legend></legend> -->
							<div class="row">
								<div class=col-md-8>
									<div class="form-group">
										<label class="col-md-6 control-label" for="M4">Name of
											Chemical substance</label>
										<div class="col-md-6  has-feedback  ">
											<input type="text" class="form-control input-md" required="required"
												placeholder="Name of Chemical substance"
												id="NameOfChemicalSubstanceFrom"
												name="NameOfChemicalSubstanceFrom">
												<div class="help-block with-errors"></div>
										</div>
									</div>
								</div>
								<div class=col-md-4>
									<div class="form-group"></div>
								</div>
							</div>

							<div class="row">
								<div class=col-md-8>
									<div class="form-group  ">
										<label class="col-md-6 control-label" for="M4">Nolecula
											Formula </label>
										<div class="col-md-6 has-feedback">
											<input class="form-control input-md" type="text" required="required"
												placeholder="MoleculaFormula" id="MoleculaFormulaFrom"
												name="MoleculaFormulaFrom">
												<div class="help-block with-errors"></div>
										</div>
									</div>
								</div>
								<div class=col-md-4></div>
							</div>

							<div class="row">
								<div class=col-md-8>
									<div class="form-group ">
										<label class="col-md-6 control-label" for="M4">CAS No.
										</label>
										<div class="col-md-6 has-feedback ">
											<input type="text" placeholder="CAS No" required="required"
												class="form-control input-md" id="CASNoFrom"
												name="CASNoFrom">
												<div class="help-block with-errors"></div>
										</div>
									</div>
								</div>
								<div class=col-md-4>
									<div class="form-group"></div>
								</div>
							</div>

							<div class="row">
								<div class=col-md-8>
									<div class="form-group">
										<label class="col-md-6 control-label" for="M4">TPCC</label>
										<div class="col-md-6">
											<select class="form-control" name="TPCCActiveFrom"
												id="TPCCActiveFrom">
												<option value="A" selected>Active</option>
												<option value="IA">Inactive</option>
											</select>
										</div>
									</div>
								</div>
								<div class=col-md-4>
									<div class="form-group"></div>
								</div>
							</div>

							<div class="row">
								<div class=col-md-8>
									<div class="form-group">
										<label class="col-md-6 control-label" for="M4">TPAC </label>
										<div class="col-md-6">
											<select class="form-control" name="TPACActiveFrom"
												id="TPACActiveFrom">
												<option value="A" selected>Active</option>
												<option value="IA">Inactive</option>
											</select>
										</div>
									</div>
								</div>
								<div class=col-md-4>
									<div class="form-group"></div>
								</div>
							</div>

							<div class="row">
								<div class=col-md-8>
									<div class="form-group">
										<label class="col-md-6 control-label" for="M4">Status
										</label>
										<div class="col-md-6">
											<select class="form-control" name="StatusFrom"
												id="StatusFrom">
												<option value="Y" selected>Active</option>
												<option value="N">Inactive</option>
											</select>
										</div>
									</div>
								</div>
								<div class=col-md-4>
									<div class="form-group"></div>
								</div>
							</div>

						</fieldset>

				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-default" style=" float: left; " data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="saveChemical()">Save</button>
				</div>
			
			</form>
			
			</div>

		</div>
	</div>



	<script type="text/javascript">
		//Dev : Wongwithit
		$(function() {

		});

		var dataTable = $('#myTable')
				.DataTable(
						{
							ajax : cPath + "/PRTRChemical/search?name="
									+ $('#NameOfChemicalSearch').val()
									+ "&status=" + $('#activeSearch').val(),
							columns : [
									{
										"data" : "id",
										"fnCreatedCell" : function(nTd, sData,
												oData, iRow, iCol) {
											var txt = iRow;
											$(nTd).html(txt + 1);
										}
									},
									{
										"data" : "nameOfChemical"
										
									},
									{
										"data" : "moleculaFormular",
										"className": "text-center"
									},
									{
										"data" : "casNo",
										"className": "text-center"
									},
									{
										"data" : "tpccActive",
										"className": "text-center",
										"render" : function(val, _, obj) {
											var htm = '';
												if(val=='A'){
													htm = 'X';
												}else{
													htm = ' ';
												}
											return htm;
										}
										
									},
									{
										"data" : "tpacActive",
										"className": "text-center",
										"render" : function(val, _, obj) {
											var htm = '';
												if(val=='A'){
													htm = 'X';
												}else{
													htm = ' ';
												}
											return htm;
										}
											
									},
									{
										"data" : "status",
										"className": "text-center",
										"render" : function(val, _, obj) {
											var htm = '';
												if(val=='Y'){
													htm = 'Active';
												}else{
													htm = 'Inactive';
												}
											return htm;
										}
										
									},
									{
										"data" : "id",
										"className": "text-center",
										"render" : function(val, _, obj) {
											var htm = '<button type="button" onclick="preUpdateChemical(\''
													+ obj.id
													+ '\',\''
													+ obj.nameOfChemical
													+ '\', \''
													+ obj.moleculaFormular
													+ '\',\''
													+ obj.casNo
													+ '\',\''
													+ obj.tpccActive
													+ '\',\''
													+ obj.tpacActive
													+ '\',\''
													+ obj.status
													+ '\')" class="btn btn-box-tool btn-warning btn-table" data-toggle="modal" data-target="#myModal">Edit</button>';
// 											htm += ' <button type="button" class="btn btn-box-tool btn-danger btn-table" onclick="deleteChemical(\''
// 													+ obj.id
// 													+ '\')">Delete</button> '
											return htm;
										}
									} ],
// 							ordering : false,
							"paging" : false
						});
		$.fn.dataTable.ext.errMode = 'none';

		var jsonObj = {
			"id" : "",
			"nameOfChemical" : "",
			"moleculaFormular" : "",
			"casNo" : "",
			"tpccActive" : "",
			"tpacActive" : "",
			"status" : ""
		};

		$('#myModal').on('hidden.bs.modal', function(e) {

			$("#idFrom").val("");
			$("#NameOfChemicalSubstanceFrom").val("");
			$("#MoleculaFormulaFrom").val("");
			$("#CASNoFrom").val("");

			$("#TPCCActiveFrom").val("A");
			$("#TPACActiveFrom").val("A");
			$("#StatusFrom").val("Y");
			$('#saveform').validator('destroy');
			$('#saveform').validator();
			
		})

		//Pre Add Data on Chemical 
		function preAdd() {
			$('#myModal').modal('show');
			console.log("preAddChemical !");

		}

		//Pre Update Data on Chemical  
		function preUpdateChemical(idFrom, nameOfChemicalFrom,
				moleculaFormularFrom, casNoFrom, tpccActiveFrom,
				tpacActiveFrom, activeFlgFrom) {

			console.log("PreUpdateChemical :" + idFrom);
			
			
			$("#idFrom").val(idFrom);
			$("#NameOfChemicalSubstanceFrom").val(nameOfChemicalFrom);
			$("#MoleculaFormulaFrom").val(moleculaFormularFrom);
			$("#CASNoFrom").val(casNoFrom);

			$("#TPCCActiveFrom").val(tpccActiveFrom);
			$("#TPACActiveFrom").val(tpacActiveFrom);
			$("#StatusFrom").val(activeFlgFrom);

		}

		//Insert Data on Chemical 
		function saveChemical() {

			jsonObj.id = $('#idFrom').val();
			jsonObj.nameOfChemical = $('#NameOfChemicalSubstanceFrom').val();
			jsonObj.moleculaFormular = $('#MoleculaFormulaFrom').val();
			jsonObj.casNo = $('#CASNoFrom').val();
			jsonObj.tpccActive = $('#TPCCActiveFrom').val();
			jsonObj.tpacActive = $('#TPACActiveFrom').val();
			jsonObj.status = $('#StatusFrom').val();

// 			console.log("PreUpdateChemical :", jsonObj);

			var _f = $('#saveform').validator('validate');
 			if (_f.has('.has-error').length==0) {
 				
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
 				        	$.ajax({
 								method : "POST",
 								data : jsonObj,
 								url : cPath + "/PRTRChemical/save"
 				
 							}).done(function(result) {
 				// 				alert('Ok');
 								$('#myModal').modal('hide');
 								searchChemical();
 								 $.notify({
 									title: "<strong>Success!</strong> ",
 									message: " Save successfully"
 								});
 								 
 							}).fail(function(jqXHR, textStatus, errorThrown) {
 				 				alert('ERROR');
 								$('#myModal').modal('hide');
 								searchChemical();

 							});
 				        }
 				    }
 				});
 		    	
 			} 

		}

		//Update Data on Chemical  
		function updateChemical() {
			alert('updateChemical');
		}

		//Search Data on Chemical  
		function searchChemical() {
			console.log("SearchChemical :  name="
					+ $('#NameOfChemicalSearch').val() + " status="
					+ $('#activeSearch').val());
			dataTable.ajax.url(
					cPath + "/PRTRChemical/search?name="
							+ $('#NameOfChemicalSearch').val() + "&status="
							+ $('#activeSearch').val()).load();

		}

		//Delete Data on Chemical  
// 		function deleteChemical() {

// 			bootbox.confirm({
				
			
// 				    title: "Confirm",
// 				    message: "Do you want to delete the data?",
// 				    size: 'small',
// 				    className: 'bb-alternate-modal',
// 				    buttons: {
// 				        cancel: {
// 				            label: '<i class="fa fa-times"></i> Cancel',
// 				            className: 'btn-danger'
// 				        },
// 				        confirm: {
// 				            label: '<i class="fa fa-check"></i> Confirm',
// 				            className: 'btn-success'
// 				        }
// 				    },
// 				    callback: function (result) {
// 				        if(result){    alert('Delete Success !');    }
//  				    }
// 				});

// 		}
		//Validate Data before Save    
		function ValidateChemical() {

		}
	</script>