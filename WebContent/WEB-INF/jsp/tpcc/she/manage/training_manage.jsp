<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="/resources/adminLTE/common.jsp" %>

<body class="${bodySkin}">

<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

<div class="content-wrapper">


	<section class="content-header">
		 <h1><i class='fa fa-id-card'></i> Personal Training</h1>
	</section>
		
	 <section class="content">
	 
	 
	<div class="row"><div class="col-lg-12">
		
<!-- 		 <div class="box box-primary">  -->
<!-- 		 	<div class="box-header with-border"> -->
<!--               <h3 class="box-title">Criteria</h3> -->
<!--             </div> -->
		 
		 
<!-- 		 <div class="box-body"> -->
		 
		 <fieldset><div class="well">
		   <form class="form-horizontal" id="myForm" commandName="invOwner" method="post"  data-toggle="validator"> 
		    
		    
	      
	          
<!-- 	           <div class="col-lg-6"> -->
<!-- 	          <div class="form-group"> -->
<!--                     <label for="" class="col-lg-4 control-label">Contractor Type</label> -->
<!--                     <div class="col-lg-6"> -->
<!--                        <select class="form-control" name="ownerType"> -->
<%--                        	<option value="">${_ALL}</option> --%>
<%--                        	<c:forEach var="item" items="${LOV_OWNER_TYPE}">  --%>
<%-- 					        <option value="${item.code}" ${item.descTH == invOwner.ownerType ? 'selected="selected"' : ''}>${item.descTH}</option> --%>
<%-- 					    </c:forEach> --%>
<!--                       </select> -->
                      
<!--                     </div> -->
<!--                   </div> -->
<!--              </div> -->
	          
             
		      
	          
	          
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
                    <label for="paramDesc" class="col-lg-4 control-label">Contractor Name</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="firstName" >
                    </div>
                  </div>
             </div>
             
             
	          
	               <div class="col-lg-6">
	          <div class="form-group">
                    <label for="" class="col-lg-4 control-label">Position</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="position">
                       	<option value="">${_ALL}</option>
                       	<c:forEach var="item" items="${LOV_POSITION}"> 
					        <option value="${item.code}" ${item.descTH == invOwner.position ? 'selected="selected"' : ''}>${item.descTH}</option>
					    </c:forEach>
                      </select>
                      
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

				</form>
				
				</div>   </fieldset>
<!--               </div>  </div> -->
        </div>
		 </div>	
<!-- 	##### <<<<<  SEARCH ####------------------- -->


<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<div class="row"><div class="col-lg-12">	
		   <div class="box box-primary"> 
		    <div class="box-header with-border">
              <h3 class="box-title">Result</h3>
              
            </div>
		 
		 <div class="box-body">
		 
<!-- <div class="bs-docs-section"> -->

<!--         <div class="row"> -->
<!--           <div class="col-lg-12"> -->
<!-- 				<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;New Training</button> -->
<!-- 		  <br> -->
           
            <div class="bs-component">
              <table class="table table-striped table-bordered" id="result-table" cellspacing="0" width="100%">
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
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table> 
            </div><!-- /example -->
          </div>
        </div>
      </div>
      </div>
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->

</section>

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
		location = cPath+"/training_manage/trainingEdit.htm?add=Y";
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
			            url: cPath+"/training_manage/assetDelete?assetOwnerId="+assetOwnerId
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
            url: cPath+"/training_manage/getDataTable.json",
            data: $('#myForm').serialize()
        }).done(function (result) {
            rsTable.clear().draw();
            if(result.recordsTotal>0){
            	$('#exportBtn').attr('disabled',false);
            	_exportData = result.data;
	            rsTable.rows.add(result.data).draw();
            }else{
				$('#exportBtn').attr('disabled',true);
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
 	
 	function doPopup(){
		$('#myModal').removeData('bs.modal');
 	};
 	
 	
		
		var rsTable = $('#result-table').DataTable({
			autoWidth: false,
			data:[],
		    columns: [
				{ 
	     		"data": "ownerId"
		        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		            var txt = $roleEdit? "<a href='${cPath}/training_manage/trainingEdit.htm?edit=Y&ownerId="+oData.ownerId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
		        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
		        	if($roleDel){ txt += "<a href='javascript:void(0)' onclick=\"doDel('"+oData.ownerId+"','"+oData.ownerCode+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" };
		            $(nTd).html(txt);
		        } 
            },
			{  
				"data": "ownerCode"
            },
//             { 
// 		     		"data": "ownerCode"
// 		     		,"sWidth": "200px"
// 			       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
// 			            $(nTd).html('<a data-toggle="modal" onclick="doPopup()" href="${cPath}/owner/ownerPopup.htm?ownerId='+oData.ownerId+'" data-target="#myModal">'+oData.firstName+" "+oData.lastName+'</a>');
// 			        } 
// 	            },
			{ 
	     		"data": "ownerId"
		       , "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		       		var tn =  oData.title+' '+oData.firstName+' '+oData.lastName;
// 		       		if($roleEdit){
// 		       			tn = "<a href='${cPath}/training_manage/trainingEdit.htm?edit=Y&ownerId="+oData.ownerId+"'>"+tn+"</a>";
// 			        }
		            $(nTd).html(tn);
		        } 
            },
			{ "data": "ownerType" }, 
			{ "data": "companyName" }, 
			{ "data": "deptName" }, 
// 			{ "data": "email" ,"sWidth": "220px"}, 
			{ "data": "positionName" },
			{ "data": "mobile","sWidth": "120px" },
			{ "data": "activeFlg" },
			{ "data": "firstName" },
			{ "data": "lastName" }
		    ],
		    
		    "aoColumnDefs": [
	      { "sClass": "text-center", "aTargets": [0,1,3,4,5,6,7]
	      
	       },{
                "targets": [ 9,10 ],
                "visible": false
            }
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
            var _f = $('#myForm').validator('validate');
			if (_f.has('.has-error').length==0) {
				 doSearch();
			} 
        });
	
	
		/* ------------- Export Data ------------**/
		$("#exportBtn").click(function(){
			$('#exportBtn').attr('disabled',true);
			/* $.ajax({
	            url: cPath+"/training_manage/getExportData.json",
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