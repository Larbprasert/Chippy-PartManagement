<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="/resources/adminLTE/common.jsp" %>

<body class="${bodySkin}">

<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<div class="content-wrapper">

	<section class="content-header">
		<h1>
			<i class='fa fa-id-card'></i> Contractor Maintenance
		</h1>
	</section>
	
	<section class="content">

		<div class="row">	<div class="col-lg-12">
		
		

<!-- 	#####  SEARCH >>>>> ####------------------- -->
	
		
		  <fieldset><div class="well">
		   <form class="form-horizontal" id="myForm" commandName="invOwner" method="post" data-toggle="validator"> 
		    
		    
		     <div class="col-lg-6">
                  
                   <div class="form-group">
	                    <label for="" class="col-lg-4 control-label">Company</label>
	                    <div class="col-lg-6">
	                     	<select  class="form-control" name="companyCode"  >
								<option value="">${_ALL}</option>
							    <c:forEach var="item" items="${LOV_COMPANY}">
							     	<option value="${item.code}" ${item.code == owner.companyCode ? 'selected="selected"' : ''}>${item.descTH}</option>
							    </c:forEach>
							</select>
	                    </div>
	                  </div>
	                  
                 </div>
	          
	          
                 
	          <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramStatus" class="col-lg-4 control-label">Section/Dept.</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="deptCode">
                       	<option value="">${_ALL}</option>
                       	<c:forEach var="item" items="${LOV_SECTION}"> 
					        <option value="${item.code}" ${item.descTH == invOwner.deptCode ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                      
                    </div>
                  </div>
             </div>
	          
	          
	          
		      <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Contractor No.</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="ownerCode" >
                    </div>
                  </div>
             </div>
	          
	          
	           <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Contractor Type</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="ownerType">
                       	<option value="">${_ALL}</option>
                       	<c:forEach var="item" items="${LOV_OWNER_TYPE}"> 
					        <option value="${item.code}" ${item.descTH == invOwner.ownerType ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                      
                    </div>
                  </div>
             </div>
	          
             
		      <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramDesc" class="col-lg-4 control-label">Contractor Name</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="firstName" >
                    </div>
                  </div>
             </div>
	          
	           <div class="col-lg-6">
	          	<div class="form-group">
                    <label for="assetType" class="col-lg-4 control-label">Status</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="activeFlg">
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
<!-- 								<button type="button" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
							</div>
						</div>
					</div>
				</div>

				</form></div>
            </fieldset>
<!--             </div></div> -->
        </div>
        </div>
<!-- 	##### <<<<<  SEARCH ####------------------- -->
	
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<!-- 		<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;New Contractor</button> -->
<!-- 		<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;Add Department</button> -->
<!-- 		  <br> -->
<!-- 		  <br> -->
		<div class="box box-primary"> 
			 <div class="box-header with-border">
	              <h3 class="box-title">Result</h3>
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool btn-success"   onclick="doAdd()"><i class="fa fa-plus"></i> Add
	                </button>
	              </div>
	            </div>
		 
		 <div class="box-body">
		   
<!-- 		<div class="bs-docs-section"> -->
<!-- 			<div class="bs-component"> -->
				<table class="table table-striped table-bordered" id="result-table"
					cellspacing="0" width="100%">
					<thead class="bg-green color-palette">
						<tr>
							<th class="text-center col-action">Action</th>
							<th class="text-center">Contractor No.</th>
							<th class="text-center">Contractor Name</th>
							<th class="text-center">Contractor Type</th>
							<th class="text-center">Company</th>
							<th class="text-center">Section/Department</th>
							<th class="text-center">Position</th>
							<th class="text-center">Mobile</th>
							<th class="text-center">Status</th>
<!-- 							<th class="text-center">Office</th>  -->
<!-- 							<th class="text-center">Create Date</th>  -->
<!-- 							<th class="text-center">Update Date</th>  -->
						</tr>
					</thead>
				</table>
			</div>
		</div>
		
	<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->


	</div>
	
</section>
	
	
	
		<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
 <script>
 	
 	function doAdd(){
		location = cPath+"/owner/ownerEdit.htm?add=Y";
 	}
 	
 	function doDel(ownerId, name){
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
			            url: cPath+"/owner/ownerDelete?ownerId="+ownerId
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
            url: cPath+"/owner/getDataTable.json",
            data: $('#myForm').serialize()
        }).done(function (result) {
            rsTable.clear().draw();
            if(result.recordsTotal>0){
	            rsTable.rows.add(result.data).draw();
            }else{
            	bootbox.confirm({
				    message: "No Data Found !! </br>  Do you want to create New Contractor ? ",
				    size: 'small',
				    buttons: {
				        confirm: {
				            label: 'Yes',
				            className: 'btn-success'
				        },
				        cancel: {
				            label: 'No',
				            className: 'btn-default'
				        }
				    },
				    callback: function (result) {
				        console.log('This was logged in the callback: ' + result);
				        if(result){
				        	location = cPath+"/owner/ownerEdit.htm?add=Y&next=Y";
				        }
				    }
				});
            }
           }).fail(function (jqXHR, textStatus, errorThrown) { 
                 // needs to implement if it fails
           });
 	};
 	
	var rsTable = $('#result-table').DataTable({
		autoWidth: false,
// 		data:[],
	    columns: [
	     	{ 
	     		"data": "ownerId"
		        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		            var txt = $roleEdit? "<a href='${cPath}/owner/ownerEdit.htm?edit=Y&ownerId="+oData.ownerId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
		        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
		        	if($roleDel){ txt += "<a href='javascript:void(0)' onclick=\"doDel('"+oData.ownerId+"','"+oData.ownerCode+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" };
		            $(nTd).html(txt);
		        } 
            },
			{ "data": "ownerCode" ,"sWidth": "120px"}, 
			{ 
	     		"data": "ownerId"
		       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		       		var tn =  oData.title+' '+oData.firstName+' '+oData.lastName;
		       		if($roleEdit){
			       		tn = "<a href='${cPath}/owner/ownerEdit.htm?edit=Y&ownerId="+oData.ownerId+"'>"+tn+"</a>";
			        }
		            $(nTd).html(tn);
		        } 
            },
			{ "data": "ownerType" }, 
			{ "data": "companyName" }, 
			{ "data": "deptName" }, 
			{ "data": "position" }, 
// 			{ "data": "position" ,"sWidth": "220px"}, 
			{ "data": "mobile","sWidth": "120px" },
			{ "data": "activeFlg" }
// 			{ "data": "officePhone" }
// 			{ "data": "createDateStr" }, 
// 				{ "data": "updateDateStr" }
	    ],
	       "aoColumnDefs": [
	      { "sClass": "text-center", "aTargets": [0,1,3,4,5,6,7] }
	    ],
	    rowCallback: function (row, data) {}, 
	    ordering: false, 
   	   	destroy: true 
//          ajax: cPath+"/owner/getDataTable.json"
	 });
	 
	$("#searchBtn").click(function(){
			var _f = $('#myForm').validator('validate');
			if (_f.has('.has-error').length==0) {
				 doSearch();
			} 
    });
    
	
</script>
	

</body>

</html>