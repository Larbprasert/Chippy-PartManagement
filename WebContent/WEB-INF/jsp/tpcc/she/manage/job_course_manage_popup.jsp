<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


 <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><i class='fa fa-newspaper-o'></i> Claim Detail</h4>
      </div>
      <div class="modal-body">
       
       
 <fieldset  disabled>
  <form class="form-horizontal" id="form"  commandName="invClaimHistory" >  
	         <div class="row ">
	          <div class="col-lg-6">
	          <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Case no</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name='claimNo' value="${invClaimHistory.claimNo}">
                    </div>
                  </div>
                  
                   <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Host ID</label>
                    <div class="col-lg-6">
                    
                            <select  class="form-control selectpicker show-tick" data-live-search="true"  id="hostId" 
                            ${empty param['assetOwnerId']? '':'disabled'}  name="hostId">
								<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_ASSET}">
							     	<option value="${item.code}">${item.descTH}</option>
							    </c:forEach>
							</select>
                    </div>
<!--                     <button type="button" class="btn btn-primary">Check <i class="fa fa-check-square-o"></i></button> -->
                  </div>
                 <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Owner</label>
                    <div class="col-lg-6">
                      	<select  class="form-control selectpicker show-tick" data-live-search="true" id="ownerCode"  name="ownerCode">
                      			<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_OWNER}">
							     	<option value="${item.code}">${item.code} - ${item.descTH}</option>
							    </c:forEach>
							</select>
                    </div>
                  </div>
<!--                   <div class="form-group"> -->
<!--                     <label for="name" class="col-lg-4 control-label">S/N Asset</label> -->
<!--                     <div class="col-lg-6"> -->
<!--                       <input type="text" class="form-control" name="sn"  required> -->
<!--                     </div> -->
<!--                   </div> -->
                   <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Detail</label>
                    <div class="col-lg-6">
			                <input type="text" class="form-control" name="claimDetail">
                    </div>
                  </div>
                  </div>
	          <div class="col-lg-6">
                  <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Case Status</label>
                    <div class="col-lg-6">
                      <select class="form-control" name="claimStatus">
<!--                        	<option value="">None</option> -->
                       	<c:forEach var="item" items="${LOV_CLAIM_STATUS}"> 
					        <option value="${item.code}" ${item.code == invClaimHistory.claimStatus ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Submit date</label>
                     <div class="col-lg-6">
		                <div class='input-group date'>
		                    <input type='text' class="form-control"   name='startDate' value="${invClaimHistory.startDate}"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">On Site Date</label>
                    <div class="col-lg-6">
		                <div class='input-group date'>
		                    <input type='text' class="form-control"   name='finishDate' value="${invClaimHistory.finishDate}" />
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Ticket No</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name="claimCode"  >
                    </div>
                  </div>
                  
	                
	          </div> 
	          <div class="col-lg-12">
	               <div class="form-group">
                    <label for="name" class="col-lg-2 control-label">Remark</label>
                       <div class="col-lg-9">
                          <textarea class="form-control" rows="4"  name='remark'>${invAssetHistory.remark}</textarea>
                  <!--     		<div class="form-group">
   			 <label for="exampleInputFile">File input</label>
    		<input type="file" id="exampleInputFile">
    		<p class="help-block">Example block-level help text here.</p>
  			</div> -->
                       </div>
                    </div>
                    
             </div>
				</div>

				</form>
         </fieldset>

      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      
    </div>
     