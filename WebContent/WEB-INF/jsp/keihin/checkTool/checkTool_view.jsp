<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
	<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
	<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

  
 
  
<%-- <jsp:include page="../pages/header.jsp"></jsp:include> --%>
 
<%-- <jsp:include page="../pages/rSide.jsp"></jsp:include> --%>

<form action="/PartManagement/checkToolServlet" method="post">

        <div id="page-wrapper">
        
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">CheckTool View</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            
            
            <div class="row">
              	<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>CheckTool :</b> ${checkToolBean.checkTool_name}
                        </div>                        
                        

                       		<div class="panel-body">
                       		
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Check Tool ID : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="User Type ID" name="checkTool_ID" value="${checkToolBean.checkTool_ID}" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Check Tool Name : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="checkTool Name" name="checkTool_name" value="${checkToolBean.checkTool_name}" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Timing : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Timing" name="timing" value="${checkToolBean.timing_name}" readonly>
                       				</div>	
                       			</div>
                       			<br>                       		
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Status : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Status" name="activeFlag" value="${checkToolBean.activeFlag_name}" readonly>
                       				</div>	
                       			</div>		       							 	       
	                        </div>
	                        
	                        <div class="panel-footer">
	                             <button type="button" class="btn  btn-danger " onclick="doDel('${checkToolBean.checkTool_ID}')">Delete</button>
<%-- 		                        <a href="delete.jsp?checkTool_ID=${checkToolBean.checkTool_ID}" class="btn btn-danger" role="button" aria-pressed="true" value="delete" name="rAction">Delete</a>		                         --%>
						 	  	<a href="${cPath}/checkTool/checkTool_edit.htm?checkTool_ID=${checkToolBean.checkTool_ID}" class="btn btn-warning" role="button" aria-pressed="true" value="edit" name="rAction">Edit</a>
						 	  	<a href="${cPath}/checkTool/checkTool_list.htm" class="btn btn-secondary" role="button" aria-pressed="true">Back to List</a>  
	                        </div> 
					</div>     
                    </div>
              	<div class="col-lg-3">
				
				</div>                      
                </div>
                <!-- /.col-lg-4 -->
           	</div>

            
</form>            

<%-- <jsp:include page="../pages/footer.jsp"></jsp:include> --%>