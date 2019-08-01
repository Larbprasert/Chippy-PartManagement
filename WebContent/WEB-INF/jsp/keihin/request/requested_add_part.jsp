<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ajax-bootstrap-select/1.4.5/css/ajax-bootstrap-select.min.css">


<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/ajax-bootstrap-select/1.4.5/js/ajax-bootstrap-select.min.js"></script>


		 <!-- Modal -->
		<div id="addPartModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static" >
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      
		      <div class="modal-header">
		      	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>        
		        <h4 class="modal-title"><i class="fa fa-wrench"></i> Add Maintenance Part</h4>
		      </div>
		      
		      <div class="modal-body">
		      
<!-- 		      <form action="#" id="addPartForm"  method="post" > -->
		      
		        <div class="row"> 
		        	<div class="col-lg-12">
				        <div class="form-group">
								<label >Part</label>
								<select id="part_ID" class="form-control selectpicker with-ajax" data-live-search="true"></select>
<!-- 			      			</div> -->
						</div>
					</div>
		        	<!-- <div class="col-lg-6">
						<div class="form-group">
								<label>Part Name</label>
								<input type="text" class="form-control" id="part_name" name="part_name" readonly>
						</div>
					</div> -->
				</div>
				
				
				
				 <div class="row"> 
				 		<div class="col-lg-6">
						<div class="form-group">
				   						<label >Qty. <b style="color: red;">*</b></label>
				   						<input type="text" class="form-control number text-right" name="qty" id="qty" value="">
				   						<input type="hidden" class="form-control number text-right" name="beforeQty" id="beforeQty" value="">
						</div>
						</div>
						<div class="col-lg-6">
						<div class="form-group">
							<label>Price</label>
							<input type="text" class="form-control number text-right" name="price" id="price" readonly  value="0">
						</div>
						</div>
				</div>
				
					<div class="row"> 
					 	<div class="col-lg-6">
						<div class="form-group">
							<label>Other Cost</label>
							<input type="text" class="form-control number text-right" name="other_cost" id="other_cost"  value="0">
						</div>
						</div>
						<div class="col-lg-6">
						<div class="form-group">
							<label>Total Cost</label>
							<input type="text" class="form-control number text-right" name="total_cost" id="total_cost" readonly  value="0">
						</div>
				      </div>
			      </div>
<!-- 			      </form> -->
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i> Close</button>
		        <button type="button" class="btn btn-success" id="addPartSubmit" onclick="actionSubmitPart()"><i class="fa fa-check-square-o"></i> Add</button>
		      </div>
		    </div>
		
		  </div>
		</div>
		
  <script type="text/javascript">
  
  var selPrice;
        $(document).ready(function() {

        	var options = {
//         			  values: "a, b, c",
        			  ajax: {
//         			    url:  cPath+"/partMaster/search.json",
        			    url:  cPath+"/partMachine/search.json",
        			    type: "POST",
        			    dataType: "json",
        			    data: {
//         			    	part_name: "{{{q}}}",
//         			    	sysPart_ID:reqId
        			    	part_name: "{{{q}}}",
        			    	machine_ID:reqId
        			    }
        			  },
        			  locale: {
        			    emptyTitle: "Select and Typing ID or Name"
        			  },
        			  log: 0,
        			  cache: false,
        		      clearOnEmpty: true,
        		      preserveSelected: false,
        		      emptyRequest: true,
        			  preprocessData: function(data) {
        				var data = data.data;
        			    var i,
        			      l = data.length,
        			      array = [];
        			    if (l) {
        			      for (i = 0; i < l; i++) {
        			        array.push(
//         			          $.extend(false, data[i], 
								{
	        			            text: data[i].part_ID+" - "+data[i].part_name,
	        			            value: data[i].part_ID,
	        			            data: {
// 	        			              price:data[i].price,
// 	        			              subtext: "["+data[i].qty+" "+data[i].unitType.unitType_name+"]"	

	        			              price:data[i].partMaster.price,
	        			              qty:data[i].qty,
	        			              subtext: "["+data[i].qty+" "+data[i].unitType.unitType_name+"]"	        			              

	        			            }
        			          }
        			        );
        			      }
        			    }
        			    // You must always return a valid array when processing data. The
        			    // data argument passed is a clone and cannot be modified directly.
        			    return array;
        			  }
        			};
        	
        	

        	
					$("#part_ID").selectpicker()
					.filter(".with-ajax")
					.ajaxSelectPicker(options);
// 				   $("select").trigger("change");
        
	        $('#part_ID').on('change', function(){
					selPrice =	 $(this).find(':selected').data('price');
		            console.log(selPrice);
		            
		            bfQty = $(this).find(':selected').data('qty');
		            console.log(bfQty);
		            
					if(selPrice>0){
						$('#price').val(selPrice.toFixed(2));
						$('#beforeQty').val(bfQty);
					}
		        	
		            if($('#qty').val()>0 && selPrice>0){
// 		        		$('#total_cost').val($('#qty').val()*selPrice);
		            	var v = parseFloat($('#qty').val()*selPrice) + parseFloat($('#other_cost').val());
		        		$('#total_cost').val(v.toFixed(2));
		        	}
	          });
	  });
        
        
        
        
        $('#qty').on('change', function(){
//         	if($('#qty').val()>=0 && selPrice>=0){
//         		$('#price').val($('#qty').val()*selPrice);
//         	}
        	if($('#qty').val()>=0 && selPrice>=0 && $('#other_cost').val()>=0){
        		var v = parseFloat($('#qty').val()*selPrice) + parseFloat($('#other_cost').val());
        		$('#total_cost').val(v.toFixed(2));
        	}
        	this.value = parseFloat(this.value).toFixed(0);
        	
        });
        
        $('#other_cost').on('change', function(){
        	if($('#qty').val()>=0 && selPrice>=0 && $('#other_cost').val()>=0){
        		var v = parseFloat($('#qty').val()*selPrice) + parseFloat($('#other_cost').val());
        		$('#total_cost').val(v.toFixed(2));
        	}
        	
        	this.value = parseFloat(this.value).toFixed(2);
        });

        
        function actionSubmitPart(){
        	 
        		if ( $('#qty').val().trim()=='' ) {
        			alert("Please input Qty !");
        			$('#qty').focus();
        			return false;
        		}
        		
        		if ( $('#qty').val() <= 0 ) {
        			alert("Please input Qty. more than 0 ");
        			$('#qty').focus();
        			return false;
        		}
        		
        		if ( $('#beforeQty').val() < $('#qty').val() ) {
        			alert("Can not input Qty more than inventory stock!!! ");
        			$('#qty').focus();
        			return false;
        		}
        		

        		var jsond = {};
        		jsond.request_ID = reqId;
        		jsond.part_ID = $('#part_ID').val();
        		jsond.part_qty = $('#qty').val();
        		jsond.part_price = $('#price').val();
        		jsond.other_cost = $('#other_cost').val();
        		jsond.total_cost = $('#total_cost').val();
        		
//         		console.log(jsond);

				bootbox.confirm({
			 		    title: "Confirm",
			 		    size: 'small',
			 		    message: "Confirm add this part?",
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
			 	        				url : cPath + "/request/repairUpdate"

			 	        			}).done(function(result) {
			 	        				
// 			 	        				alert("Save successfully !");
			 	        				
			 	        				$('#addPartModal').modal('hide');	
			 	        				loadPart();

			 	        			}).fail(function(jqXHR, textStatus, errorThrown) {
			 	        				alert('ERROR');

			 	        			}); 
			 	        		
							 
			 		        }
			 		    }
			 		}); 
					
				
        }  

        
        
        
		</script>