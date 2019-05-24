<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!-- Modal -->
<div id="editModal" class="modal fade" role="dialog"
	data-keyboard="false" data-backdrop="static">

	<div class="modal-dialog  modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<i class="fa fa-edit"></i> Add/Edit
				</h4>
			</div>

			<form class="form-horizontal" id="saveform"
				action="${cPath}/gasRegistered/doSave.htm" method="post"
				data-toggle="validator" command="bean" data-keyboard="false"
				data-backdrop="static">

				<!-- 	           <fieldset class="well"><div class="w  "> -->

				<div class="box-body">
					<div class="row">
						<div class="col-md-12">
							<h4 class="border-bottom">Equipment</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group  has-feedback ">
								<label for="" class="col-lg-5 control-label">Department
								</label>
								<div class="col-lg-6">
									<select class="form-control selectpicker"
										title="${_PLEASE_SELECT}" name="deptCode" id="e-deptCode" required>
										<%-- 												<option value="">${_PLEASE_SELECT}</option>  --%>
										<c:forEach var="item" items="${LOV_DEPT}">
											<option value="${item.code}">${item.descTH}</option>
										</c:forEach>
									</select>
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
						
							<div class="form-group has-feedback">
									<label for="paramCode" class="col-lg-5 control-label">Status</label>
									<div class="col-lg-6">
										<select class="form-control selectpicker" name="activeFlg"  id="e-activeFlg" required>
						                       	<option value="">${_PLEASE_SELECT}</option>
						                       	<c:forEach var="item" items="${LOV_ACTIVE_TYPE}"> 
											        <option value="${item.code}" ${item.descTH == sysParam.active ? 'selected="selected"' : ''}>${item.descTH}</option>
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
								<label for="" class="col-lg-5 control-label">Equipment
									Code</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" name="eqCode" id="e-eqCode"  value=""
										required data-remote="${cPath}/gasRegistered/verify"
										data-remote-error="Equipment Code already exists."
									>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							
						</div>
						<div class="col-md-6">
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Equipment
									Type</label>
								<div class="col-lg-6">
									<select class="form-control selectpicker" name="eqTypeCode"  id="e-eqTypeCode"
										title="${_PLEASE_SELECT}" required>
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
									<select class="form-control selectpicker" name="areaSup" id="e-areaSup"
										title="${_PLEASE_SELECT}" multiple  data-live-search="true">
										<c:forEach var="item" items="${LOV_SUP_LIST}">
											<option data-subtext="(${item.email})" value="${item.userId}">${item.firstNameTh} ${item.lastNameTh}</option>
										</c:forEach>
									</select>
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Area
									Representative</label>
								<div class="col-lg-6">
									<select class="form-control selectpicker" name="areaRep" id="e-areaRep"
										title="${_PLEASE_SELECT}" multiple data-live-search="true">
										<c:forEach var="item" items="${LOV_REP_LIST}">
											<option data-subtext="(${item.email})" value="${item.userId}">${item.firstNameTh} ${item.lastNameTh}</option>
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
									Section Mgr.</label>
								<div class="col-lg-6">
									<select class="form-control selectpicker" name="areaSec" id="e-areaSec"
										title="${_PLEASE_SELECT}" multiple data-live-search="true">
										<c:forEach var="item" items="${LOV_SEC_LIST}">
											<option data-subtext="(${item.email})" value="${item.userId}">${item.firstNameTh} ${item.lastNameTh}</option>
										</c:forEach>
									</select>
									<div class="help-block with-errors"></div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Email CC</label>
								<div class="col-lg-6">
									<select class="form-control selectpicker" name="emailCC" id="e-emailCC"
										title="${_PLEASE_SELECT}" multiple  data-live-search="true" >
										<c:forEach var="item" items="${LOV_USR_ALL_LIST}">
											<option data-subtext="(${item.email})" value="${item.userId}">${item.firstNameTh} ${item.lastNameTh}</option>
										</c:forEach>
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
									<input type="text" class="form-control" name="serialNo" id="e-serialNo"
										required>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Model</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" name="model" id="e-model" required>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Alarm 1</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" name="alarm1" id="e-alarm1">
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Brand</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" name="brand" id="e-brand" required>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Measurement
									Range</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" 
										name="measureRange" id="e-measureRange">
								</div>
							</div>
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Alarm 2</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" name="alarm2" id="e-alarm2">
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
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Cal.
									standard</label>
								<div class="col-lg-6">
									<input type="text" class="form-control"  
										name="calStandard" id="e-calStandard">
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Service By</label>
								<div class="col-lg-6">
									<!-- 										<input type="text" class="form-control" value="" name="servicedBy" required> -->
