<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
  
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"> <i class='fa fa-edit'></i> View Person</h4>
      </div>
      <div class="modal-body">
       
          <form class="form-horizontal" id="form">  
	         <fieldset disabled>
	         
	        <div class="row">  <div class="col-lg-6">


                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Person Code</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="ownerCode" value="${invOwner.ownerCode}" ${empty param['ownerId']? '':'readonly'} required>
                    </div>
                  </div>
                   
            		<div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Title</label>
	                    <div class="col-lg-6">
	                       <select  class="form-control" name="title" required>
<!-- 								<option value="">${_ALL}</option> -->
							    <c:forEach var="item" items="${LOV_TITLE}">
							     	<option value="${item.code}" ${item.code == invOwner.title ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
						</select>
	                    </div>
	               </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">First Name</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name="firstName" value="${invOwner.firstName}">
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Mobile</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name="mobile" value="${invOwner.mobile}" >
                    </div>
                  </div>
                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Email</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="email" value="${invOwner.email}" >
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Position</label>
	                    <div class="col-lg-6">
	                      <select  class="form-control" name="position" required>
							    <c:forEach var="item" items="${LOV_POSITION}">
							     	<option value="${item.code}" ${item.code == invOwner.position ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
						</select>
	                    </div>
	                  </div>
	          </div>
	          
	          <div class="col-lg-6">
	          		  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Person Type</label>
	                    <div class="col-lg-6">
	                      <select  class="form-control" name="ownerType" required>
<!-- 								<option value="">${_ALL}</option> -->
							    <c:forEach var="item" items="${LOV_OWNER_TYPE}">
							     	<option value="${item.code}" ${item.code == invOwner.ownerType ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
						</select>
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Gender</label>
	                    <div class="col-lg-6">
	                       <select  class="form-control" name="gender" required>
<!-- 								<option value="">${_ALL}</option> -->
							    <c:forEach var="item" items="${LOV_GENDER}">
							     	<option value="${item.code}" ${item.code == invOwner.gender ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
						</select>
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Last Name</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="lastName" value="${invOwner.lastName}">
	                    </div>
	                  </div>
	                 <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Office Phone</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="officePhone" value="${invOwner.officePhone}">
	                    </div>
	                  </div>
	                  	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Department</label>
	                    <div class="col-lg-6">
	                     	<select  class="form-control" name="deptCode" required >
<!-- 								<option value="">None</option> -->
							    <c:forEach var="item" items="${LOV_SECTION}">
							     	<option value="${item.code}" ${item.code == invOwner.deptCode ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
							</select>
	                    </div>
	                  </div>
	                  
	                  
	                  
	                  <div class="form-group">
	                    <label for="assetType" class="col-lg-4 control-label">Status</label>
	                    <div class="col-lg-6">
	                       <select class="form-control" name="activeFlg">
	                       	<option value="">${_ALL}</option>
	                       	<c:forEach var="item" items="${LOV_ACTIVE_TYPE}"> 
						        <option value="${item.code}" ${item.code == invOwner.activeFlg ? 'selected="selected"' : ''}>${item.descTH}</option>
						    </c:forEach>
	                      </select>
	                    </div>
	                  </div>
	                  
	           </div>
	           
				 </div>

					<c:if test="${_SAVE_MODE}">
					<div class="row">
						<div class="col-lg-12">
							<div class="form-group "> 
								<div class="col-lg-12 text-center">
									<button type="button" id="cancelBtn" class="btn btn-default"><i class="fa fa-times-circle"></i> Cancel </button>&nbsp;
									<button type="button" id="saveBtn" class="btn btn-primary" ><i class="fa fa-check-square-o"></i> Save</button>&nbsp;&nbsp;
	<!-- 								<button type="reset" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp; -->
								</div>
							</div>
						</div>
					</div>
				</c:if>

	         
	       </fieldset>

 </form>
          
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      
    </div>
     