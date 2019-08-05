 <!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/userType/userType_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

<input name ="rAction" type="hidden" value="Delete">

<style>
	hr.style {
	/*   border: 1px solid grey; */
	  display: block;
	  margin-top: 0.5em;
	  margin-bottom: 0.5em;
	  margin-left: auto;
	  margin-right: auto;
	  border-style: inset;
	  border-width: 1px;
	}
</style>

<div class="content-wrapper">
		<section class="content-header">
			<h1 class="page-header">User Type - View</h1>
		</section> 
		<hr class="style">
		
		<section class="content">

<div class = "row">
                
			<div class="col-lg-3">
			
			</div>
                
			<div class="col-lg-6">
			    <div class="panel panel-success">
			        <div class="panel-heading">
			            <b>User Type :</b> ${userTypeBean.userType_name}
		        	</div>
                	
                	<div class="panel-body">
                	        
								<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>User Type ID:</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="User Type ID" name="userType_ID" value="${userTypeBean.userType_ID}" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>User Type Name:</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="User Type Name" name="userType_name" value="${userTypeBean.userType_name}" readonly>
                       				</div>	
                       			</div>                			
                       			<br>                       			
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Status : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Status" name="activeFlag_name" value="${userTypeBean.activeFlag_name}" readonly>
                       				</div>	
                       			</div>
		        	</div>
			    
				    <div class="panel-footer">
<%-- 	                             <button type="button" class="btn  btn-danger " onclick="doDel('${userTypeBean.userType_ID}')">Delete</button> --%>
						 	  	<input type ="button" value="Delete" name="rAction" role="button" class="btn btn-info" onclick="doDel('${userTypeBean.userType_ID}')">
<%-- 						 	  	<a href="${cPath}/userType/userType_edit.htm?userType_ID=${userTypeBean.userType_ID}" class="btn btn-warning" role="button" aria-pressed="true" value="edit" name="rAction">Edit</a> --%>
						 	  	<a href="${cPath}/userType/userType_list.htm" class="btn btn-secondary" role="button" aria-pressed="true">Back to List</a>  
		             </div>
	         	</div>
		    </div>
			     
			<div class="col-lg-3">
			
			</div>
                
		</div>
		
		</section>		
</div>


            
</form>            

<script type="text/javascript">
 	function doDel(userType_ID){
			bootbox.confirm({
			    title: "Confirm",
			    size: 'small',
			    message: _confirmDelTxt,
			    buttons: {
			        cancel: {
			            label: '<i class="fa fa-times"></i> Cancel'
			        },
			        confirm: {
			            label: '<i class="fa fa-check"></i> Confirm',
			            className: 'btn-success'
			        }
			    },
			    callback : function(result) {
					if (result) {
						 $("#myForm").submit();
					}
				}
			});
		};
		
		
		
</script>