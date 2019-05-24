<!DOCTYPE HTML>
 
	<!-- Modal -->
	<div id="editModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
		
		<div class="modal-dialog  modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-edit"></i> Add/Edit
					</h4>
				</div>

				<form class="form-horizontal" id="saveform" action="${cPath}/ffeRegistered/doSave.htm"
					method="post" data-toggle="validator" command="bean"
					data-keyboard="false" data-backdrop="static" >

					<!-- 	           <fieldset class="well"><div class="w  "> -->

					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<h4 class="border-bottom">Equipment</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Department
									</label>
									<div class="col-lg-6">
										 <select class="form-control selectpicker"  title="${_PLEASE_SELECT}" name="deptCode" required>
<%-- 												<option value="">${_PLEASE_SELECT}</option>  --%>
												 <c:forEach var="item" items="${LOV_DEPT}">
											     	<option value="${item.code}">${item.descTH}</option>
											    </c:forEach>
											</select>
									<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
							<div class="col-md-6"></div>

						</div>
						<div class="row">

							<div class="col-md-6">
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Equipment Code</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" name="eqCode" value="" required
											 data-remote="${cPath}/ffeRegistered/verify"  data-remote-error="Equipment Code already exists." >
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Equipment Type</label>
									<div class="col-lg-6">
										<select class="form-control selectpicker" name="eqTypeCode"  title="${_PLEASE_SELECT}" required>
 												<c:forEach var="item" items="${LOV_EQUIPMENT_TYPE}">
											     	<option value="${item.code}">${item.descTH}</option>
											    </c:forEach>
										</select>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Area
										Supervisor</label>
									<div class="col-lg-6">
										<select class="form-control selectpicker" name="areaSup"  
										 	title="${_PLEASE_SELECT}"  multiple >
 												<c:forEach var="item" items="${LOV_DEPT}">
											     	<option value="${item.code}">${item.descTH}</option>
											    </c:forEach>										</select>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Area
										Representative</label>
									<div class="col-lg-6">
										<select class="form-control selectpicker" name="areaRep" title="${_PLEASE_SELECT}"  multiple >
<%-- 											<option value="">${_PLEASE_SELECT}</option> --%>
										</select>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Area
										Section Mgr.</label>
									<div class="col-lg-6">
										<select class="form-control selectpicker" name="areaSec" title="${_PLEASE_SELECT}"  multiple >
<%-- 											<option value="">${_PLEASE_SELECT}</option> --%>
										</select>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Email CC</label>
									<div class="col-lg-6">
										<select class="form-control selectpicker" name="emailCC" title="${_PLEASE_SELECT}"  multiple >
<%-- 											<option value="">${_PLEASE_SELECT}</option> --%>
										</select>
										<div class="help-block with-errors"></div>
									</div>
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<h4 class="border-bottom">Specification</h4>
							</div>
						</div>

						<div class="row">

							<div class="col-lg-6">
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Serial No.</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" name="serialNo" required>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Model</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" name="model" required>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Brand</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" name="brand" required>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Measurement Range</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" value="" name="measureRange">
									</div>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="col-md-12">
								<h4 class="border-bottom">Calibration</h4>
							</div>
						</div>

						<div  class="row">

							<div class="col-lg-6">
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Cal. standard</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" value="" name="calStandard" >
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Serviced By</label>
									<div class="col-lg-6">
