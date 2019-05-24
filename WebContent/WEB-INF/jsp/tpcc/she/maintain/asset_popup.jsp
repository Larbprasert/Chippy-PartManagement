<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
  
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"> <i class='fa fa-list-alt'></i> Asset Detail</h4>
      </div>
      <div class="modal-body">
       
          <form class="form-horizontal" id="form">  
	         <fieldset disabled>
	         
	        <div class="row">  <div class="col-lg-6">
	          
	          <!-- 	 <------- Don't forget this Haha -->
				<input type="hidden" class="form-control" name="assetId" value="${invAsset.assetId}">
	          
                  <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Host ID</label>
                    <div class="col-lg-6">
						     <input type="text" class="form-control " name="hostId" value="${invAsset.hostId}" >
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Type</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="type" required>
<!--                        	<option value="">None</option> -->
                       	<c:forEach var="item" items="${LOV_ASSET_TYPE}"> 
					        <option value="${item.code}" ${item.code == invAsset.type ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                    </div>
                  </div>
                  
                   <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Status</label>
                    <div class="col-lg-6">
                      <select class="form-control" name="status" required>
<!--                        	<option value="">None</option> -->
                       	<c:forEach var="item" items="${LOV_ASSET_STATUS}"> 
					        <option value="${item.code}" ${item.code == invAsset.status ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                    </div>
                  </div>
                  
            	 <div class="form-group">
                    <label for="" class="col-lg-4 control-label">S/N</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control " name="sn" value="${invAsset.sn}"  >
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Brand</label>
                    <div class="col-lg-6">
						<select class="form-control" name="brand" required>
					 	  	<option value="">None</option>
	                       	<c:forEach var="item" items="${LOV_BRAND}"> 
						        <option value="${item.code}" ${item.code == invAsset.brand ? 'selected="selected"' : ''}>${item.descTH}</option>
						    </c:forEach>
	                      </select>                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Model</label>
                    <div class="col-lg-6">
						<select class="form-control" name="models" required>
							<option value="">None</option>
	                       	<c:forEach var="item" items="${LOV_MODEL}"> 
						        <option value="${item.code}" ${item.code == invAsset.models ? 'selected="selected"' : ''}>${item.descTH}</option>
						    </c:forEach>
	                      </select>                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Exp. Code</label>
                    <div class="col-lg-6">
			             <input type='text' class="form-control" name="expCode" value="${invAsset.expCode}"  />
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Fixed Asset</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name="fixedAsset"  value="${invAsset.fixedAsset}"  >
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Warranty Exp. Date</label>
                    <div class="col-lg-6">
			                <div class='input-group date'>
			                    <input type='text' class="form-control"  name='warrantyExpDate' value="${invAsset.warrantyExpDate}" required/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div>
                  
                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Docking S/N</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="dockingSn" value="${invAsset.dockingSn}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Docking ADP S/N</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="dockingAdpSn" value="${invAsset.dockingAdpSn}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">External DVD S/N</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="externalDvdSn"  value="${invAsset.externalDvdSn}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">PO number</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="poNumber"  value="${invAsset.poNumber}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Supplier</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="supplier"  value="${invAsset.supplier}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Warranty Type</label>
	                    <div class="col-lg-6">
			                <select class="form-control" name="warrantyType" >
<!-- 		                       	<option value="">None</option> -->
		                       	<c:forEach var="item" items="${LOV_WARRANTY_TYPE}"> 
							        <option value="${item.code}" ${item.code == invAsset.warrantyType ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
		                      </select>
                    </div>
	                  </div>
	                 
	                
	          </div>
	          
	          
	          
	          
	          <div class="col-lg-6">
	                 <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">CPU</label>
	                    <div class="col-lg-6">
						<select class="form-control" name="cpu" required>
							<option value="">None</option>
	                       	<c:forEach var="item" items="${LOV_CPU}"> 
						        <option value="${item.code}" ${item.code == invAsset.cpu ? 'selected="selected"' : ''}>${item.descTH}</option>
						    </c:forEach>
	                      </select>
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">RAM</label>
	                    <div class="col-lg-6">
							<select class="form-control" name="ram" required>
								<option value="">None</option>
		                       	<c:forEach var="item" items="${LOV_RAM}"> 
							        <option value="${item.code}" ${item.code == invAsset.ram ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
		                      </select>
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">HDD</label>
	                    <div class="col-lg-6">
							<select class="form-control" name="hdd" required>
								<option value="">None</option>
		                       	<c:forEach var="item" items="${LOV_HDD}"> 
							        <option value="${item.code}" ${item.code == invAsset.hdd ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
		                      </select>
	                    </div>
	                  </div>
	                  
	                    <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">S/N2</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="sn2"  value="${invAsset.sn2}" >
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">OS</label>
	                    <div class="col-lg-6">
	                      <select class="form-control" name="os" required>
								<option value="">None</option>
		                       	<c:forEach var="item" items="${LOV_OS}"> 
							        <option value="${item.code}" ${item.code == invAsset.os ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
		                      </select>
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Monitor Model</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="monitorModel"  value="${invAsset.monitorModel}" >
	                    </div>
	                  </div>
	                  
	                   <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Monitor S/N</label>
	                    <div class="col-lg-6"> 
	                      <input type="text" class="form-control  " name="monitorSn"  value="${invAsset.monitorSn}"  >
	                    </div>
	                  </div>
	                  
	                   <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Keyboard S/N</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="keyboardSn"  value="${invAsset.keyboardSn}"  >
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Mouse S/N</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control  " name="mouseSn"  value="${invAsset.mouseSn}" >
	                    </div>
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Bag</label>
	                    <div class="col-lg-6">
	                   	 <input type="text" class="form-control  " name="bagSn"  value="${invAsset.bagSn}" >
                       </div>
	                  </div>
	                  
	                  
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Pool Computer</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="poolComputer"  value="${invAsset.poolComputer}" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Head Count</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name="headcount"  value="${invAsset.headcount}" >
	                    </div>
	                  </div>
	                  
	                   <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Acquired Date</label>
	                    <div class="col-lg-6">
			                <div class='input-group date' >
			                    <input type='text' class="form-control"  name='acquiredDate' value="${invAsset.acquiredDate}" required/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    	</div>
	                  </div>
	                   
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Note</label>
	                    <div class="col-lg-6">
	                      <textarea class="form-control" rows="3" name="note" >${invAsset.note}</textarea>
	                    </div>
	                  </div>
	          </div>
</div> </fieldset>

 </form>
          
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      
    </div>
     