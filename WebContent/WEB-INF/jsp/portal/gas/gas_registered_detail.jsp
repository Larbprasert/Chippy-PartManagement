<!DOCTYPE HTML>
 

<!-- ##### Modal Desc  -->

<div id="detailModal" class="modal fade" role="dialog"
	data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog  modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">
					<i class="fa fa-list"></i> Gas Detector Detail
				</h4>
			</div>

			<form class="form-horizontal" id="form" action="userSave.htm"
				method="post" command="userProfile" data-toggle="validator">

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
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-deptName"></label>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Status
								</label>
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-statusTxt"></label>
								</div>
							</div>
						
						
						</div>

					</div>
					<div class="row">

						<div class="col-md-6">
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Equipment
									Code</label>
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-eqCode" ></label>

								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Equipment
									Type</label>
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-eqTypeName"></label>

								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Area
									Supervisor</label>
								<div class="col-lg-6 control-detail">
									<p  class="detail-label" id="v-areaSupTxt"></p>

								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Area
									Representative</label>
								<div class="col-lg-6 control-detail">
									<p  class="detail-label" id="v-areaRepTxt"></p>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Area
									Section Mgr.</label>
								<div class="col-lg-6 control-detail">
									<p  class="detail-label" id="v-areaSecTxt"></p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Email CC</label>
								<div class="col-lg-6 control-detail">
									<p  class="detail-label" id="v-emailCCTxt"></p>
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
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-serialNo"></label>

								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Model</label>
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-model"></label>

								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Alarm 1</label>
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-alarm1"></label>

								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Brand</label>
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-brand"></label>

								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Measurement
									Range</label> 
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-measureRange"></label>

								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Alarm 2 </label> 
								<div class="col-lg-6 control-detail ">
									<label  class="detail-label" id="v-alarm2"></label>

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
								<label for="" class="col-lg-5 control-label">Cal. Standard</label>
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-calStandard"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Service By</label>
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-servicedBy"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Service Email</label>
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-servicedByEmail"></label>
								</div>
							</div>
						</div>
						
						<div class="col-lg-6">
							<div class="form-group">
								<label class="col-lg-5 control-label">Cal. Time</label> 
								
<!-- 								<label class="col-lg-5 control-label">Cal. Time</label> -->

								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-calTime"></label>
								</div>
								
							</div>
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Cal. Time Unit</label>
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-calUnitTxt"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-lg-5 control-label">Last Cal. Date</label>
								<div class="col-lg-6 control-detail">
									<label  class="detail-label" id="v-lastCalDateTxt"></label>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-lg-10">
							<div class="form-group  has-feedback">
								<label for="" class="col-lg-3 control-label">Cal. Criteria</label>
								<div class="col-lg-9 control-detail">
										 <p  class="detail-label" id="v-calCriteria" >  </p>
								</div>
							</div>
						</div>

					</div>
		




				</div>


				<div class="modal-footer">
					<button type="button" class="btn btn-default " data-dismiss="modal">
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



<script type="text/javascript">

	var EQ_DETAIL = {};

	EQ_DETAIL.loadDetails = function(id){
	 	
		$.ajax({
            url: cPath+"/gasRegistered/getEquipmentDetail.json",
            data: { "id" : id }
        }).done(function (result) {
        	
//         	console.log(result);
        	for (key in result) {
        	    if (result.hasOwnProperty(key)) {
        	        var sval = result[key];
        	        sval = sval==null? '':sval;
        	        $('#v-'+key).html(sval);
        	    }
        	}    
        	
        	
        	var sel =  result['areaRepTxt']!=null? removeLastComma(result['areaRepTxt']):'';
			$('#v-areaRepTxt').html(sel);
			
			sel =  result['areaSecTxt']!=null? removeLastComma(result['areaSecTxt']):'';
			$('#v-areaSecTxt').html(sel);
			
			sel =  result['areaSupTxt']!=null? removeLastComma(result['areaSupTxt']):'';
			$('#v-areaSupTxt').html(sel);
			
			sel =  result['emailCCTxt']!=null? removeLastComma(result['emailCCTxt']):'';
			$('#v-emailCCTxt').html(sel);
    	
// 	    	$('.selectpicker').selectpicker('refresh');
	    	
	    	
        	
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
		
	}



</script>

