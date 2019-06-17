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
			<i class='fa fa-users'></i> User Management
		</h1>
	</section>
	
	<section class="content">

		<div class="row"> <div class="col-lg-12">	
		
		

<!-- 	#####  SEARCH >>>>> ####------------------- -->
	
		
		 <div class="box box-primary"> 
		 <div class="box-header">
              <h3 class="box-title">Criteria</h3>
            </div>
		 
		 
		 <div class="box-body">
		 
<!-- 		  <fieldset><div class="well"> -->
		   <form class="form-horizontal" id="myForm" commandName="userProfile" method="post"> 
		    
		     <div class="col-lg-6">
	          	<div class="form-group">
                    <label for="paramCode" class="col-lg-4 control-label">User Name</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="userName" >
                    </div>
                  </div>
             </div>
	          
	         <div class="col-lg-6">
	          	<div class="form-group">
                    <label for="paramCode" class="col-lg-4 control-label">First/Last Name</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="firstNameTh" >
                    </div>
                  </div>
             </div>
	          
<!--              <div class="col-lg-6"> -->
<!-- 	          	<div class="form-group"> -->
<!--                     <label for="paramDesc" class="col-lg-4 control-label">Email</label> -->
<!--                     <div class="col-lg-6"> -->
<!--                        <input type="text" class="form-control" name="email" > -->
<!--                     </div> -->
<!--              	</div> -->
<!--              </div> -->
	          
	          
<!--              	<div class="col-lg-6"> -->
					
<!-- 						  <div class="form-group"> -->
<!-- 			                    <label for="" class="col-lg-4 control-label">Role</label> -->
<!-- 			                    <div class="col-lg-6"> -->
<%-- 			                       <select  class="form-control selectpicker" id="roleCode" name="roleCode" title="${_ALL}"  > --%>
<%-- 									    <option value="">${_ALL}</option> --%>
<%-- 									    <c:forEach var="item" items="${LOV_ROLE}"> --%>
<%-- 									     	<option value="${item.code}">${item.descTH}</option> --%>
<%-- 									    </c:forEach> --%>
<!-- 									</select> -->
<!-- 			                    </div> -->
<!-- 			              </div> -->
<!-- 			    </div> -->
			    
			 <div class="col-lg-6">
			           <div class="form-group">
			                    <label for="" class="col-lg-4 control-label">Section</label>
			                    <div class="col-lg-6">
<!-- 			                     	<select  class="form-control" name="companyCode"   > -->
<%-- 										<option value="">${_ALL}</option> --%>
<%-- 									    <c:forEach var="item" items="${}"> --%>
<%-- 									     	<option value="${item.code}" ${item.code == userProfile.companyCode ? 'selected="selected"' : ''}>${item.descTH}</option> --%>
<%-- 									    </c:forEach> --%>
<!-- 									</select> -->
									
									<select  class="form-control" name="companyCode"   >
										<option value="">${_ALL}</option>
									    <c:forEach var="item" items="${LOV_SECTION}">
									     	<option value="${item.code}" ${item.code == userProfile.section.section_ID ? 'selected="selected"' : ''}>${item.descTH}</option>
									    </c:forEach>
									</select>
									
			                    </div>
			                  </div>
			 	</div>
				 	
		 
	          
	          <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramStatus" class="col-lg-4 control-label">Status</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="activeFlg">
                       	<option value="">${_ALL}</option>
                       	<c:forEach var="item" items="${LOV_ACTIVE_TYPE}"> 
					        <option value="${item.code}" ${item.descTH == sysParam.active ? 'selected="selected"' : ''}>${item.descTH}</option>
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
<!-- 				</div> -->
<!--             </fieldset> -->
            
	        </div>
	        </div>  <!-- ---BOX -->
        </div>
        </div>
