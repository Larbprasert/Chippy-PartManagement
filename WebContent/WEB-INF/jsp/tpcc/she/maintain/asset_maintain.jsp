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
					<h3><i class='fa fa-laptop'></i> Asset Maintenance</h3>
				</div>
			</div>
		</div>
		
		
<!-- 	#####  SEARCH >>>>> ####------------------- -->
	<div class="row">	<div class="col-lg-12">
		
		  <fieldset><div class="well">
		   <form class="form-horizontal" id="myForm" commandName="invAsset" method="post"> 
		    
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
                    <label for="assetType" class="col-lg-4 control-label">Asset Type</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="type">
                       	<option value="">${_ALL}</option>
                       	<c:forEach var="item" items="${LOV_ASSET_TYPE}"> 
					        <option value="${item.code}" ${item.descTH == invAsset.type ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
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
                    <label for="" class="col-lg-4 control-label">Warranty Exp. Date</label>
                    <div class="col-lg-6">
			                <div class='input-group date' >
			                    <input type='text' class="form-control" name="warrantyExpDate"/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
                    </div>
                  </div>
                  </div>

				<div class="row">
					<div class="col-lg-12">
						<div class="form-group "> 
							<div class="col-lg-12 text-center">
								<button type="reset" class="btn btn-default"> &nbsp;<spring:message code="common.clearBtn"/> <i class="fa fa-refresh"></i></button>&nbsp;&nbsp;
								<button type="button" id="searchBtn" class="btn btn-primary"><spring:message code="common.searchBtn"/> <i class="fa fa-search"></i></button>&nbsp;&nbsp;
<!-- 								<button type="button" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
							</div>
						</div>
					</div>
				</div>

				</form></div>
            </fieldset>
            
        </div></div>
			
<!-- 	##### <<<<<  SEARCH ####------------------- -->


<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<div class="bs-docs-section">

        <div class="row">
          <div class="col-lg-12">
				<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;Add Asset</button>
		  <br>
		  <br>
           
            <div class="bs-component">
              <table class="table table-striped table-bordered" id="result-table" cellspacing="0" width="100%">
                <thead class="bg-green color-palette">
                  <tr>
					<th class="text-center">Action</th>					 
					<th class="text-center">Host ID</th>
					<th class="text-center">Asset Type</th>
					<th class="text-center">Status</th>
					<th class="text-center">S/N</th>
					<th class="text-center">Brand</th>
					<th class="text-center">Model</th>
					<th class="text-center">Exp. Code</th>
					<th class="text-center">Fixed Asset</th>
					<th class="text-center">Warranty Exp.</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                  </tr>
                </tbody>
              </table> 
            </div><!-- /example -->
          </div>
        </div>
      </div>
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->


	</div>
	
	
	
	
				<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
 <script>
 	
 	function doAdd(){
		location = cPath+"/asset/assetEdit.htm?add=Y";
 	}
 	
 	function doDel(paramId, name){
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
			            url: cPath+"/asset/assetDelete?paramId="+paramId
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
	
	function doSearch(){
		$.ajax({
            url: cPath+"/asset/getDataTable.json",
            data: $('#myForm').serialize()
        }).done(function (result) {
            rsTable.clear().draw();
            if(result.recordsTotal>0){
	            rsTable.rows.add(result.data).draw();
            }else{
            	bootbox.alert({
				    message: "No Data Found!",
				    size: 'small'
				});
            }
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
 	};
 	
		$('.date').datepicker({
			   format : 'dd/mm/yyyy'
		});
		
		
		var rsTable = $('#result-table').DataTable({
			autoWidth: false,
			data:[],
		    columns: [
		     	{ 
		     		"data": "hostId"
			        ,"sWidth": "60px"
			        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			       		var txt = $roleEdit? "<a href='${cPath}/asset/assetEdit.htm?edit=Y&assetId="+oData.assetId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
			        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
			        	if($roleDel){ txt += "<a href='javascript:void(0)' onclick=\"doDel('"+oData.assetId+"','"+oData.hostId+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" };
			            $(nTd).html(txt);
			        } 
	            },
				{ "data": "hostId" },
				{ "data": "type" },
				{ "data": "status" }, 
				{ "data": "sn" },
				{ "data": "brand" },
				{ "data": "models","sWidth": "160px" }, 
				{ "data": "expCode" }, 
				{ "data": "fixedAsset" }, 
				{ "data": "warrantyExpDate","sWidth": "100px" }
// 				{ "data": "updateBy" }, 
// 				{ "data": "updateDate" }, 
		    ],
		    "aoColumnDefs": [
		      { "sClass": "text-center", "aTargets": [0,2,3,4,5,6,7,8,9 ] }
		    ],
		    rowCallback: function (row, data) {},
		    ordering: false,
	   	   	destroy: true
		 });
		
		$("#searchBtn").click(function(){
			doSearch();
        });
	    

	
</script>
	

</body>

</html>