<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ajax-bootstrap-select/1.4.5/css/ajax-bootstrap-select.min.css">


<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/ajax-bootstrap-select/1.4.5/js/ajax-bootstrap-select.min.js"></script>


		 <!-- Modal -->
		<div id="editPartMachineModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      
		      <div class="modal-header">
		      	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>        
		        <h4 class="modal-title"><i class="fa fa-wrench"></i> Edit Part</h4>
		      </div>
		      
		      <div class="modal-body">
		      
<!-- 		      <form action="#" id="editPartForm"  method="post" > -->
		      
		        <div class="row"> 
		        	<div class="col-lg-6">
				        <div class="form-group">
								<label >Part Name</label>
		   						<input   type="hidden"  name="part_ID_edit" id="part_ID_edit" value="">
		   						<input   type="text" class="form-control" name="part_Name_edit" id="part_Name_edit" value="" readonly="readonly">
<!-- 								<select id="part_ID_edit" class="form-control selectpicker with-ajax" data-live-search="true"></select> -->
								
<!-- 			      			</div> -->
						</div>
					</div>
					

					<div class="col-lg-6">
						<div class="form-group">
	   						<label >Qty. <b style="color: red;">*</b></label>
	   						<input   type="text" class="form-control number text-right" name="qty_edit" id="qty_edit" value="">
	   						<input   type="hidden" class="form-control number text-right" name="qty_bf_edit" id="qty_bf_edit" value="">
<%-- 				   						<input type="text" class="form-control" name="machine_ID" id="machine_ID" value="${machineBean.machine_ID}" > --%>
						</div>
					</div>
				</div>

		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Close</button>
		        <button type="button" class="btn btn-success" id="editPartSubmit" onclick="actionSubmitPart()"><i class="fa fa-check-square-o"></i> Update</button>
		      </div>
		    </div>
		
		  </div>
		</div>
		
  
  <script type="text/javascript">
  var machineID = $('#machine_ID').val();
    
        $(document).ready(function() {
 	  });

        
        function actionSubmitPart(){
        	 
        		if ( $('#qty_edit').val().trim()=='' ) {
        			alert("Please input qty. !");
        			$('#qty_edit').focus();
        			return false;
        		}
        		
        		if ( $('#qty_edit').val() <= 0 ) {
        			alert("Please input qty. more than 0 ");
        			$('#qty_edit').focus();
        			return false;
        		}

        		if ( $('#qty_bf_edit').val() > $('#qty_edit').val() ) {
        			alert("Please input qty more than current ");
        			$('#qty_edit').focus();
        			return false;
        		}

        		var jsond = {};
        		jsond.machine_ID = $('#machine_ID').val();
        		jsond.part_ID = $('#part_ID_edit').val();
        		jsond.qty = $('#qty_edit').val();
        		
         		console.log(jsond);

				bootbox.confirm({
			 		    title: "Confirm",
			 		    size: 'small',
			 		    message: "Confirm modify this part?",
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
					        	 

			 	        		$.ajax({
			 	        				method : "POST",
			 	        				data : jsond,
			 	        				url : cPath + "/machine/partMachineEdit"

			 	        			}).done(function(result) {
			 	        				
//  			 	        				alert("Save successfully !");
			 	        				
			 	        				$('#editPartMachineModal').modal('hide');	
			 	        				loadPart();

			 	        			}).fail(function(jqXHR, textStatus, errorThrown) {
			 	        				alert('ERROR');

			 	        			}); 
			 	        		
							 
			 		        }
			 		    }
			 		}); 
					
				
        }  
		</script>