<!-- 	##### <<<<<  SEARCH ####------------------- -->
	
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<!-- 		<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;Add User</button> -->
<!-- 		  <br> -->
<!-- 		  <br> -->
		  
		  
		<div class="row">
				<div class="col-lg-12">	
				   <div class="box box-primary"> 
					 <div class="box-header with-border">
			              <h3 class="box-title">Result</h3>
			              <div class="box-tools pull-right">
			                <button type="button" class="btn btn-box-tool btn-success btn-table"   onclick="doAdd()"><i class="fa fa-plus"></i> Add
			                </button>
			              </div>
			            </div>
				 
				 <div class="box-body">
				 
							 
							<div class="bs-docs-section">
								<div class="bs-component">
									<table class="table table-striped table-bordered" id="result-table"
										cellspacing="0" width="100%">
										<thead class="bg-green color-palette">
											<tr>
												<th class="text-center col-action">Action</th>
												<th class="text-center">User Name</th>
												<th class="text-center">User Role</th>
												<th class="text-center">First Name</th>
												<th class="text-center">Last Name</th>
												<th class="text-center">Mobile</th>
<!-- 												<th class="text-center">Email</th> -->
												<th class="text-center">Company</th>
												<th class="text-center">Department</th>
												<th class="text-center">Status</th>
<!-- 												<th class="text-center">Create Date  </th>  -->
					<!-- 							<th class="text-center">Update Date     </th>  -->
											</tr>
										</thead>
									</table>
									
								</div>
							</div>
							
					</div>
				</div>
				
			<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
		
		
			</div>
			
		</div>	
		
	 </section> 

</div>	
<!-- 	<hr> -->
	
<%-- 	<%@include file="/WEB-INF/jsp/tpcc/she/maintain/parameter_edit.jsp" %> --%>
	
	
	
		<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
 <script>
 	
 	function doAdd(){
		location = cPath+"/admin/user/editUser.htm?add=Y";
 	};
 	
 	function doDel(userId, name){
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
				            url: cPath+"/admin/user/userDelete?userId="+userId
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
		
			$.ajax({
	             url: cPath+"/admin/user/getUserTable.json",
	            data: $('#myForm').serialize()
	        }).done(function (result) {
	            rsTable.clear().draw();
	            if(result.recordsTotal>0){
		            rsTable.rows.add(result.data).draw();
	            }else{
	            	bootbox.alert({
					    message: "No Data Found!",
					    size: 'small'
					});11
	            }
            }).fail(function (jqXHR, textStatus, errorThrown) { 
                  // needs to implement if it fails
            });
	 
 	
		var rsTable = $('#result-table').DataTable({
			autoWidth: false,
			data:[],
		    columns: [
	            { 
		     		"data": "userId"
		     		,"sWidth": "20px"
			        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			        	var txt = $roleEdit? "<a href='${cPath}/admin/user/editUser.htm?edit=Y&userId="+oData.userId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
			        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
			        	if($roleDel){ txt += "<a href='javascript:void(0)' onclick=\"doDel('"+oData.userId+"','"+oData.userName+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" };
			            $(nTd).html(txt);
			        } 
	            },
				{ "data": "userName" },
				{ "data": "roleName"
					 ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
				        	var txt =  oData.roleName.replace(/,/g,'<br>');
				            $(nTd).html(txt);
				        } 
				},
				{ "data": "firstNameTh" },
				{ "data": "lastNameTh" },
				{ "data": "mobile" },
// 				{ "data": "email" },
				{ "data": "companyName" },
				{ "data": "deptName" },
				{ "data": "activeFlg" }
// 				{ "data": "createDateStr" }
// 				{ "data": "updateDateStr" }
		    ],
		    "aoColumnDefs": [
		      { "sClass": "text-center", "aTargets": [0,5,6,7,8] }
		    ],
		    ordering: false,
	   	   	destroy: true
		 });
		
		$("#searchBtn").click(function(){
			  doSearch();
        });

	
</script>
	

</body>

