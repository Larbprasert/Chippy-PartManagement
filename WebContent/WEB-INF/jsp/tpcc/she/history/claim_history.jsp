<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
<%-- 	<c:set var="menu_reg"  value="active"/> --%>

</head>

<body>

	<!--  --- MENU --- -->
	<%@include file="/WEB-INF/jsp/tpcc/she/menu.jsp" %>



	<div class="container">

		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-8 col-md-7 col-sm-6">
					<h3><i class='fa fa-wrench'></i> Claim History</h3>
				</div>
<!-- 				<hr> -->
			</div>
		</div>
		
		<div class="row"><div class="col-lg-12">
		
		  <fieldset><div class="well">
		   <form class="form-horizontal" id="myForm" commandName="invClaimHistory" method="post">  
          
	          <div class="col-lg-6">
	                  <div class="form-group">
	                    <label for="inputCase" class="col-lg-4 control-label">Case No.</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name ="claimNo">
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="name" class="col-lg-4 control-label">Ticket No.</label>
	                    <div class="col-lg-6">
	                    	<input type="text" class="form-control" name="claimCode">
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="name" class="col-lg-4 control-label">Host ID</label>
	                    <div class="col-lg-6">
	                    	<input type="text" class="form-control" name="hostId">
	                    </div>
	                  </div>
	                  <div class="form-group">
		                    <label for="" class="col-lg-4 control-label">Owner</label>
		                    <div class="col-lg-6">
		                    	 <input type="text" class="form-control" name="ownerCode">
		                    </div>
		               </div>
	            
	          </div>
	          <div class="col-lg-6">
	                  <div class="form-group">
	                    <label for="inputEmail" class="col-lg-4 control-label">S/N</label>
	                    <div class="col-lg-6">
	                      <input type="text" class="form-control" name ="sn" >
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Brand</label>
	                    <div class="col-lg-6">
	                    	<select  class="form-control selectpicker show-tick" data-live-search="true" name="invAsset.brand">
                      			<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_BRAND_ASSET}">
							     	<option value="${item.code}">${item.descTH}</option>
							    </c:forEach>
							</select>
	                    </div>
	                  </div>
	                  <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Model</label>
	                    <div class="col-lg-6">
	                    	<select  class="form-control selectpicker show-tick" data-live-search="true" name="invAsset.models">
                      			<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_MODEL_ASSET}">
							     	<option value="${item.code}">${item.descTH}</option>
							    </c:forEach>
							</select>
	                    </div>
	                  </div>
	                   <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Status</label>
	                    <div class="col-lg-6">
	                    	<select  class="form-control selectpicker show-tick" data-live-search="true" name="claimStatus">
                      			<option value="">--- Please Select ---</option>
							    <c:forEach var="item" items="${LOV_CLAIM_STATUS}">
							     	<option value="${item.code}">${item.descTH}</option>
							    </c:forEach>
							</select>
	                    </div>
	                  </div>
	<!--                   <div class="form-group"> -->
	<!--                     <div class="col-lg-10 col-lg-offset-2"> -->
	<!--                       <button type="reset" class="btn btn-default">Cancel</button> -->
	<!--                       <button type="submit" class="btn btn-primary">Submit</button> -->
	<!--                     </div> -->
	<!--                   </div> -->
	                
	          </div>
	          
				<div class="row">
					<div class="col-lg-12">
						<div class="form-group ">
							<div class="col-lg-12 text-center">
								<button type="reset" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp;
								<button type="button" id="searchBtn" class="btn btn-primary"><spring:message code="common.searchBtn"/> <i class="fa fa-search"></i></button>&nbsp;&nbsp;
							</div>
						</div>
					</div>
				</div>

				</form></div></div>
            </fieldset>
            
        </div>
		
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<div class="bs-docs-section">

        <div class="row">
          <div class="col-lg-12">
		  <br>
		  <br>
           
            <div class="bs-component">
              <table class="table table-striped table-bordered" id="result-table" cellspacing="0" width="100%">
                <thead class="bg-green color-palette">
                  <tr>
										 
					<th class="text-center col-action">Action</th>				 
					<th class="text-center">Case no</th>
					<th class="text-center">Status</th>
					<th class="text-center">Username</th>
					<th class="text-center">Detail</th>
					<th class="text-center">Hostname</th>
					<th class="text-center">Brand</th>
					<th class="text-center">S/N</th>
					<th class="text-center">Ticket No</th>
					<th class="text-center">Submit date</th>
					<th class="text-center">Onsite Date</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