<!-- 									<select class="form-control selectpicker" id="e-servicedBy" name="servicedBy" -->
<%-- 										title="${_PLEASE_SELECT}" multiple> --%>

<!-- 									</select> -->
								<input type="text" class="form-control"  name="servicedBy" id="e-servicedBy"  >

<!-- 									<div class="help-block with-errors"></div> -->

								</div>
							</div>
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Service Email</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" 
										name="servicedByEmail" id="e-servicedByEmail">

<!-- 									<div class="help-block with-errors"></div> -->

								</div>
							</div>
							
							
						</div>


						<div class="col-lg-6">
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Cal. Time</label>
								<div class="col-lg-6">
									<input type="text" class="form-control number" value=""
										name="calTime" id="e-calTime" required>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-5 control-label">Cal. Unit</label>
								<div class="col-lg-6">
									<select class="form-control selectpicker" name="calUnit" id="e-calUnit"
										required>
										<option value="M">Month</option>
										<option value="Y">Year</option>
										<option value="D">Day</option>
									</select>
									<div class="help-block with-errors"></div>
								</div>
							</div>
							
							<div class="form-group   has-feedback">
							<label class="col-lg-5 control-label">Last Cal. Date</label>
							<div class="col-lg-6">
								<div class='input-group date' id='f-lastCalDate' >
									<input type='text' class="form-control" id='e-lastCalDateTxt' name='lastCalDate'/> <span
										class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
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
									<textarea class="form-control" rows="3" style="width: 637px;"
										id="e-calCriteria" name="calCriteria"></textarea>
								</div>
							</div>
						</div>

					</div>



				</div>


				<div class="modal-footer">
					<button type="button" class="btn btn-default " data-dismiss="modal">
						<i class="fa fa-times-circle"></i> Close
					</button>
					&nbsp;
					<button type="button" id="saveBtn" class="btn btn-primary">
						<i class="fa fa-check-square-o"></i> Save
					</button>

				</div>
				
				
				 <input type="hidden"  id="e-id" name="id" >
				
			</form>
		</div>
	</div>
</div>




<script>

	$(document).ready(function() {
		
		$('#f-lastCalDate').datepicker({
			format : "dd/mm/yyyy",
// 			viewMode : "months",
// 			minViewMode : "months",
			autoclose:true,
			enableOnReadonly:true
		}); 

		$("#saveBtn").click(function(e) {
			var _f = $('#saveform').validator('validate');
			if (_f.has('.has-error').length == 0) {
				doSave();
			}
		});

		function doSave(e) {
			bootbox.confirm({
				title : "Confirm",
				message : _confirmSaveTxt,
				size : 'small',
				buttons : {
					cancel : {
						label : '<i class="fa fa-times"></i> Cancel'
					},
					confirm : {
						label : '<i class="fa fa-check"></i> Confirm',
						className : 'btn-success'
					}
				},
				callback : function(result) {
					if (result) {
						$('#saveform').submit();
					}
				}
			});
		} ;
		

	});
	
	var EQ_EDIT={};
	
	 EQ_EDIT.loadDetailEdit =  function(id){
		
		
		$("#e-eqCode").attr("data-remote","");
// 		$("#e-eqCode").attr("data-remote", cPath+"/gasRegistered/verify?");
		$("#e-eqCode").prop('disabled', true);
 	
		$.ajax({
	        url: cPath+"/gasRegistered/getEquipmentDetail.json",
	        data: { "id" : id }
	    }).done(function (result) {
	    	
//     		console.log(result);
    		
	    	for (key in result) {
        	    if (result.hasOwnProperty(key)) {
        	        var sval = result[key];
        	        sval = sval==null? '':sval;
        	        $('#e-'+key).val(sval);
        	    }
        	}    
	    	
	    	
			var sel =  result['areaRep']!=null? result['areaRep'].split(','):'';
			$('#e-areaRep').selectpicker('val', sel);
			
			sel =  result['areaSec']!=null? result['areaSec'].split(','):'';
			$('#e-areaSec').selectpicker('val', sel);
			
			sel =  result['areaSup']!=null? result['areaSup'].split(','):'';
			$('#e-areaSup').selectpicker('val', sel);
			
			sel =  result['emailCC']!=null? result['emailCC'].split(','):'';
			$('#e-emailCC').selectpicker('val', sel);
    	
	    	$('.selectpicker').selectpicker('refresh');
    	
       }).fail(function (jqXHR, textStatus, errorThrown) { 
    	   _loader(false);
       });
	
}

</script>

