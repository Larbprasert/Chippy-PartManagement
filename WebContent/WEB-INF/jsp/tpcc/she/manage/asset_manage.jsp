<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

	<%@include file="/resources/adminLTE/common.jsp" %>
 
</head>
<body>

	<!--  --- MENU --- -->
	<%@include file="/WEB-INF/jsp/tpcc/she/menu.jsp" %>



	<div class="container">

		<div class="page-header">
			<div class="row">
				<br>
				<div class="col-lg-8 col-md-7 col-sm-6">
					<h3><i class='fa fa-laptop'></i> Asset Management</h3>
				</div>
			</div>
		</div>
		
		
<!-- 	#####  SEARCH >>>>> ####------------------- -->
	<div class="row"><div class="col-lg-12">
		
		  <fieldset><div class="well">
		   <form class="form-horizontal" id="myForm" commandName="invAssetHistory" method="post"> 
		    
	          <div class="col-lg-6">
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Host ID</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name="hostId">
                    </div>
                  </div>
	          </div>
	          
	        <div class="col-lg-6">
                  <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Owner</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name="ownerCode">
                    </div>
                  </div>
	          </div>
	          
	          <div class="col-lg-6">
	                <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Serial No. (S/N)</label>
                    <div class="col-lg-6">
                      <input type="text" class="form-control" name="sn">
                    </div>
                  </div>
	          </div>
	          
	          <div class="col-lg-6">
	          	<div class="form-group">
                    <label for="assetType" class="col-lg-4 control-label">Asset Type</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="type">
                       	<option value="">${_ALL}</option>
                       	<c:forEach var="item" items="${LOV_ASSET_TYPE}"> 
					        <option value="${item.code}">${item.descTH}</option>
					    </c:forEach>
                      </select>
                    </div>
                  </div>
                 </div>
                 
	          <div class="col-lg-6">
	          	<div class="form-group">
                    <label for="assetType" class="col-lg-4 control-label">Asset Status</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="status">
                       	<option value="">${_ALL}</option>
                       	<c:forEach var="item" items="${LOV_ASSET_STATUS}"> 
					        <option value="${item.code}">${item.descTH}</option>
					    </c:forEach>
                      </select>
                    </div>
                  </div>
                 </div>

				<div class="col-lg-6">
	          	<div class="form-group">
                    <label for="assetType" class="col-lg-4 control-label">Owner Status</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="owner.activeFlg">
                       	<option value="">${_ALL}</option>
                       	<c:forEach var="item" items="${LOV_ACTIVE_TYPE}"> 
					        <option value="${item.code}">${item.descTH}</option>
					    </c:forEach>
                      </select>
                    </div>
                  </div>
                 </div>

				<div class="row">
					<div class="col-lg-12">
						<div class="form-group "> 
							<div class="col-lg-12 text-center">
								<button type="reset" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp;
								<button type="button" id="searchBtn" class="btn btn-primary"><spring:message code="common.searchBtn"/> <i class="fa fa-search"></i></button>&nbsp;&nbsp;
<!-- 								<button type="button" id="exportBtn" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
							</div>
						</div>
					</div>
				</div>

				</form></div>
           </div> </fieldset>
            
        </div>
			
<!-- 	##### <<<<<  SEARCH ####------------------- -->