<!-- 										<input type="text" class="form-control" value="" name="servicedBy" required> -->
										<select class="form-control selectpicker" name="servicedBy" title="${_PLEASE_SELECT}"  multiple >
 
										</select>
										
										<div class="help-block with-errors"></div>
										
									</div>
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Cal. Time</label>
									<div class="col-lg-6">
										<input type="text" class="form-control number" value="" name="calTime" required>
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-5 control-label">Cal. Unit</label>
									<div class="col-lg-6">
										<select class="form-control selectpicker" name="calUnit" required>
											<option value="M" >Month</option>
											<option value="Y">Year</option>
											<option value="D">Day</option>
										</select>
										<div class="help-block with-errors"></div>
									</div>
								</div>
							</div>
							
						</div>
						
						<div class="row">
							<div class="col-lg-10">
								<div class="form-group  has-feedback">
									<label for="" class="col-lg-3 control-label">Cal. Criteria</label>
									<div class="col-lg-8">
										 <textarea class="form-control" rows="3" style="width: 637px;" id="calCriteria"  name="calCriteria"></textarea>
									</div>
								</div>
							</div>
							
						</div>



					</div>


					<div class="modal-footer">
						<button type="button" class="btn btn-default "
							data-dismiss="modal" >
							<i class="fa fa-times-circle"></i> Close
						</button>
						&nbsp;
						<button type="button" id="saveBtn" class="btn btn-primary"  >
							<i class="fa fa-check-square-o"></i> Save
						</button>

					</div>

				</form>
			</div>
		</div>
	</div>
	

	
	
	
	
	<!-- ##### Modal Desc  -->
	
	<div id="DescModal" class="modal fade" role="dialog"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog  modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-edit"></i>Gas Detector Description
					</h4>
				</div>

				<form class="form-horizontal" id="form" action="userSave.htm"
					method="post" command="userProfile" data-toggle="validator"  >

					<!-- 	           <fieldset class="well"><div class="w  "> -->

					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<h4 class="border-bottom">Equipment</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Department
									</label>
									<div class="col-lg-6">
										<label> XX</label>
									</div>
								</div>
							</div>
							<div class="col-md-6"></div>

						</div>
						<div class="row">

							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Equipment
										Code</label>
									<div class="col-lg-6">
									<label> 3SE-507</label>
									
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Equipment
										Type</label>
									<div class="col-lg-6">
									<label> Gas Detector</label>
										
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Area
										Supervisor</label>
									<div class="col-lg-6">
										<label> Amulet@HH.com</label>
										
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Area
										Representative</label>
									<div class="col-lg-6">
											<label> Amulet22@HH.com</label>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Area
										Section Mgr.</label>
									<div class="col-lg-6">
											<label> Amulet33@HH.com</label>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Email CC</label>
									<div class="col-lg-6">
											<label> AmuletCC@HH.com</label>
									</div>
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<h4 class="border-bottom">Specification</h4>
							</div>
						</div>

						<div class="row">

							<div class="col-lg-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Serial No.</label>
									<div class="col-lg-6">
										<label> 0301311-047</label>
										
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Model</label>
									<div class="col-lg-6">
										<label> Multigas Detector, ITX</label>
										
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Brand</label>
									<div class="col-lg-6">
									<label> Industrial Scientific</label>
										
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Measurement
										Range</label>
									<div class="col-lg-6">
									<label> - </label>
										
									</div>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="col-md-12">
								<h4 class="border-bottom">Calibration</h4>
							</div>
						</div>

						<div class="row">

							<div class="col-lg-6">
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Cal. standard</label>
									<div class="col-lg-6">
										<label> XX</label>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Serviced
										By</label>
									<div class="col-lg-6">
										<label> XX</label>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label class="col-lg-5 control-label">Cal. Time</label>
									<label class="col-lg-5 control-label">Cal. Time</label>
<!-- 									<div class="col-lg-6"> -->
<!-- 										<label> XX</label> -->
<!-- 									</div> -->
								</div>
								<div class="form-group">
									<label for="" class="col-lg-5 control-label">Cal. Time
										Unit</label>
									<div class="col-lg-6">
									<label> Year</label>
										
									</div>
								</div>
							</div>
						</div>



					</div>


					<div class="modal-footer">
						<button type="button" class="btn btn-default "
							data-dismiss="modal">
							<i class="fa fa-times-circle"></i> Close
						</button>
<!-- 						<button type="button" id="viewBtn" class="btn btn-primary" -->
<!-- 							data-dismiss="modal"> -->
<!-- 							<i class="fa fa-check-square-o"></i> Save -->
<!-- 						</button> -->

					</div>

				</form>
			</div>
		</div>
	</div>
	
	
		
	<script>
			
	$(document).ready(function() {

	
	 	$("#saveBtn").click(function(e){
			var _f = $('#saveform').validator('validate');
			if (_f.has('.has-error').length==0) {
		    	doSave();
			} 
		});
		
	 	
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
		
	 	
	});
	</script>
	
	