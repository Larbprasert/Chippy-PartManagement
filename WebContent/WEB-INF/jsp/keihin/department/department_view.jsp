<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/department/department_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

<input name ="rAction" type="hidden" value="Delete">


        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Department View</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
            	<div class="col-lg-3">
				
				</div>   
				            
            	<div class="col-lg-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Department :</b> ${departmentBean.dept_name}
                        </div>                        
                        
                       		<div class="panel-body">
		                        <div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Department ID : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Department ID" name="dept_ID" value="${departmentBean.dept_ID}" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Department Name : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Department Name" name="dept_name" value="${departmentBean.dept_name}" readonly>
                       				</div>	
                       			</div>                       			
                       			<br>                       		
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Status : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Status" name="activeFlag_name" value="${departmentBean.activeFlag_name}" readonly>
                       				</div>	
                       			</div>
		                        				 	       
	                        </div>

	                        <div class="panel-footer">
						 	  	<input type ="button" value="Delete" name="rAction" role="button" class="btn btn-info" onclick="doDel('${DepartmentBean.dept_ID}')">
						 	  	<a href="${cPath}/department/department_edit.htm?dept_ID=${departmentBean.dept_ID}" class="btn btn-warning" role="button" aria-pressed="true" value="edit" name="rAction">Edit</a>
						 	  	<a href="${cPath}/department/department_list.htm" class="btn btn-secondary" role="button" aria-pressed="true">Back to List</a>  
	                        </div> 	                        

					</div>     
                    </div>
                    
            	<div class="col-lg-3">
				
				</div>   
				                    
                </div>
                <!-- /.col-lg-4 -->
           	</div>
</form>

<script type="text/javascript">
 	function doDel(dept_ID){
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
