<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
     <link rel="stylesheet" href="${cPath}/resources/css/datepicker.css">
     <link rel="stylesheet" href="${cPath}/resources/css/dataTables.bootstrap.min.css">
	<script src="${cPath}/resources/js/bootstrap-datepicker.js"></script>
	<script src="${cPath}/resources/js/jquery.dataTables.min.js"></script>
	<script src="${cPath}/resources/js/dataTables.bootstrap.min.js"></script>
	
	
</head>

<body>

	<!--  --- MENU --- -->
	<%@include file="/WEB-INF/jsp/tpcc/she/menu.jsp" %>
	 <div class="container">
		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-8 col-md-7 col-sm-6">
					<h3>Add Asset</h3>
				</div>
			</div>
		</div>
<div id="Add_Asset" class="tabcontent">
  <p><div class="row">
		
		  <fieldset><div class="well">
		   <form class="form-horizontal">  
	          <div class="col-lg-6">
                  <div class="form-group">
                    <label for="name" class="col-lg-4 control-label">Host ID</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" id="name"  >
                    </div>
                    <button type="button" class="btn btn-primary">Check <i class="fa fa-check-square-o"></i></button>
                  </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Type</label>
                    <div class="col-lg-6">
                       <select class="form-control" id="ownerType">
                       	<option value="">${_ALL}</option>
                      </select>
                    </div>
                  </div>
                   <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Status</label>
                    <div class="col-lg-6">
                      <select class="form-control" id="ownerType">
                       	<option value="">${_ALL}</option>
                      </select>
                    </div>
                  </div>
            	 <div class="form-group">
                    <label for="" class="col-lg-4 control-label">S/N</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" id="name"  >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Brand</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" id="name"  >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Model</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" id="name"  >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">EXP</label>
                    <div class="col-lg-6">
			                <div class='input-group date' id='Assigned'>
			                    <input type='text' class="form-control" />
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Fixed Asset</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" id="name"  >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">WARRANTY EXP DATE</label>
                    <div class="col-lg-6">
			                <div class='input-group date' id='Assigned'>
			                    <input type='text' class="form-control" />
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div>
                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">DOCKING_SN</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">DOCKING_ADP_SN</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">EXTERNAL_DVD_SN</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">PO_NUMBER</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">SUPPLIER</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">WARRANTY_TYPE</label>
	                    <div class="col-lg-6">
			                <div class='input-group date' id='Assigned'>
			                    <input type='text' class="form-control" />
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">ACQUIRED_DATE</label>
	                    <div class="col-lg-6">
			                <div class='input-group date' id='Assigned'>
			                    <input type='text' class="form-control" />
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">S/N2</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	          </div>
	          <div class="col-lg-6">
	                 <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">CPU</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">RAM</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">HDD</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">OS</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">MONITOR_MODEL</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                   <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">MONITOR_SN</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                   <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">KEYBOARD_SN</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">MOUSE_SN</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">BAG</label>
	                    <div class="col-lg-6">
                      <select class="form-control" id="ownerType">
                       	<option value="">Yes</option>
                       	<option value="">No</option>
                      </select>
                       </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">POOL_COMPUTER</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">HEADCOUNT</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">CREATE_BY</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" id="name"  >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">CREATE_DATE</label>
	                    <div class="col-lg-6">
			                <div class='input-group date' id='Assigned'>
			                    <input type='text' class="form-control" />
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">UPDATE_BY</label>
	                    <div class="col-lg-6">
                      <select class="form-control" id="ownerType">
                       	<option value="">1</option>
                       	<option value="">2</option>
                      </select>
                        </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">UPDATE_DATE</label>
	                    <div class="col-lg-6">
			                <div class='input-group date' id='Assigned'>
			                    <input type='text' class="form-control" />
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">NOTE</label>
	                    <div class="col-lg-6">
	                      <textarea class="form-control" rows="3" id="name"></textarea>
	                    </div>
	                  </div>
	          </div>


				<div class="row">
					<div class="col-lg-12">
						<div class="form-group "> 
							<div class="col-lg-12 text-center">
								<button type="button" class="btn btn-primary"><i class="fa fa-check-square-o"></i> Save</button>&nbsp;&nbsp;
								<button type="reset" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp;
							</div>
						</div>
					</div>
				</div>

				</form></div>
            </fieldset>
            
        </div></p>
</div>
</div>
	
	<!-- 	##### <<<<<  TAB ####------------------- -->
	  <script>
 
	  $(document).ready(function() {
			
	    	$('.date').datepicker();
			
		    $('#result-table').DataTable({
		    	"destroy": true,
//	 	    	"searching": false,
//	    			 "ordering": false,
	   			 
	   			 "ajax": "${cPath}/resources/json/asset_maintain_data.json",
	   			 "columns": [
//	 	            { "data": "hostId"
//	 			       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
//	 			            $(nTd).html("<a href='#"+oData.name+"'>"+oData.name+"</a>");
//	 			        } 
//	 	            },
		            { "data": "hostId" },
		            { "data": "assetType" },
		            { "data": "model" },
		            { "data": "hostId" },
		            { "data": "hostId" },
		            { "data": "hostId" },
		            { "data": "hostId" },
		            { "data": "hostId" },
		            { "data": "hostId" },
		            { "data": "hostId" },
		            { "data": "hostId" },
		            { "data": "hostId" },
		            { "data": "hostId" },
		            { "data": "hostId" }
	       		 ]
		    
		    });
		});
	
</script>
	 <!-- 	##### <<<<<  TAB ####------------------- -->
</body>

</html>