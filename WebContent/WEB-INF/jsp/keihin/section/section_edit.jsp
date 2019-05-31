<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/section/section_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

<input name ="rAction" type="hidden" value="Edit">

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Section Edit</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
            	<div class="col-lg-3">
				
				</div> 
				            
            	<div class="col-lg-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Section :</b> ${sectionBean.section_name}
                        </div>                        
                        
                       		<div class="panel-body">
		       					
		                        <div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Section ID:</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="User Type ID" name="section_ID" value="${sectionBean.section_ID}" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Section Name:</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="section Name" name="section_name" value="${sectionBean.section_name}">
                       				</div>	
                       			</div>                			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Department:</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<select class="form-control" name="department.dept_ID" required>
											  <c:forEach var="item" items="${LOV_DEPARTMENT}">
										     	<option value="${item.code}" ${item.code == sectionBean.department.dept_ID ? 'selected="selected"' : ''}  >${item.descTH}</option>
										    </c:forEach>			
	                                	</select>
                       				</div>	
                       			</div>                			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Status : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<select class="form-control" name="activeFlag" required>
											 <c:forEach var="item" items="${LOV_ACTIVE_FLG}">
										     	<option value="${item.code}" ${item.code == sectionBean.activeFlag ? 'selected="selected"' : ''}  >${item.descTH}</option>
										    </c:forEach>				
	                                	</select>
                       				</div>	
                       			</div>
		                        
		                        			 	       
	                        </div>
	                        <div class="panel-footer">
		                        <input type ="button" value="Save" name="rAction" role="button" class="btn btn-info" onclick="doSaveSection()">
                        		<a type="reset" class="btn btn-default" href="${cPath}/section/section_list.htm"  role="button" >Cancel</a>    
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

function doSaveSection() {

	bootbox.confirm({
		title : "Confirm",
		message : _confirmSaveTxt,
		buttons : {
			cancel : {
				label : '<i class="fa fa-times"></i> Cancel',
				className : 'btn-danger'
			},
			confirm : {
				label : '<i class="fa fa-check"></i> Confirm',
				className : 'btn-success'
			}
		},
		callback : function(result) {
			if (result) {
				 $("#myForm").submit();
			}
		}
	});
}
</script>  