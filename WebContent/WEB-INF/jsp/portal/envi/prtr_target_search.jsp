<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>
	<div class="content-wrapper yung">
		<!-- à¸«à¸±à¸§à¸à¹à¸­         -->
		<section class="content-header">
			<h1>
				<i class="fa fa-industry"></i>&nbsp;&nbsp;PRTR
			</h1>
		</section>
		<!--à¸à¹à¸à¸«à¸²  -->
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Criteria</h3>
						</div>
						<div class="box-body">
							<form class="form-horizontal" id="myForm" commandname="sysParam"
								method="post">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="paramType" class="col-lg-4 control-label">Company</label>
											<div class="col-lg-6">
												<select class="form-control" name="companynameSearch"
													id="companynameSearch">
													<option value="TPAC" >TPAC</option>
													<option value="TPCC">TPCC</option>
												</select>
											</div>
										</div>
									</div>
									
									<div class="col-md-6">
										<div class="form-group">
											<label class="col-md-4 control-label"> Year</label>
											<div class="col-md-6">
												<select class="form-control" id="yearSearch"
													name="yearSearch">
													<%
														for (int i = curr_year; i >= 2012; i--) {
													%>
													<option value="<%=i%>"><%=i%></option>
													<%
														}
													%>
												</select>
											</div>
										</div>
									</div>
									<!-- col-md-6 -->
								</div>

								<div class="row">
									<div class="col-lg-12">
										<div class="form-group ">
											<div class="col-lg-12 text-center">
												<button type="reset" class="btn btn-default">
													<i class="fa fa-refresh"></i> Clear
												</button>
												&nbsp;&nbsp;
												<button type="button" id="searchBtn" class="btn btn-primary"
													onclick='SearchEmissionTotal()'>
													<i class="fa fa-search"></i> Search
												</button>
												&nbsp;&nbsp;
												<button type="button" class="btn btn-success"
													onclick="preAdd();">
													<i class="fa fa-plus"></i> Add
												</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
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
									<fieldset>
									
										<legend>Emission Total</legend>
	
									<div >	
									<label class="control-label">Emission volum Total : </label>  <label id="EmissionVolumTotal_Label" class="control-label">24,227.36 </label>  
									
									<br> 
									<label class="control-label">Transpot volum Total :</label>  <label id="TranspotVolumTotal_Label" class="control-label"> 0</label>   
									
									</div>
									
									</fieldset>
									<div class="table-responsive text-center">
										<table id="myTable"
											class="table table-striped table-bordered ">
											<thead class="bg-green color-palette">
												<tr>
													<th class="text-center">No.</th>
													<th>Name of Chemical substance</th>
													<th class="text-center">Emission volum Total</th>
													<th class="text-center">Transpot volum Total</th>
													<th class="text-center">Air</th>
													<th class="text-center">Water</th>
													<th class="text-center">Solid</th>
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
					<h4 class="modal-title">PRTR</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal"  id="saveform" command="util"
						data-toggle="validator">


					<input id="idForm" name="idForm" type="hidden" >


						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label for="paramType" class="col-lg-4 control-label">Company</label>
									<div class="col-lg-6">
										<select class="form-control" name="CompanyForm" id="CompanyForm" onchange="getDataOnSelect(this.value)">
											<option value="TPAC" selected>TPAC</option>
											<option value="TPCC">TPCC</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label for="paramCode" class="col-lg-4 control-label">Year
									</label>
									<div class="col-lg-6">
										<select class="form-control" name="yearForm" id="yearForm" >
											<%
												for (int i = curr_year; i >= 2012; i--) {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
							</div>
						</div>

						<fieldset>
				
							<!-- Form Name -->
							<legend>Emission Total</legend>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="NameofChemicalLabel">Name
									of Chemical</label>
								<div class="col-md-6">
									<select class="form-control input-md" id="prtrChemicalIdForm" name="prtrChemicalIdForm"  onchange="getDataOnSelectMolecul(this.value)" >

<!-- 										<option selected="selected">Methanol</option> -->
<!-- 										<option>Toluene</option> -->
<!-- 										<option>Ethylene Glycol</option> -->
<!-- 										<option>Formaldehyde</option> -->
<!-- 										<option>Phosphoric acid</option> -->
<!-- 										<option>Benzene</option> -->
<!-- 										<option>NOx</option> -->
										
									</select>

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="MoleculAFormula">Molecul
									a Formula</label>
								<div class="col-md-6">
									<input id="MoleculAFormulaForm" name="MoleculAFormulaForm" type="text"
										placeholder="Molecul a Formula" class="form-control input-md"
										required="" readonly>

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="ConsumptionQuantity ">Consumption
									Quantity </label>
								<div class="col-md-6">
									<input id="cunsumpitonQuantityForm" name="cunsumpitonQuantityForm "
										type="text" placeholder="ConsumptionQuantity "
										class="form-control number">
								</div>
								<label class="col-md-1 control-label" for="ConsumptionQuantity ">
									(kg/year) </label>
							</div>


							<!-- Form Name -->
							<legend>Emission volum (kg/year) :Air</legend>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Combustion">Combustion</label>
								<div class="col-md-4">
									<input id="airCombustionForm" name="airCombustionForm" type="text"
										placeholder="Combustion" class="form-control input-md number">

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Process">Process</label>
								<div class="col-md-4">
									<input id="airProcessFrom" name="airProcessFrom" type="text"
										placeholder="Process" class="form-control input-md number">

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Fugitive">Fugitive</label>
								<div class="col-md-4">
									<input id="airFugitiveForm" name="airFugitiveForm" type="text"
										placeholder="Fugitive" class="form-control input-md number">

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Tank">Tank</label>
								<div class="col-md-4">
									<input id="airTankForm" name="airTankForm" type="text" placeholder="Tank"
										class="form-control input-md number">

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Loading ">Loading
								</label>
								<div class="col-md-4">
									<input id="airLoadingForm" name="airLoadingForm" type="text"
										placeholder="Loading" class="form-control input-md number">

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="WWT">WWT</label>
								<div class="col-md-4">
									<input id="airWwtForm" name="airWwtForm" type="text" placeholder="WWT"
										class="form-control input-md number">

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Spill">Spill</label>
								<div class="col-md-4">
									<input id="airSpillForm" name="airSpillForm" type="text" placeholder="Spill"
										class="form-control input-md number">

								</div>
							</div>





							<!-- Form Name -->
							<legend>Emission volum (kg/year) :Water area</legend>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="WWT">WWT</label>
								<div class="col-md-4">
									<input id="waterWwtForm" name="waterWwtForm" type="text" placeholder="WWT"
										class="form-control input-md number">

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Spill">Spill</label>
								<div class="col-md-4">
									<input id="waterSpillForm" name="waterSpillForm" type="text" placeholder="Spill"
										class="form-control input-md number">

								</div>
							</div>

							<!-- Form Name Solid-->
							<legend>Emission volum (kg/year) :Solid</legend>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Land">Land</label>
								<div class="col-md-4">
									<input id="solidLandForm" name="solidLandForm" type="text" placeholder="Land"
										class="form-control input-md number">

								</div>
							</div>


							<legend>Transpot volum (kg/year)</legend>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Waste">Waste</label>
								<div class="col-md-4">
									<input id="TransportWasteForm" name="TransportWasteForm" type="text" placeholder="Waste"
										class="form-control input-md number">

								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Recycle">Recycle</label>
								<div class="col-md-4">
									<input id="TransportRecycleForm" name="TransportRecycleForm" type="text"
										placeholder="Recycle" class="form-control input-md number">

								</div>
							</div>


							<legend>Remark</legend>

							<!-- Textarea -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="textarea"></label>
								<div class="col-md-4">
									<textarea class="form-control" id="remarkForm" name="remarkForm"></textarea>
								</div>
							</div>
							
							<legend>Status</legend>

							<!-- Textarea -->
							<div class="form-group">
								<label class="col-md-4 control-label" for="textarea"></label>
								<div class="col-md-4">
									<select class="form-control" name="StatusFrom"
													id="StatusFrom">
												
													<option value="Y">Active</option>
													<option value="N">Inactive</option>
												</select>
								</div>
							</div>
							

						</fieldset>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="saveAndUpdatePrtrEmission()">Save</button>
				</div>
			</div>

		</div>
	</div>



	<script type="text/javascript">
		$(function() {
			getDataSelect();
			
			
		});
		function SearchEmissionTotal() {

			dataTable.ajax.url(
					cPath + "/PRTREmission/search?company="
					+ $('#companynameSearch').val() + "&year="
					+ $('#yearSearch').val()).load();
			
// 			dataTable.ajax.reload();
			
			dataTable.ajax.reload( function ( json ) {
				jsonObjReq = json ;
				
				var summaryEmission = 0;
				var summaryTranspot = 0;
				  $.each(json.data, function(key, value) {         
					  summaryEmission = summaryEmission + Number(value.emissionVolumTotal);
					  summaryTranspot = summaryTranspot + Number(value.transpotVolumTotal);
				  });
				$('#EmissionVolumTotal_Label').text(summaryEmission);
				$('#TranspotVolumTotal_Label').text(summaryTranspot);
				
				
				
			} );
		};

		var jsonOnChemical = {
				"id" : "",
				"nameOfChemical" : "",
				"moleculaFormular" : "",
				"casNo" : "",
				"tpccActive" : "",
				"tpacActive" : "",
				"status" : ""
			};
		function getDataSelect() {
			$.ajax({
					method : "GET",
					url : cPath + "/PRTRChemical/getDataOnSelect"
	
				}).done(function(result) {
					jsonOnChemical = result;
					getDataOnSelect($("#CompanyForm").val());
				}).fail(function(jqXHR, textStatus, errorThrown) {
					alert('Error !' );

					
				});
		};
		
		function getDataOnSelect(CompanyType){
// 			  console.log("getDataOnSelect",CompanyType);
			  var temp= jsonOnChemical.data;
			  var $select = $('#prtrChemicalIdForm');                        
			    $select.find('option').remove();                          
			    $.each(temp, function(key, value) {         
			    	if(value.status=='Y'){
			    		if(CompanyType =="TPCC"){
			    			if(value.tpccActive=='A'){
// 			    				 console.log("valueT",value);
				    			 $('<option>').val(value.id).text(value.nameOfChemical).appendTo($select);
				    		}
			    		}else{
			    			if(value.tpacActive=='A'){
// 			    				 console.log("valueF",value);
			    				 $('<option>').val(value.id).text(value.nameOfChemical).appendTo($select);
				    		}
			    			
			    		}
			    		
	 			            
			    	}
			  });
			  getDataOnSelectMolecul($('#prtrChemicalIdForm').val());
		}
		
		function getDataOnSelectMolecul(resultChemicalId){
// 			 console.log("getDataOnSelectMolecul",resultChemicalId);
			 var temp= jsonOnChemical.data;
			    $.each(temp, function(key, value) {         
			    	if(value.id == resultChemicalId){
			    		console.log("valueMoleculAFormulaForm",value.moleculaFormular)
			    		 $('#MoleculAFormulaForm').val(value.moleculaFormular);
			    		 
			    	}
			  });
			
		}
		
		
		var jsonObjReq = {};
		
		var dataTable = $('#myTable')
				.DataTable(
						{
							ajax : cPath + "/PRTREmission/search?company="
									+ $('#companynameSearch').val() + "&year="
									+ $('#yearSearch').val(),
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
										"data" : "emissionVolumTotal",
										"className" : "text-right"
									},
									{
										"data" : "transpotVolumTotal",
										"className" : "text-right"
									},
									{
										"data" : "airTotal",
										"className" : "text-right"
									},
									{
										"data" : "waterTotal",
										"className" : "text-right"
									},
									{
										"data" : "solidTotal",
										"className" : "text-right"
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
										"className" : "text-center",
										"render" : function(row, type, val, meta ) {
// 											console.log(val);
											var htm = '<button type="button" onclick="preUpdatePrtrEmission(\''
													+ val.id
													+ '\')" class="btn btn-box-tool btn-warning btn-table" data-toggle="modal" data-target="#myModal">Edit</button>';
											return htm;
										}
									} ],
									"fnInitComplete" : function(settings, json) {
										EmissionVolumTotal_Label  
										jsonObjReq = json ;
										var summaryEmission = 0;
										var summaryTranspot = 0;
										  $.each(json.data, function(key, value) {         
											  summaryEmission = summaryEmission + Number(value.emissionVolumTotal);
											  summaryTranspot = summaryTranspot + Number(value.transpotVolumTotal);
										  });
										$('#EmissionVolumTotal_Label').text(summaryEmission);
										$('#TranspotVolumTotal_Label').text(summaryTranspot);
										
									},
// 			
							"ordering" : false,
							"paging" : false
						});
		$.fn.dataTable.ext.errMode = 'none';

		
		var jsonObj = {
				"id" : "",
				"prtrChemicalId" : "",
				"cunsumpitonQuantity" : "",
				"airCombustion" : "",
				"airProcess" : "",
				"airFugitive" : "",
				"airTank" : "",
				"airLoading" : "",
				"airWwt" : "",
				"airSpill" : "",
				"waterWwt" : "",
				"waterSpill" : "",
				"solidLand" : "",
				"TransportWaste" : "",
				"TransportRecycle" : "",
				"remark" : "",
				"year" : "",
				"companyCode" : "",
				"emissionVolumTotal" : "",
				"transpotVolumTotal" : "",
				"airTotal" : "",
				"waterTotal" : "",
				"solidTotal" : "",
				"status":""
			};
		
		$('#myModal').on('hidden.bs.modal', function(e) {

			$("#idForm").val("");
			$("#prtrChemicalIdForm").val("");
			$("#CompanyForm").val($("#companynameSearch").val());
			$("#yearForm").val($("#yearSearch").val());
			getDataOnSelect($("#CompanyForm").val());
// 			$("#MoleculAFormulaForm").val(jsonObjReq.data[i]);
			$("#cunsumpitonQuantityForm").val("");
			$("#airCombustionForm").val("");
			$("#airProcessFrom").val("");
			$("#airFugitiveForm").val("");
			$("#airTankForm").val("");
			$("#airLoadingForm").val("");
			
			
			$("#airWwtForm").val("");
			$("#airSpillForm").val("");
			$("#waterWwtForm").val("");
			$("#waterSpillForm").val("");
			$("#solidLandForm").val("");
			
			$("#TransportWasteForm").val("");
			$("#TransportRecycleForm").val("");
			$("#remarkForm").val("");
			$("#StatusFrom").val("Y");

			
		})

		//Pre Add Data on Chemical 
		function preAdd() {
			$('#myModal').modal('show');
			console.log("preAddChemical !");

		}
		
		//Pre Update Data on Chemical  
		function preUpdatePrtrEmission(i) {

			console.log("PreUpdateEmission Result:" , i);

		    $.each(jsonObjReq.data , function(key, value) {         
		    	if(value.id == i){
		    		console.log("value",value)

		    		
		    		$("#idForm").val(value.id);
					$("#CompanyForm").val(value.companyCode);
					$("#yearForm").val(value.year);
					
					getDataOnSelect(value.companyCode);
					$("#prtrChemicalIdForm").val(value.prtrChemicalId);
//		 			$("#MoleculAFormulaForm").val(value);
					$("#cunsumpitonQuantityForm").val(value.cunsumpitonQuantity);
					$("#airCombustionForm").val(value.airCombustion);
					$("#airProcessFrom").val(value.airProcess);
					$("#airFugitiveForm").val(value.airFugitive);
					$("#airTankForm").val(value.airTank);
					$("#airLoadingForm").val(value.airLoading);
					
					
					$("#airWwtForm").val(value.airWwt);
					$("#airSpillForm").val(value.airSpill);
					$("#waterWwtForm").val(value.waterWwt);
					$("#waterSpillForm").val(value.waterSpill);
					$("#solidLandForm").val(value.solidLand);
					
					$("#TransportWasteForm").val(value.TransportWaste);
					$("#TransportRecycleForm").val(value.TransportRecycle);
					$("#remarkForm").val(value.remark);
					$("#StatusFrom").val(value.status);
		    	}
		  });
		    
			
			
			

		}
		
		function saveAndUpdatePrtrEmission() {
// 			alert('ok');
			
			jsonObj.id = $('#idForm').val();
			jsonObj.companyCode = $('#CompanyForm').val();
			jsonObj.year = $('#yearForm').val();
			
			jsonObj.prtrChemicalId = $('#prtrChemicalIdForm').val();
			jsonObj.cunsumpitonQuantity = $('#cunsumpitonQuantityForm').val();
			jsonObj.airCombustion = $('#airCombustionForm').val();
			jsonObj.airProcess = $('#airProcessFrom').val();
			jsonObj.airFugitive = $('#airFugitiveForm').val();
			jsonObj.airTank = $('#airTankForm').val();
			jsonObj.airLoading = $('#airLoadingForm').val();
			jsonObj.airWwt = $('#airWwtForm').val();
			jsonObj.airSpill = $('#airSpillForm').val();
			
			jsonObj.waterWwt = $('#waterWwtForm').val();
			jsonObj.waterSpill = $('#waterSpillForm').val();
			jsonObj.solidLand = $('#solidLandForm').val();
			jsonObj.TransportWaste = $('#TransportWasteForm').val();
			jsonObj.TransportRecycle = $('#TransportRecycleForm').val();
			jsonObj.remark = $('#remarkForm').val();
			jsonObj.status = $('#StatusFrom').val();
			
			var  airTotal   = Number($('#airCombustionForm').val()) + Number($('#airProcessFrom').val()) +Number($('#airFugitiveForm').val()) +Number($('#airTankForm').val()) +Number($('#airLoadingForm').val()) +Number($('#airWwtForm').val()) +Number($('#airSpillForm').val());
			var  waterTotal = Number($('#waterWwtForm').val()) + Number($('#waterSpillForm').val());
			var	 solidTotal = Number($('#solidLandForm').val());
			var  emissionVolumTotal = airTotal + waterTotal +solidTotal ;
			var  transpotVolumTotal = Number($('#TransportWasteForm').val()) + Number($('#TransportRecycleForm').val());
			jsonObj.emissionVolumTotal = emissionVolumTotal;
			jsonObj.transpotVolumTotal = transpotVolumTotal;
			
			jsonObj.airTotal = airTotal;
			jsonObj.waterTotal = waterTotal;
			jsonObj.solidTotal = solidTotal;
			
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
								url : cPath + "/PRTREmission/save"
				
							}).done(function(result) {
				// 				alert('Ok');
								$('#myModal').modal('hide');
								SearchEmissionTotal();
								 $.notify({
									title: "<strong>Success!</strong> ",
									message: " Save successfully"
								});
								 
							}).fail(function(jqXHR, textStatus, errorThrown) {
				 				alert('ERROR');
								$('#myModal').modal('hide');
								SearchEmissionTotal();

							});
				        }
				    }
				});

		}


		
	</script>