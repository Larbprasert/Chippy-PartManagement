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
					<h3><i class='fa fa-building'></i>  Department Maintenance</h3>
				</div>
			</div>
		</div>



		<div class="col-lg-12">
		
		

<!-- 	#####  SEARCH >>>>> ####------------------- -->
		<div class="row">
		
		  <fieldset><div class="well">
		   <form class="form-horizontal" id="myForm" commandName="invDept" method="post"> 
		    
		      <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Department Code</label>
                    <div class="col-lg-6">
                        <input type="text" class="form-control" name="deptCode" >
                    </div>
                  </div>
             </div>
	          
	          
	           <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Department Name</label>
                    <div class="col-lg-6">
                    	<input type="text" class="form-control" name="deptNameTh" >
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
            
        </div>
        </div>
<!-- 	##### <<<<<  SEARCH ####------------------- -->
	
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
		<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;Add Department</button>
		  <br>
		  <br>
		  
		<div class="bs-docs-section">
			<div class="bs-component">
				<table class="table table-striped table-bordered" id="result-table"
					cellspacing="0" width="100%">
					<thead class="bg-green color-palette">
						<tr>
							<th class="text-center col-action">Action</th>
							<th class="text-center">Department Code</th>
							<th class="text-center">Department TH</th>
							<th class="text-center">Department EN</th>
							<th class="text-center">Create Date</th>
<!-- 							<th class="text-center">Create By</th> -->
							<th class="text-center">Update Date</th>
<!-- 							<th class="text-center">Update By</th>  -->
						</tr>
					</thead>
				</table>
			</div>
<!-- 		</div> -->
		
	<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->


	</div>
	
	<hr>
	
<%-- 	<%@include file="/WEB-INF/jsp/tpcc/she/maintain/parameter_edit.jsp" %> --%>
	
	
	
		<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
 <script>
 	
 	function doAdd(){
		location = cPath+"/dept/deptEdit.htm";
 	};
 	
 	function doDel(deptId, name){
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
			            url: cPath+"/dept/deptDelete?deptId="+deptId
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
            url: cPath+"/dept/getDataTable.json",
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
		
		var rsTable = $('#result-table').DataTable({
			autoWidth: false,
			data:[],
		    columns: [
		     	{ 
		     		"data": "deptId"
			        ,"sWidth": "60px"
			        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			            var txt = $roleEdit? "<a href='${cPath}/dept/deptEdit.htm?deptId="+oData.deptId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
			        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
			        	if($roleDel){ txt += "<a href='javascript:void(0)' onclick=\"doDel('"+oData.deptId+"','"+oData.deptCode+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" };
			            $(nTd).html(txt);
			        } 
	            },
				{ "data": "deptCode" }, 
				{ "data": "deptNameTh" }, 
				{ "data": "deptNameEn" }, 
// 				{ "data": "email" }, 
// 				{ "data": "mobile" }, 
// 				{ "data": "officePhone" },
				{ "data": "createDateStr" },
 				{ "data": "updateDateStr" }
		    ],
		      "aoColumnDefs": [
		      { "sClass": "text-center", "aTargets": [0,1,4,5] }
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