<!--                     <td><a>Host Id  </a> </td> -->
<!--                     <td>Column  </td> -->
<!--                     <td>Column  </td> -->
<!--                     <td>Column  </td> -->
<!--                     <td>Column  </td> -->
<!--                     <td>Column  </td> -->
<!--                     <td>Column  </td> -->
<!--                     <td>Column  </td> -->
<!--                     <td>Column  </td> -->
<!--                     <td>Column  </td> -->
<!--                     <td>Column  </td> -->
                  </tr>
                </tbody>
              </table> 
            </div><!-- /example -->
          </div>
        </div>
      </div>
		
		
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
        <div class="modal-body">
            <div class="te"></div></div>
        </div>
    </div>
</div>
	</div>
	
	
<%-- 	<%@include file="/WEB-INF/jsp/tpcc/she/footer.jsp" %> --%>
				<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
 <script>
 function doPopup(){
		$('#myModal').removeData('bs.modal');
	};
 	
 function doAdd(){
		location = cPath+"/claim/claimEdit.htm?add=Y";
	}
	$(document).ready(function() {
		$('.date').datepicker({
			   format : 'dd/mm/yyyy'
		});
		
		function doSearch(){
			$.ajax({
	            url: cPath+"/claim/getDataTable.json",
	            data: $('#myForm').serialize()
	        }).done(function (result) {
	            rsTable.clear().draw();
	            if(result.recordsTotal>0){
	            	$('#exportBtn').attr('disabled',false);
	            	_exportData = result.data;
		            rsTable.rows.add(result.data).draw();
	            }else{
					$('#exportBtn').attr('disabled',true);
	            	bootbox.alert({
					    message: "No Data Found!",
					    size: 'small'
					});
	            }
	           }).fail(function (jqXHR, textStatus, errorThrown) { 
	                 // needs to implement if it fails
	           });
	 	};
	 	
	 	function doPopup(){
			$('#myModal').removeData('bs.modal');
	 	};
		
		var rsTable = $('#result-table').DataTable({
			autoWidth: false,
			data:[],
		    columns: [
				    
		     	{ 
		     		"data": "claimId"
		     		,"sWidth": "60px"
			       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			    	   var txt = $roleView? "<a data-toggle=\"modal\" data-target=\"#myModal\" onclick='doPopup()' href='${cPath}/claim/claimPopup.htm?claimId="+oData.claimId+"'><i class='fa fa-list-alt fa-lg'></i></a>" : "";
			    	    $(nTd).html(txt);
			        } 
	            },
	            
	            { "data": "claimNo" },
	            
				{ "data": "claimStatus" },
				
				{ 
		     		"data": "ownerCode"
		     		,"sWidth": "200px"
			       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			            $(nTd).html('<a data-toggle="modal" onclick="doPopup()" href="${cPath}/owner/ownerPopup.htm?ownerId='+oData.owner.ownerId+'" data-target="#myModal">'+oData.owner.firstName+" "+oData.owner.lastName+'</a>');
			        } 
	            },
				
				{ "data": "claimDetail" },
				{ 
		     		"data": "hostId"
			       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			            $(nTd).html('<a data-toggle="modal" onclick="doPopup()" href="${cPath}/asset/assetPopup.htm?modal=Y&assetId='+oData.invAsset.assetId+'" data-target="#myModal">'+oData.hostId+'</a>');
			        } 
	            }, 
				{ "data": "invAsset.brand" }, 
				{ "data": "invAsset.sn" },
 				{ "data": "claimCode" }, 
 				{ "data": "startDate" },
 				{ "data": "finishDate" },
// 				{ "data": "updateDate" }, 
		    ],
		    
		    "aoColumnDefs": [
		       		      { "sClass": "text-center", "aTargets": [0,1,2,3,4,5,6,7,8,9,10] }
		       		    ],
		  rowCallback: function (row, data) {},
// 		    filter: false,
// 		    info: false,
		    ordering: false,
// 		    processing: true,
	   	   	destroy: true
// 		    retrieve: true      
	//    		searching: false
		 });
		
		$("#searchBtn").click(function(){
            doSearch();
        });
	    


// 		buildDDL();
		
	});
	
	
</script>
</body>

</html>