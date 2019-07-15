<!DOCTYPE HTML>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div id="addPartModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">						
					<h4 class="modal-title">Add Use Part</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
									
					
					<div class="form-group">
						<label>Part ID</label>
						<input type="text" class="form-control" id="part_ID" name="part_ID" >
						
<!-- 							for test -->
						<input id="request_ID" type="hidden" value="<%=request_ID %>" />							
					</div>
					
					<div class="form-group">
						<label>Part Name</label>
						<input type="text" class="form-control" id="part_name" name="part_name" readonly>
					</div>
					
					<div class="form-group">
      						<label>Qty</label>
      						<input type="text" class="form-control" name="qty" id="qty">
      						<input type="hidden" class="form-control" name="beforeQty" id="beforeQty">
					</div>
					
					<div class="form-group">
						<label>Price</label>
						<input type="text" class="form-control" name="price" id="price" readonly >
					</div>
					
					<div class="form-group">
						<label>Other Cost</label>
						<input type="text" class="form-control" name="other_cost" id="other_cost">
					</div>
					
					<div class="form-group">
						<label>Total Cost</label>
						<input type="text" class="form-control" name="total_cost" id="total_cost" readonly>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="button" class="btn btn-success" value="Add" name="rAction" id="modalAdd">
				</div>				
			</div>
		</div>
	</div>
	
	
	
	