<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<div class="bs-docs-section">

        <div class="row">
          <div class="col-lg-12">
				<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;Manage Asset</button>
		  <br>
		  <br>
           
            <div class="bs-component">
              <table class="table table-striped table-bordered" id="result-table" cellspacing="0" width="100%">
                <thead class="bg-green color-palette">
                  <tr>
										 
					<th class="text-center col-action">Action</th>
					<th class="text-center">Host ID</th>
					<th class="text-center">S/N</th>
					<th class="text-center">Type</th>
					<th class="text-center">Owner</th>
					<th class="text-center">Owner Status</th>
					<th class="text-center">Asset Status</th>
					<th class="text-center">Assigned Date</th>
					<th class="text-center">Expired Date</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table> 
            </div><!-- /example -->
          </div>
        </div>
      </div>
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->


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


	<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
 <script>
 	
		$('.date').datepicker({
			   format : 'dd/mm/yyyy'
		});
		
		
 	function doAdd(){
		location = cPath+"/assetmanage/assetEdit.htm?add=Y";
 	}
 	
 	function doDel(assetOwnerId, name){
		bootbox.confirm({
		    title: "Confirm",
		    size: 'small',
		    message: _confirmDelTxt+" : "+name,
		    buttons: {
		        cancel: {
		            label: '<i class="fa fa-times"></i> Cancel'
		        },
		        confirm: {
		            label: '<i class="fa fa-check"></i> Confirm',
		            className: 'btn-success'
		        }
		    },
		    callback: function (result) {
		        if(result){
		        	$.ajax({
			            url: cPath+"/assetmanage/assetDelete?assetOwnerId="+assetOwnerId
			        }).done(function (result) {
				        bootbox.alert({
						    message: _successDelTxt,
						    size: 'small',
						    callback: function(){doSearch();}
						});
		            }).fail(function (jqXHR, textStatus, errorThrown) { 
		            });
		        }
		    }
		});
	};
	
	var _exportData = {};
	
	function doSearch(){
		$.ajax({
            url: cPath+"/assetmanage/getDataTable.json",
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
		     		"data": "hostId"
			        ,"sWidth": "60px"
			        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			        	var txt = $roleEdit? "<a  href='${cPath}/assetmanage/assetEdit.htm?edit=Y&assetOwnerId="+oData.assetOwnerId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
			        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
			        	if($roleDel){ txt += "<a href='javascript:void(0)' onclick=\"doDel('"+oData.assetOwnerId+"','"+oData.hostId+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" };
			            $(nTd).html(txt);
			        } 
	            },
		     	{ 
		     		"data": "hostId"
			       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			            $(nTd).html('<a data-toggle="modal" onclick="doPopup()" href="${cPath}/asset/assetPopup.htm?modal=Y&assetId='+oData.invAsset.assetId+'" data-target="#myModal">'+oData.hostId+'</a>');
			        } 
	            },
				{ "data": "invAsset.sn" },
				{ "data": "invAsset.type" },
				{ 
		     		"data": "ownerCode"
		     		,"sWidth": "200px"
			       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			            $(nTd).html('<a data-toggle="modal" onclick="doPopup()" href="${cPath}/owner/ownerPopup.htm?ownerId='+oData.owner.ownerId+'" data-target="#myModal">'+oData.owner.firstName+" "+oData.owner.lastName+'</a>');
			        } 
	            },
				{ "data": "owner.activeFlg" ,"sWidth": "100px"},
				{ "data": "status","sWidth": "100px" },
				{ "data": "assignedDate" ,"sWidth": "100px"},
				{ "data": "expiredDate","sWidth": "100px" }
		    ],
		    
		    "aoColumnDefs": [
		       		      { "sClass": "text-center", "aTargets": [0,1,2,3,5,6,7] }
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
	
	
		/* ------------- Export Data ------------**/
		$("#exportBtn").click(function(){
			$('#exportBtn').attr('disabled',true);
			/* $.ajax({
	            url: cPath+"/assetmanage/getExportData.json",
	            data: $('#myForm').serialize()
	        }).done(function (result) {
	            if(result.recordsTotal>0){
	            	_exportData = result.data;
		            JSONToCSVConvertor(_exportData, "Asset_Management_Report", true);
	            	$('#exportBtn').attr('disabled',false);
	            }else{
					$('#exportBtn').attr('disabled',true);
	            	bootbox.alert({
					    message: "No Data Found!",
					    size: 'small'
					});
	            }
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 bootbox.alert({ message: "Error !", size: 'small' });
           }); */
        });
	
	  
	
</script>
	

</body>

</html>