<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


 <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><i class='fa fa-newspaper-o'></i> Asset/Owner Detail</h4>
      </div>
      <div class="modal-body">
       
       
 <fieldset  disabled>
  <form class="form-horizontal" id="form"  commandName="invAssetHistory" >  
       <div class="row ">
        <div class="col-lg-6">
            <div class="form-group">
                 <label for="name" class="col-lg-4 control-label">Host ID</label>
                 <div class="col-lg-6">
                       <input type="text" class="form-control " name="hostId" value="${invAssetHistory.hostId}" >
                 </div>
               </div>
               <div class="form-group">
                 <label for="" class="col-lg-4 control-label">Owner${LOV_OWNER}</label>
                 <div class="col-lg-6">
                 	 <select  class="form-control selectpicker show-tick" data-live-search="true" name="ownerCode">
						    <c:forEach var="item" items="${LOV_OWNER}">
						     	<option value="${item.code}">${item.descTH}</option>
						    </c:forEach>
						</select>
<%--                      <input type="text" class="form-control " name="ownerCode" value="${invAssetHistory.ownerCode}" > --%>
                 </div>
               </div>
               
               <div class="form-group">
                 <label for="" class="col-lg-4 control-label">Assigned Date</label>
                 <div class="col-lg-6">
                <div class='input-group date'>
                    <input type='text' class="form-control"  id='assignedDate' name='assignedDate' value="${invAssetHistory.assignedDate}" required/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                 </div>
               </div>
               
               <div class="form-group">
                 <label for="" class="col-lg-4 control-label">Expired Date</label>
                 <div class="col-lg-6">
                <div class='input-group date' >
                    <input type='text' class="form-control" id='expiredDate' name='expiredDate' value="${invAssetHistory.expiredDate}" required/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                 </div>
               </div>
               
         	 </div>
        <div class="col-lg-6">
             <div class="form-group">
                 <label for="name" class="col-lg-2 control-label">Remark</label>
                    <div class="col-lg-8">
                       <textarea class="form-control" rows="8"  name='remark'>${invAssetHistory.remark}</textarea>
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
     